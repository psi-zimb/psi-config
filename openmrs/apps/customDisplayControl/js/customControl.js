'use strict';

angular.module('bahmni.common.displaycontrol.custom')
  .directive('birthCertificate', ['observationsService', 'appService', 'spinner', function (observationsService, appService, spinner) {
    var link = function ($scope) {
      console.log("inside birth certificate");
      var conceptNames = ["HEIGHT"];
      $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/birthCertificate.html";
      spinner.forPromise(observationsService.fetch($scope.patient.uuid, conceptNames, "latest", undefined, $scope.visitUuid, undefined).then(function (response) {
        $scope.observations = response.data;
      }));
    };

    return {
      restrict: 'E',
      template: '<ng-include src="contentUrl"/>',
      link: link
    }
  }]).directive('deathCertificate', ['observationsService', 'appService', 'spinner', function (observationsService, appService, spinner) {
  var link = function ($scope) {
    var conceptNames = ["WEIGHT"];
    $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/deathCertificate.html";
    spinner.forPromise(observationsService.fetch($scope.patient.uuid, conceptNames, "latest", undefined, $scope.visitUuid, undefined).then(function (response) {
      $scope.observations = response.data;
    }));
  };

  return {
    restrict: 'E',
    link: link,
    template: '<ng-include src="contentUrl"/>'
  }
}]).directive('customTreatmentChart', ['appService', 'treatmentConfig', 'TreatmentService', 'spinner', '$q', function (appService, treatmentConfig, treatmentService, spinner, $q) {
  var link = function ($scope) {
    var Constants = Bahmni.Clinical.Constants;
    var days = [
      'Sunday',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday'
    ];
    $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/customTreatmentChart.html";

    $scope.atLeastOneDrugForDay = function (day) {
      var atLeastOneDrugForDay = false;
      $scope.ipdDrugOrders.getIPDDrugs().forEach(function (drug) {
        if (drug.isActiveOnDate(day.date)) {
          atLeastOneDrugForDay = true;
        }
      });
      return atLeastOneDrugForDay;
    };

    $scope.getVisitStopDateTime = function () {
      return $scope.visitSummary.stopDateTime || Bahmni.Common.Util.DateUtil.now();
    };

    $scope.getStatusOnDate = function (drug, date) {
      var activeDrugOrders = _.filter(drug.orders, function (order) {
        if ($scope.config.frequenciesToBeHandled.indexOf(order.getFrequency()) !== -1) {
          return getStatusBasedOnFrequency(order, date);
        } else {
          return drug.getStatusOnDate(date) === 'active';
        }
      });
      if (activeDrugOrders.length === 0) {
        return 'inactive';
      }
      if (_.every(activeDrugOrders, function (order) {
        return order.getStatusOnDate(date) === 'stopped';
      })) {
        return 'stopped';
      }
      return 'active';
    };

    var getStatusBasedOnFrequency = function (order, date) {
      var activeBetweenDate = order.isActiveOnDate(date);
      var frequencies = order.getFrequency().split(",").map(function (day) {
        return day.trim();
      });
      var dayNumber = moment(date).day();
      return activeBetweenDate && frequencies.indexOf(days[dayNumber]) !== -1;
    };

    var init = function () {
      var getToDate = function () {
        return $scope.visitSummary.stopDateTime || Bahmni.Common.Util.DateUtil.now();
      };

      var programConfig = appService.getAppDescriptor().getConfigValue("program") || {};

      var startDate = null, endDate = null, getEffectiveOrdersOnly = false;
      if (programConfig.showDetailsWithinDateRange) {
        startDate = $stateParams.dateEnrolled;
        endDate = $stateParams.dateCompleted;
        if (startDate || endDate) {
          $scope.config.showOtherActive = false;
        }
        getEffectiveOrdersOnly = true;
      }

      return $q.all([treatmentConfig(), treatmentService.getPrescribedAndActiveDrugOrders($scope.config.patientUuid, $scope.config.numberOfVisits,
        $scope.config.showOtherActive, $scope.config.visitUuids || [], startDate, endDate, getEffectiveOrdersOnly)])
        .then(function (results) {
          var config = results[0];
          var drugOrderResponse = results[1].data;
          var createDrugOrderViewModel = function (drugOrder) {
            return Bahmni.Clinical.DrugOrderViewModel.createFromContract(drugOrder, config);
          };
          for (var key in drugOrderResponse) {
            drugOrderResponse[key] = drugOrderResponse[key].map(createDrugOrderViewModel);
          }

          var groupedByVisit = _.groupBy(drugOrderResponse.visitDrugOrders, function (drugOrder) {
            return drugOrder.visit.startDateTime;
          });
          var treatmentSections = [];

          for (var key in groupedByVisit) {
            var values = Bahmni.Clinical.DrugOrder.Util.mergeContinuousTreatments(groupedByVisit[key]);
            treatmentSections.push({visitDate: key, drugOrders: values});
          }
          if (!_.isEmpty(drugOrderResponse[Constants.otherActiveDrugOrders])) {
            var mergedOtherActiveDrugOrders = Bahmni.Clinical.DrugOrder.Util.mergeContinuousTreatments(drugOrderResponse[Constants.otherActiveDrugOrders]);
            treatmentSections.push({
              visitDate: Constants.otherActiveDrugOrders,
              drugOrders: mergedOtherActiveDrugOrders
            });
          }
          $scope.treatmentSections = treatmentSections;
          if ($scope.visitSummary) {
            $scope.ipdDrugOrders = Bahmni.Clinical.VisitDrugOrder.createFromDrugOrders(drugOrderResponse.visitDrugOrders, $scope.visitSummary.startDateTime, getToDate());
          }
        });
    };
    spinner.forPromise(init());
  };

  return {
    restrict: 'E',
    link: link,
    scope: {
      config: "=",
      visitSummary: '='
    },
    template: '<ng-include src="contentUrl"/>'
  }
}])
  .directive('numberOfWeeksForProgram', ['programService', 'appService', 'spinner', function (programService, appService, spinner) {
    var link = function ($scope) {
      var ARTProgramName = "ART Program";
      var _1stLineConceptName = "1st Line";

      var calculateWeeksBetween = function (startDate, stopDate) {
        var ONE_WEEK = 1000 * 60 * 60 * 24 * 7;
        var startDateInMilliSeconds = startDate.getTime();
        var stopDateInMilliSeconds = stopDate.getTime();
        var difference_ms = Math.abs(startDateInMilliSeconds - stopDateInMilliSeconds);
        return Math.round(difference_ms / ONE_WEEK);
      };

      var findActiveARTProgram = function (activePrograms) {
        return _.find(activePrograms, function (program) {
          return program.display === ARTProgramName;
        })
      }

      var findLastEndedARTProgram = function (endedPrograms) {
        var endedARTPrograms = _.filter(endedPrograms, function (program) {
          return program.display === ARTProgramName;
        })
        var sortedByDate = _.sortBy(endedARTPrograms, function (program) {
          return new Date(program.dateCompleted);
        });
        return _.last(sortedByDate)
      }

      var find1stLineState = function (artProgram) {
        return _.find(artProgram.states, function (currentState) {
          return currentState.state.concept.display === _1stLineConceptName;
        });
      }

      $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/numberOfWeeksForProgram.html";
      spinner.forPromise(programService.getPatientPrograms($scope.patient.uuid, false, undefined).then(function (response) {
        var activeARTProgram = findActiveARTProgram(response.activePrograms);
        if (activeARTProgram) {
          var _1stLineState = find1stLineState(activeARTProgram);
          if (_1stLineState) {
            var startDateValue = _1stLineState.startDate;
            var stopDate = new Date();
            $scope.numberOfWeeks = calculateWeeksBetween(new Date(startDateValue), stopDate);
          }

        } else {
          var lastEndedARTProgram = findLastEndedARTProgram(response.endedPrograms);
          if (lastEndedARTProgram) {
            var _1stLineState = find1stLineState(lastEndedARTProgram);
            if (_1stLineState) {
              var startDateValue = _1stLineState.startDate;
              var stopDate = lastEndedARTProgram.dateCompleted;
              $scope.numberOfWeeks = calculateWeeksBetween(new Date(startDateValue), stopDate);
            }
          }
        }
      }));


    };

      return {
        restrict: 'E',
        link: link,
        scope: {
          patient: "=",
          section: "="
        },
        template: '<ng-include src="contentUrl"/>'
      }
    }])
    .directive('ncdDisplay', ['ngDialog', 'programService', 'appService', 'spinner', '$q', '$http', function (ngDialog, programService, appService, spinner, $q, $http) {
      var controller = function ($scope) {
        $scope.togglencd = true;
        $scope.error_message = '';
        $scope.checkDisplayExpandedView = (id) => {
          return $('#'+id).is(":visible");
        }

        $scope.toggleDisplayExpandedView = (id)=>{
          if($('#'+id).hasClass('ng-hide'))
            $('#'+id).removeClass('ng-hide');
          else
            $('#'+id).toggle();
        }

        $scope.toggleShowNCD = function () {
          $scope.togglencd = !$scope.togglencd;
        };

        $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/ncdDisplay.html";
        $scope.urlbase = appService.configBaseUrl();
        var getResponseFromQuery = function (queryParameter) {
          var params = {
            patientUuid: $scope.patient.uuid,
            q: queryParameter,
            v: "full"
          };

          return $http.get('/openmrs/ws/rest/v1/bahmnicore/sql', {
            method: "GET",
            params: params,
            withCredentials: true
          });
        };

        $scope.formsData = []; // actual forms data for all visits
        $scope.getListFromResponse = function(response,limit) {

          let encounterFormMap = _.groupBy(response[0].data,'encounter_id');
          //take first 20 visits only
          let visits = Object.keys(encounterFormMap).
          sort((v1,v2) => {return v2-v1}).
          slice(0,limit);
          //set the data for visits in map
          let list = [];
          visits.forEach((visit) => {
            list.push(encounterFormMap[visit]);
          });
          return list;
        }

        $scope.expandedViewDialog = function () {
          spinner.forPromise($q.all([getResponseFromQuery("bahmni.sqlGet.getLatestNCD20visits")]).then(function (response) {

            $scope.formsData = $scope.getListFromResponse(response,20);
            if($scope.formsData.length == 0)
              $scope.error_message='NO_DATA_FOR_NCD_FOUND';
          }));

          ngDialog.open({
            template: $scope.urlbase + '/customDisplayControl/views/' + 'customDialogDetails.html',
            className: 'ngdialog-theme-default',
            scope: $scope
          });
        };

        spinner.forPromise($q.all([getResponseFromQuery("bahmni.sqlGet.getLatestNCDFormInformation")]).then(function (response) {
          $scope.latestEncounterData = $scope.getListFromResponse(response,1);
        }));

      };

      return {
        restrict: 'E',
        controller: controller,
        scope: {
          patient: "=",
          config: "=",
          section: "=",
          enrollment: "=",
          visitSummary: "=",
          showDetailsButton: "=?"
        },
        template: '<ng-include src="contentUrl"/>'
      }
    }])
  .directive('ipvDisplay',['ngDialog','programService','appService','spinner','$q','$http', function (ngDialog, programService, appService, spinner, $q, $http) {
    var controller = function($scope) {
      $scope.toggleipv = true;
      $scope.visitRecordsToBeDislayed = 20;
      $scope.urlbase = appService.configBaseUrl();
      $scope.contentUrl = appService.configBaseUrl() + "/customDisplayControl/views/ipvDisplay.html";
      $scope.toggleShowIPV = () => {
        $scope.toggleipv = !$scope.toggleipv;
      };
      $scope.checkDisplayExpandedView = (id) => {
        return $('#'+id).is(":visible");
      }
      $scope.toggleDisplayExpandedView = (id)=>{
        if($('#'+id).hasClass('ng-hide'))
          $('#'+id).removeClass('ng-hide');
        else
          $('#'+id).toggle();
      }
      var getResponseFromQuery = function (queryParameter) {
        var params = {
          patientUuid: $scope.patient.uuid,
          q: queryParameter,
          v: "full"
        };

        return $http.get('/openmrs/ws/rest/v1/bahmnicore/sql', {
          method: "GET",
          params: params,
          withCredentials: true
        });
      };

      //fetch the data for basic view
      spinner.forPromise($q.all([getResponseFromQuery("bahmni.sqlGet.getIPVLatestEncounter")]).then(response => {
        $scope.latestEncounterData = response[0].data;
      }));

      $scope.formsData = []; // actual forms data for all visits
      $scope.expandedViewDialog = () => {
          spinner.forPromise($q.all([getResponseFromQuery("bahmni.sqlGet.getIPV20LatestVisits")]).then(function (response) {

          let encounterFormMap = _.groupBy(response[0].data,'encounter_id');
          //take first 20 visits only
          let visits = Object.keys(encounterFormMap).
                              sort((v1,v2) => {return v2-v1}).
                              slice(0,20);
          //set the data for visits in map
          let list = [];
          visits.forEach((visit) => {
            list.push(encounterFormMap[visit]);
          });
          $scope.formsData = list;
        }));

        ngDialog.open({
          template: $scope.urlbase + '/customDisplayControl/views/' + 'expandedViewDialogDetails.html',
          className: 'ngdialog-theme-default',
          scope: $scope
        });
      };
    }
    return {
      restrict: 'E',
      controller: controller,
      scope: {
        patient: "=",
        config:"=",
        section:"=",
        enrollment:"=",
        visitSummary:"=",
        showDetailsButton:"=?"
      },
      template: '<ng-include src="contentUrl"/>'
    }
  }]);