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
      $scope.ncd=true;

      $scope.toggleDisplay = function(idValue) {
        var currentId = '#'+idValue;
        $(currentId).toggle();
      }

      $scope.checkDisplay = function(idValue) {
        var elementId = '#'+idValue;
        return $(elementId).is(":visible");
      }

      $scope.toggleShowNCD = function () {
        $scope.togglencd = !$scope.togglencd;
      };
      $scope.showNCD = function () {
        $scope.ncd = !$scope.ncd;
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
      $scope.dialogData = {
        "patient": $scope.patient,
        "section": $scope.section
      };
      $scope.isClickable = function () {
        return true;
      };

$scope.modifiedData = new Map();
$scope.encounterArray = [];

      $scope.normalDialog = function () {
        spinner.forPromise($q.all([getResponseFromQuery("bahmni.sqlGet.getBaseLineFormInformation")]).then(function (response) {
          $scope.responseDataSet1 = response[0].data;

      angular.forEach($scope.responseDataSet1, function(value, key) {
          if($scope.modifiedData.has(value.encounterId)){
              var list = $scope.modifiedData.get(value.encounterId);
              if(list.indexOf(value.name+"->"+value.ValueConcept+"->"+value.obs_datetime) == -1)
              {
                list.push(value.name+"->"+value.ValueConcept+"->"+value.obs_datetime);
              }
              $scope.modifiedData.set(value.encounterId,list);
          }
          else {
            var newList = [];
            newList.push(value.name+"->"+value.ValueConcept+"->"+value.obs_datetime);
            $scope.modifiedData.set(value.encounterId,newList);
          }
        });

        $scope.encounterArray = [];
        angular.forEach($scope.modifiedData,function(value,key){
          $scope.encounterArray.push(value);
        })

        }));

        ngDialog.open({
          template: $scope.urlbase + '/customDisplayControl/views/' + 'customDialogDetails.html',
          className: 'ngdialog-theme-default',
          scope: $scope
        });
      };

      spinner.forPromise($q.all([getResponseFromQuery("bahmni.sqlGet.getLast10NCDFormInformation")]).then(function (response) {
        $scope.responseDataSet = response[0].data;
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
  }
  ]);