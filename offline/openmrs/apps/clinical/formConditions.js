Bahmni.ConceptSet.FormConditions.rules = {
  'Reason for visit' : function (formName, formFieldValues) {
            var conditions = {show: [], hide: [],enable: [], disable: []};
            var obj = formFieldValues['Reason for visit'];

			if (obj.indexOf('Initial ART service')>=0 ) {
			         conditions.show.push("Provider name for ART Initial");
			         } else {
			           conditions.hide.push("Provider name for ART Initial");
			         }

			if (obj.indexOf('ART Routine Service')>=0 ) {
			         conditions.show.push("Provider name for ART Routine");
			         } else {
			           conditions.hide.push("Provider name for ART Routine");
			         }

			if (obj.indexOf('PrEP Initial')>=0 ) {
			         conditions.show.push("Provider name for PrEP Initial");
			         } else {
			           conditions.hide.push("Provider name for PrEP Initial");
			         }

			if (obj.indexOf('Unplanned or walk in visit')>=0 ) {
			         conditions.show.push("Provider name for Unplanned or Walk in Visit");
			         } else {
			           conditions.hide.push("Provider name for Unplanned or Walk in Visit");
			         }

			if (obj.indexOf('Urgent')>=0 ) {
			         conditions.show.push("Provider name for Urgent");
			         } else {
			           conditions.hide.push("Provider name for Urgent");
			         }

			if (obj.indexOf('Pick up Drugs (only)')>=0 ) {
			         conditions.show.push("Provider name for Pick up drugs (Only)");
			         } else {
			           conditions.hide.push("Provider name for Pick up drugs (Only)");
			         }

			if (obj.indexOf('Review by Nurse')>=0 ) {
			         conditions.show.push("Provider name for Review by Nurse");
			         } else {
			           conditions.hide.push("Provider name for Review by Nurse");
			         }

			if (obj.indexOf('Lab test (only)')>=0 ) {
			         conditions.show.push("Provider name for Lab Test (Only)");
			         } else {
			           conditions.hide.push("Provider name for Lab Test (Only)");
			         }

			if (obj.indexOf('Basic 1 and ART 1 service')>=0 ) {
			         conditions.show.push("Provider name for Basic 1 and ART 1");
			         } else {
			           conditions.hide.push("Provider name for Basic 1 and ART 1");
			         }

			if (obj.indexOf('Phone Call')>=0 ) {
			         conditions.show.push("Provider name for Phone Call");
			         } else {
			           conditions.hide.push("Provider name for Phone Call");
			         }

			if (obj.indexOf('Adherence Counselling')>=0 ) {
			         conditions.show.push("Provider name for Adherence counseling");
			         } else {
			           conditions.hide.push("Provider name for Adherence counseling");
			         }
			if (obj.indexOf('Enhanced Adherence Counselling')>=0 ) {
			         conditions.show.push("Provider name for Enhanced adherence counselling");
			         } else {
			           conditions.hide.push("Provider name for Enhanced adherence counselling");
			         }
			if (obj.indexOf('PrEP Continuation')>=0 ) {
			         conditions.show.push("Provider name for Prep Continuation");
			         } else {
			           conditions.hide.push("Provider name for Prep Continuation");
			         }

            if (obj.indexOf('HIV Self Testing')>=0 ) {
                     conditions.show.push("Provider name for HIV Self Testing");
                     } else {
                       conditions.hide.push("Provider name for HIV Self Testing");
                     }

            if (obj.indexOf('Provider Testing and Counseling')>=0 ) {
                     conditions.show.push("Provider name for Provider Testing and Counseling");
                     } else {
                       conditions.hide.push("Provider name for Provider Testing and Counseling");
                     }

            if (obj.indexOf('Confirmatory HIV testing and Counseling')>=0 ) {
                     conditions.show.push("Provider name for Confirmatory HIV testing and Counseling");
                     } else {
                       conditions.hide.push("Provider name for Confirmatory HIV testing and Counseling");
                     }

            if (obj.indexOf('Contact Tracing')>=0 ) {
                     conditions.show.push("Provider name for Contact Tracing");
                     } else {
                       conditions.hide.push("Provider name for Contact Tracing");
                     }

            if (obj.indexOf('Review by MD/Doctor')>=0 ) {
                     conditions.show.push("Provider name for Review by MD/Doctor");
                     } else {
                       conditions.hide.push("Provider name for Review by MD/Doctor");
                     }

            if (obj.indexOf('Hospital Visit')>=0 ) {
                     conditions.show.push("Provider name for Hospital Visit");
                     } else {
                       conditions.hide.push("Provider name for Hospital Visit");
                     }

              if (obj.indexOf('Viac Initial')>=0 ) {
                     conditions.show.push("Provider name for Viac Initial");
                     } else {
                       conditions.hide.push("Provider name for Viac Initial");
                     }

            if (obj.indexOf('Viac Continuation')>=0 ) {
                     conditions.show.push("Provider name for Viac Continuation");
                     } else {
                       conditions.hide.push("Provider name for Viac Continuation");
                     }

            if (obj.indexOf('VMMC')>=0 ) {
                     conditions.show.push("Provider name for VMMC");
                     } else {
                       conditions.hide.push("Provider name for VMMC");
                     }

            if (obj.indexOf('FP Initial')>=0 ) {
                     conditions.show.push("Provider name for FP Initial");
                     } else {
                       conditions.hide.push("Provider name for FP Initial");
                     }

            if (obj.indexOf('FP Counselling Only')>=0 ) {
                     conditions.show.push("Provider name for FP Counselling Only");
                     } else {
                       conditions.hide.push("Provider name for FP Counselling Only");
                     }

            if (obj.indexOf('FP Continuation')>=0 ) {
                     conditions.show.push("Provider name for FP Continuation");
                     } else {
                       conditions.hide.push("Provider name for FP Continuation");
                     }

            if (obj.indexOf('VAWG')>=0 ) {
                     conditions.show.push("Provider name for VAWG");
                     } else {
                       conditions.hide.push("Provider name for VAWG");
                     }

            if (obj.indexOf('STI')>=0 ) {
                     conditions.show.push("Provider name for STI");
                     } else {
                       conditions.hide.push("Provider name for STI");
                     }

            if (obj.indexOf('Home visit')>=0 ) {
                     conditions.show.push("Provider name for Home Visit");
                     } else {
                       conditions.hide.push("Provider name for Home Visit");
                     }

      return conditions;
},
    "GQRRH, Are there any changes from the previous visits?": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['GQRRH, Are there any changes from the previous visits?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("GQRRH, If yes, specify details of the changes");

        }
        else
        {
            conditions.disable.push("GQRRH, If yes, specify details of the changes");
        }
        return conditions;

    },
    "GQRRH, Do you have any health related problems since your last visit?": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['GQRRH, Do you have any health related problems since your last visit?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("GQRRH, If yes, specify details");

        }
        else
        {
            conditions.disable.push("GQRRH, If yes, specify details");
        }
        return conditions;

    },
    "GQRRH, Did you have fever recently?": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['GQRRH, Did you have fever recently?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("GQRRH, Duration of fever");

        }
        else
        {
            conditions.disable.push("GQRRH, Duration of fever");
        }
        return conditions;

    },
    "GQRRH, Did you have night sweats?" : function(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['GQRRH, Did you have night sweats?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("GQRRH, Duration of night sweats");

        }
        else
        {
            conditions.disable.push("GQRRH, Duration of night sweats");
        }
        return conditions;

    },
    "GQRRH, Do you have weight loss?": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['GQRRH, Do you have weight loss?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("GQRRH, Duration of weight loss");

        }
        else
        {
            conditions.disable.push("GQRRH, Duration of weight loss");
        }
        return conditions;

    },
    "GQRRH, Do you have shortness of breath?": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['GQRRH, Do you have shortness of breath?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("GQRRH, Duration of shortness of breath");

        }
        else
        {
            conditions.disable.push("GQRRH, Duration of shortness of breath");
        }
        return conditions;

    },
    "GQRRH, Are you suffering from headaches?": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['GQRRH, Are you suffering from headaches?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("GQRRH, Duration of headache","GQRRH, Severity of Headache","GQRRH, Course of Headache","GQRRH, Headache Association");

        }
        else
        {
            conditions.disable.push("GQRRH, Duration of headache","GQRRH, Severity of Headache","GQRRH, Course of Headache","GQRRH, Headache Association");
        }
        return conditions;

    },
    "GQRRH, Have you had a cough?": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['GQRRH, Have you had a cough?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("GQRRH, Type of cough","GQRRH, Duration");

        }
        else
        {
            conditions.disable.push("GQRRH, Type of cough","GQRRH, Duration");
        }
        return conditions;

    },
    "GQRRH, Female, Have you observed a vaginal Discharge?": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['GQRRH, Female, Have you observed a vaginal Discharge?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("GQRRH, Female, If yes, specify type");

        }
        else
        {
            conditions.disable.push("GQRRH, Female, If yes, specify type");
        }
        return conditions;

    },
    "GQRRH, Male, Have you observed a discharge from the penis?": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['GQRRH, Male, Have you observed a discharge from the penis?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("GQRRH, Male, If yes, specify type");

        }
        else
        {
            conditions.disable.push("GQRRH, Male, If yes, specify type");
        }
        return conditions;

    },
    "GQRRH, Have you ever been treated for a sexually transmitted infection?" : function(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['GQRRH, Have you ever been treated for a sexually transmitted infection?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("GQRRH, If yes, specify STI details");

        }
        else
        {
            conditions.disable.push("GQRRH, If yes, specify STI details");
        }
        return conditions;

    },
    "GQRRH, Have you changed your medicines?" : function(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['GQRRH, Have you changed your medicines?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("GQHHR, Medicines, If yes, specify details");

        }
        else
        {
            conditions.disable.push("GQHHR, Medicines, If yes, specify details");
        }
        return conditions;

    },
    "GQRRH, Do you use illicit drugs?" : function(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['GQRRH, Do you use illicit drugs?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("GQRRH, What type do you use and how often?");

        }
        else
        {
            conditions.disable.push("GQRRH, What type do you use and how often?");
        }
        return conditions;

    },
    "Medications, Have you ever experienced a drug allergy?": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Medications, Have you ever experienced a drug allergy?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Medications, Which drug(s) are you allerged to?");

        }
        else
        {
            conditions.disable.push("Medications, Which drug(s) are you allerged to?");
        }
        return conditions;

    },
    "Medications, Have you had a rash after taking medications?": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Medications, Have you had a rash after taking medications?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Medications, Location of rash","Medications, Rash Morphology");

        }
        else
        {
            conditions.disable.push("Medications, Location of rash","Medications, Rash Morphology");
        }
        return conditions;

    },
    "Medications, Did you feel nauseated after taking medications?": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Medications, Did you feel nauseated after taking medications?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Medications, Nausea from taking the medications?");

        }
        else
        {
            conditions.disable.push("Medications, Nausea from taking the medications?");
        }
        return conditions;

    },
    "Medications, Vomiting from taking the medications?": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Medications, Vomiting from taking the medications?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Medications, Vomiting occurrence","Medications, Were tablets visible in vomitus?");

        }
        else
        {
            conditions.disable.push("Medications, Vomiting occurrence","Medications, Were tablets visible in vomitus?");
        }
        return conditions;

    },
    "Medications, Have you missed any doses since you visited the clinic?": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Medications, Have you missed any doses since you visited the clinic?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Medications, When did you miss a dose?");

        }
        else
        {
            conditions.disable.push("Medications, When did you miss a dose?");
        }
        return conditions;

    },
    "TB Screening, Have you had a cough?": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['TB Screening, Have you had a cough?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("TB Screening, Type of cough","TB Screening, Cough Duration");

        }
        else
        {
            conditions.disable.push("TB Screening, Type of cough","TB Screening, Cough Duration");
        }
        return conditions;

    },
    "TB Screening, Have you had chest pain?": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['TB Screening, Have you had chest pain?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("TB Screening, Location of chest pains?","TB Screening, When does the chest pain occur?",
                "TB Screening, Chest Pain Duration");

        }
        else
        {
            conditions.disable.push("TB Screening, Location of chest pains?","TB Screening, When does the chest pain occur?",
                "TB Screening, Chest Pain Duration");
        }
        return conditions;

    },
    "TB Screening, Location of chest pains?": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['TB Screening, Location of chest pains?'];
        if (conditionConcept=='Other locations') {
            conditions.enable.push("TB Screening, If other location, specify details");

        }
        else
        {
            conditions.disable.push("TB Screening, If other location, specify details");
        }
        return conditions;

    },
    "TB Screening, When does the chest pain occur?": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['TB Screening, When does the chest pain occur?'];
        if (conditionConcept=='Other') {
            conditions.enable.push("TB Screening, If other, specify details");

        }
        else
        {
            conditions.disable.push("TB Screening, If other, specify details");
        }
        return conditions;

    },
    "TB Screening, Have you had shortness of breath?": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['TB Screening, Have you had shortness of breath?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("TB Screening, Shortness of breath Duration","TB Screening, When does the shortness of breath occur?");

        }
        else
        {
            conditions.disable.push("TB Screening, Shortness of breath Duration","TB Screening, When does the shortness of breath occur?");
        }
        return conditions;

    },
    "TB Screening, Did you have fever recently?": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['TB Screening, Did you have fever recently?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("TB Screening, Duration of fever");

        }
        else
        {
            conditions.disable.push("TB Screening, Duration of fever");
        }
        return conditions;

    },
    "TB Screening, Did you have night sweats?": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['TB Screening, Did you have night sweats?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("TB Screening, Duration of night sweats");

        }
        else
        {
            conditions.disable.push("TB Screening, Duration of night sweats");
        }
        return conditions;

    },
    "TB Screening, Do you have weight loss?": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['TB Screening, Do you have weight loss?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("TB Screening, Duration of weight loss");

        }
        else
        {
            conditions.disable.push("TB Screening, Duration of weight loss");
        }
        return conditions;

    },
	"Partner/Self Currently on F/P": function(formName, formFieldValues) {
		var questionThatTriggersRule = "Partner/Self Currently on F/P";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
		var question1AffectedByRule = "If yes, which method are you/partner using? (Multiple responses possible)";
        var conditionTrue = selectedResponses == 'Yes';
    	var ruleActions = {enable: [], disable: []};
        if(conditionTrue) {
            ruleActions.enable.push(question1AffectedByRule);
        } else {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
	    },
	"If married/having a partner and individual T&C, Reasons for not  bringing partner  (Multiple responses possible)": function(formName, formFieldValues) {
		var questionThatTriggersRule = "If married/having a partner and individual T&C, Reasons for not  bringing partner  (Multiple responses possible)";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
		var question1AffectedByRule = "Other specific (reasons for not bringing partner)";
        var conditionTrue = selectedResponses.indexOf('Other (specify)') >= 0;
    	var ruleActions = {enable: [], disable: []};
        if(conditionTrue) {
            ruleActions.enable.push(question1AffectedByRule);
        } else {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
	    },
	"Are you currently coughing?": function(formName, formFieldValues) {
		var questionThatTriggersRule = "Are you currently coughing?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
		var question1AffectedByRule = "For how long are you been coughing (weeks)?";
        var conditionTrue = selectedResponses == 'Yes' || selectedResponses == 'Not Sure';
    	var ruleActions = {enable: [], disable: []};
        if(conditionTrue) {
            ruleActions.enable.push(question1AffectedByRule);
        } else {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
	    },
	"Why are you worried/ curious about learning your HIV status?  (Multiple responses possible)": function(formName, formFieldValues) {
		var questionThatTriggersRule = "Why are you worried/ curious about learning your HIV status?  (Multiple responses possible)";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
		var question1AffectedByRule = "Other specific (why worried/curious about HIV status)";
        var conditionTrue = selectedResponses.indexOf('Other (specify)') >= 0;
    	var ruleActions = {enable: [], disable: []};
        if(conditionTrue) {
            ruleActions.enable.push(question1AffectedByRule);
        } else {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
	    },
	"How did you learn about this T&C site?": function(formName, formFieldValues) {
		var questionThatTriggersRule = "How did you learn about this T&C site?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
		var question1AffectedByRule = "Other specific (how learned about this T&C site)";
    	var ruleActions = {enable: [], disable: []};
        if(selectedResponses == "Other (specify)") {
            ruleActions.enable.push(question1AffectedByRule);
        } else {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
	    },

"Ever been tested": function(formName, formFieldValues) {
        var questionThatTriggersRule = "Ever been tested";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "If yes, where were you last tested?";
        var question2AffectedByRule = "If ever been tested, how many times have you been tested for HIV before?";
        var question3AffectedByRule = "How long ago were you last tested (months)?";
        var question4AffectedByRule = "What were the results the last time you were tested?";
        var question5AffectedByRule = "Has your most recent sex partner been tested in the last 3 months?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue) {
            ruleActions.enable.push(question1AffectedByRule);
            ruleActions.enable.push(question2AffectedByRule);
            ruleActions.enable.push(question3AffectedByRule);
            ruleActions.enable.push(question4AffectedByRule);
            ruleActions.enable.push(question5AffectedByRule);
        } else {
            ruleActions.disable.push(question1AffectedByRule);
            ruleActions.disable.push(question2AffectedByRule);
            ruleActions.disable.push(question3AffectedByRule);
            ruleActions.disable.push(question4AffectedByRule);
            ruleActions.disable.push(question5AffectedByRule);
        }
        return ruleActions;
        },

"Provider HIV test counselling, Was recency testing done?": function(formName, formFieldValues) {
        var questionThatTriggersRule = "Provider HIV test counselling, Was recency testing done?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Provider HIV test counselling, What was the result?";
        var question2AffectedByRule = "Provider HIV test counselling, Date of recency testing result";
        var question3AffectedByRule = "Provider HIV test counselling, What was the testing modality used?";
        var question4AffectedByRule = "Provider HIV test counselling, Why was it not done?";

        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue) {
            ruleActions.enable.push(question1AffectedByRule);
            ruleActions.enable.push(question2AffectedByRule);
            ruleActions.enable.push(question3AffectedByRule);
            ruleActions.disable.push(question4AffectedByRule);

        } else {
            ruleActions.disable.push(question1AffectedByRule);
            ruleActions.disable.push(question2AffectedByRule);
            ruleActions.disable.push(question3AffectedByRule);
            ruleActions.enable.push(question4AffectedByRule);

        }
        return ruleActions;
        },


	"If client advised to return for re-testing indicate timeline (2 weeks, 4 weeks, 3months, 6 months, other)": function(formName, formFieldValues) {
		var questionThatTriggersRule = "If client advised to return for re-testing indicate timeline (2 weeks, 4 weeks, 3months, 6 months, other)";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
		var question1AffectedByRule = "Other specific (timeline advised to return for re-testing)";
        var conditionTrue = selectedResponses == 'Other (specify)';
    	var ruleActions = {enable: [], disable: []};
        if(conditionTrue) {
            ruleActions.enable.push(question1AffectedByRule);
        } else {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
	    },
	"Disclosure planned to:  (Multiple responses possible)": function(formName, formFieldValues) {
		var questionThatTriggersRule = "Disclosure planned to:  (Multiple responses possible)";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
		var question1AffectedByRule = "Other specific (disclosure planned to)";
        var conditionTrue = selectedResponses.indexOf('Other (specify)') >= 0;
    	var ruleActions = {enable: [], disable: []};
        if(conditionTrue) {
            ruleActions.enable.push(question1AffectedByRule);
        } else {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
	    },
	"Risk reduction plan  (Multiple responses possible)": function(formName, formFieldValues) {
		var questionThatTriggersRule = "Risk reduction plan  (Multiple responses possible)";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
		var question1AffectedByRule = "Other specific (risk reduction plan)";
        var conditionTrue = selectedResponses.indexOf('Other (specify)') >= 0;
    	var ruleActions = {enable: [], disable: []};
        if(conditionTrue) {
            ruleActions.enable.push(question1AffectedByRule);
        } else {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
	    },
        "HEENT, Are you hard on hearing?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HEENT, Are you hard on hearing?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("HEENT, Hearing loss location","HEENT, Hearing loss Duration","HEENT, Additional comments about hearing loss");
        } else {
            conditions.disable.push("HEENT, Hearing loss location","HEENT, Hearing loss Duration","HEENT, Additional comments about hearing loss");
        }
        return conditions;
        },
    "HEENT, Do you have ear discharge?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HEENT, Do you have ear discharge?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("HEENT, Ear discharge location","HEENT, Duration of ear discharge");
        } else {
            conditions.disable.push("HEENT, Ear discharge location","HEENT, Duration of ear discharge");
        }
        return conditions;
        },
    "HEENT, Do you have ear pain?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HEENT, Do you have ear pain?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("HEENT, Ear pain location","HEENT, Ear pain duration", "HEENT, Is pain associated with discharge");
        } else {
            conditions.disable.push("HEENT, Ear pain location","HEENT, Ear pain duration", "HEENT, Is pain associated with discharge");
        }
        return conditions;
        },
    "HEENT, Are you suffering from headaches?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HEENT, Are you suffering from headaches?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("HEENT, Headache location","HEENT, Onset of headache","HEENT, Headache Course","HEENT, Headache Severity","HEENT, Headache Frequency","HEENT, Headache association","HEENT, Duration of Headache","HEENT, Parotid enlargement");
        } else {
            conditions.disable.push("HEENT, Headache location","HEENT, Onset of headache","HEENT, Headache Course","HEENT, Headache Severity","HEENT, Headache Frequency","HEENT, Headache association","HEENT, Duration of Headache","HEENT, Parotid enlargement");
        }
        return conditions;
        },
    "HEENT, Headache location": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HEENT, Headache location'];
        if (conditionConcept.indexOf("Other") >=0) {
            conditions.enable.push("HEENT, If other headache location, specify");
        } else {
            conditions.disable.push("HEENT, If other headache location, specify");
        }
        return conditions;
        },
    "HEENT, Do you have problems with your eyes?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HEENT, Do you have problems with your eyes?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("HEENT, Have you experienced loss of vision", "HEENT, Are Sclerae / conjuctivae normal?","HEENT, Are eyelids normal?","HEENT, Coodinated bilateral eye movements?","HEENT, Pterygium present");
            var YesSelected = formFieldValues['HEENT, Have you experienced loss of vision'];
            var NoSelected = formFieldValues['HEENT, Are Sclerae / conjuctivae normal?'];
            var NoEyeLidsSelected = formFieldValues['HEENT, Are eyelids normal?'];
            var YesPteryiumSelected = formFieldValues['HEENT, Pterygium present'];
            if (YesSelected == "Yes"){
                conditions.enable.push("HEENT, If yes on loss of vision, specify");
            } else {
                conditions.disable.push("HEENT, If yes on loss of vision, specify");
            }
            if (NoSelected == "No"){
                conditions.enable.push("HEENT, If no on conjunctive normal, specify where");
            } else {
                conditions.disable.push("HEENT, If no on conjunctive normal, specify where");
            }
            if (NoEyeLidsSelected == "No"){
                conditions.enable.push("HEENT, If no on normal eyelids, specify where");
            } else {
                conditions.disable.push("HEENT, If no on normal eyelids, specify where");
            }
            if (YesPteryiumSelected == "Yes"){
                conditions.enable.push("HEENT, If yes on pterytium, which side");
            } else {
                conditions.disable.push("HEENT, If yes on pterytium, which side");
            }
        } else {
            conditions.disable.push("HEENT, Have you experienced loss of vision", "HEENT, Are Sclerae / conjuctivae normal?","HEENT, Are eyelids normal?","HEENT, Coodinated bilateral eye movements?","HEENT, Pterygium present");
        }
        return conditions;
        },
    "HEENT, Have you experienced loss of vision": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HEENT, Have you experienced loss of vision'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("HEENT, If yes on loss of vision, specify");
        } else {
            conditions.disable.push("HEENT, If yes on loss of vision, specify");
        }
        return conditions;
        },
    "HEENT, Are Sclerae / conjuctivae normal?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HEENT, Are Sclerae / conjuctivae normal?'];
        if (conditionConcept == "No") {
            conditions.enable.push("HEENT, If no on conjunctive normal, specify where");
        } else {
            conditions.disable.push("HEENT, If no on conjunctive normal, specify where");
        }
        return conditions;
        },
        "HEENT, Are eyelids normal?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HEENT, Are eyelids normal?'];
        if (conditionConcept == "No") {
            conditions.enable.push("HEENT, If no on normal eyelids, specify where");
        } else {
            conditions.disable.push("HEENT, If no on normal eyelids, specify where");
        }
        return conditions;
        },
    "HEENT, Pterygium present": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HEENT, Pterygium present'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("HEENT, If yes on pterytium, which side");
        } else {
            conditions.disable.push("HEENT, If yes on pterytium, which side");
        }
        return conditions;
        },

    "HEENT, Do you suffer from frequent nasal Discharge": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HEENT, Do you suffer from frequent nasal Discharge'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("HEENT, Is the discharge associated with headaches?", "HEENT, Is the discharge associated with swelling of the face?", "HEENT, Is the discharge associated with facial pain?");
        } else {
            conditions.disable.push("HEENT, Is the discharge associated with headaches?", "HEENT, Is the discharge associated with swelling of the face?", "HEENT, Is the discharge associated with facial pain?");
        }
        return conditions;
        },

    "HEENT, Have you noticed any changes in or around the mouth and neck?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HEENT, Have you noticed any changes in or around the mouth and neck?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("HEENT, Have you had sores or non healing ulcers in the mouth?", "HEENT, Have you had blisters or swelling on/around the lips?", "HEENT, Have you had non-healing cracks at the corner of your mouth?", "HEENT, Have you had oral thrush?", "HEENT, Have you had painful or bleeding gums?", "HEENT, Have you had painful teeth?", "HEENT, Have you had painful teeth?", "HEENT, Do you have any other oral conditions?");
            var MNYesSelected = formFieldValues['HEENT, Have you had sores or non healing ulcers in the mouth?'];
            var OralYesSelected = formFieldValues['HEENT, Have you had oral thrush?'];
            var OralOtherSelected = formFieldValues['HEENT, Do you have any other oral conditions?'];

            if (MNYesSelected == "Yes"){
                conditions.enable.push("HEENT, If yes on sores, how often?");
            } else {
                conditions.disable.push("HEENT, If yes on sores, how often?");
            }
            if (OralYesSelected == "Yes"){
                conditions.enable.push("HEENT, Is oral thrus associated with difficulty or pain when swallowing?");
            } else {
                conditions.disable.push("HEENT, Is oral thrus associated with difficulty or pain when swallowing?");
            }
            if (OralOtherSelected == "Yes"){
                conditions.enable.push("HEENT, If yes on other oral condition, specify");
            } else {
                conditions.disable.push("HEENT, If yes on other oral condition, specify");
            }

        } else {
            conditions.disable.push("HEENT, Have you had sores or non healing ulcers in the mouth?", "HEENT, Have you had blisters or swelling on/around the lips?", "HEENT, Have you had non-healing cracks at the corner of your mouth?", "HEENT, Have you had oral thrush?", "HEENT, Have you had painful or bleeding gums?", "HEENT, Have you had painful teeth?", "HEENT, Have you had painful teeth?", "HEENT, Do you have any other oral conditions?");
        }
        return conditions;
        },
    "HEENT, Have you had sores or non healing ulcers in the mouth?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HEENT, Have you had sores or non healing ulcers in the mouth?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("HEENT, If yes on sores, how often?");
        } else {
            conditions.disable.push("HEENT, If yes on sores, how often?");
        }
        return conditions;
        },
    "HEENT, Have you had oral thrush?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HEENT, Have you had oral thrush?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("HEENT, Is oral thrus associated with difficulty or pain when swallowing?");
        } else {
            conditions.disable.push("HEENT, Is oral thrus associated with difficulty or pain when swallowing?");
        }
        return conditions;
        },
    "HEENT, Do you have any other oral conditions?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HEENT, Do you have any other oral conditions?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("HEENT, If yes on other oral condition, specify");
        } else {
            conditions.disable.push("HEENT, If yes on other oral condition, specify");
        }
        return conditions;
        },
    "STI Symptoms, Patients gender": function (formName, formFieldValues) {
        var conditions = {show: [], hide: [], enable: [], disable: []};
        var conditionConcept = formFieldValues['STI Symptoms, Patients gender'];
        if (conditionConcept == "Male") {
            conditions.show.push("STI Symptoms, Male Details");
            conditions.enable.push("STI Symptoms, Male, Family Medical History","STI Symptoms, Male, Registered for ART","STI Symptoms, Male, Client's HIV status","STI Symptoms, Male, Have you observed a discharge from the penis?","STI Symptoms, Male, Have you noticed non painful or painful ulcers on or around the penis?","STI Symptoms, Male, Have you had rash with any of the symptoms?", "STI Symptoms, Male, Have you noticed warts on the genital area?", "STI Symptoms, Male, Have you had swelling of your penis or foreskin?", "STI Symptoms, Male, Have you been treated for any of the following?");
            conditions.hide.push("STI Symptoms, Female Details");
            var PenisDischarge = formFieldValues['STI Symptoms, Male, Have you observed a discharge from the penis?'];
            var PenisUlcers = formFieldValues['STI Symptoms, Male, Have you noticed non painful or painful ulcers on or around the penis?'];
            var RashSymptoms = formFieldValues['STI Symptoms, Male, Have you had rash with any of the symptoms?'];
            var HivStatus = formFieldValues["STI Symptoms, Male, Client's HIV status"];
            var RegArt = formFieldValues['STI Symptoms, Male, Registered for ART'];
            if (PenisDischarge == "Yes") {
                conditions.enable.push("STI Symptoms, Male, If yes on penis discharge, specify type");
            } else {
                conditions.disable.push("STI Symptoms, Male, If yes on penis discharge, specify type");
            }
            if (PenisUlcers == "Yes") {
                conditions.enable.push("STI Symptoms, Male, Duration of the penis ulcer");
            } else {
                conditions.disable.push("STI Symptoms, Male, Duration of the penis ulcer");
            }
            if (RashSymptoms == "Yes") {
                conditions.enable.push("STI Symptoms, Male, If yes on rash, location of rash");
            } else {
                conditions.disable.push("STI Symptoms, Male, If yes on rash, location of rash");
            }
            if (HivStatus == "Positive") {
                conditions.enable.push("STI Symptoms, Male, Registered for ART");
            } else {
                conditions.disable.push("STI Symptoms, Male, Registered for ART");
            }
            if (RegArt == "Yes") {
                conditions.enable.push("STI Symptoms, Male, If Yes");
            } else {
                conditions.disable.push("STI Symptoms, Male, If Yes");
            }
        }
        else if (conditionConcept == "Female") {
            conditions.show.push("STI Symptoms, Female Details");
            conditions.enable.push("STI Symptoms, Male, Family Medical History","STI Symptoms, Female, Family Medical History","STI Symptoms, Female, Registered for ART","STI Symptoms, Female, Client's HIV status","STI Symptoms, Female, Have you observed a vaginal discharge?","STI Symptoms, Female, Have you noticed non painful of painful ulcers on or around the labia?","STI Symptoms, Female, Have you had rash with any of the symptoms?", "STI Symptoms, Female, Have you noticed warts on the genital area?", "STI Symptoms, Female, Have you had swelling of the labia?", "STI Symptoms, Female, Have you been treated for any of the following?");
            conditions.hide.push("STI Symptoms, Male Details");
            var VagDischarge = formFieldValues['STI Symptoms, Female, Have you observed a vaginal discharge?'];
            var LabiaUlcer = formFieldValues['STI Symptoms, Female, Have you noticed non painful of painful ulcers on or around the labia?'];
            var RashSymptoms = formFieldValues['STI Symptoms, Female, Have you had rash with any of the symptoms?'];
            var HivStatus = formFieldValues["STI Symptoms, Female, Client's HIV status"];
            var RegArt = formFieldValues['STI Symptoms, Female, Registered for ART'];
            if (VagDischarge == "Yes") {
                conditions.enable.push("STI Symptoms, Female, If yes on vaginal discharge, specify type");
            } else {
                conditions.disable.push("STI Symptoms, Female, If yes on vaginal discharge, specify type");
            }
            if (VagDischarge == "Yes") {
                conditions.enable.push("STI Symptoms, Female, Duration of the labia ulcer");
            } else {
                conditions.disable.push("STI Symptoms, Female, Duration of the labia ulcer");
            }
            if (VagDischarge == "Yes") {
                conditions.enable.push("STI Symptoms, Female, If yes on rash, location of rash");
            } else {
                conditions.disable.push("STI Symptoms, Female, If yes on rash, location of rash");
            }
            if (HivStatus == "Positive") {
                conditions.enable.push("STI Symptoms, Female, Registered for ART");
            } else {
                conditions.disable.push("STI Symptoms, Female, Registered for ART");
            }
            if (RegArt == "Yes") {
                conditions.enable.push("STI Symptoms, Female, If Yes");
            } else {
                conditions.disable.push("STI Symptoms, Female, If Yes");
            }
        }
        else {
            conditions.hide.push("STI Symptoms, Female Details", "STI Symptoms, Male Details");
        }
        return conditions;
        },
    "STI Symptoms, Male, Have you observed a discharge from the penis?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['STI Symptoms, Male, Have you observed a discharge from the penis?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("STI Symptoms, Male, If yes on penis discharge, specify type");
        } else {
            conditions.disable.push("STI Symptoms, Male, If yes on penis discharge, specify type");
        }
        return conditions;
        },
    "STI Symptoms, Male, If Yes": function(formName, formFieldValues) {
         var conditions = {show: [], hide: []};
         var NscOther = formFieldValues['STI Symptoms, Male, If Yes'];
         if (NscOther == "NSC") {
              conditions.show.push("STI Symptoms, Male, NSC");
              conditions.hide.push("STI Symptoms, Male, Other");
         }
         else if (NscOther == "Other")
         {
              conditions.show.push("STI Symptoms, Male, Other");
              conditions.hide.push("STI Symptoms, Male, NSC");
         }
         else {
            conditions.hide.push("STI Symptoms, Male, NSC",
                                 "STI Symptoms, Male, Other");
        }
          return conditions;
    },
    "STI Symptoms, Female, If Yes": function(formName, formFieldValues) {
         var conditions = {show: [], hide: []};
         var NscOther = formFieldValues['STI Symptoms, Female, If Yes'];
         if (NscOther == "NSC") {
              conditions.show.push("STI Symptoms, Female, NSC");
              conditions.hide.push("STI Symptoms, Female, Other");
         }
         else if (NscOther == "Other")
         {
              conditions.show.push("STI Symptoms, Female, Other");
              conditions.hide.push("STI Symptoms, Female, NSC");
         }
         else {
            conditions.hide.push("STI Symptoms, Female, NSC",
                                 "STI Symptoms, Female, Other");
        }
          return conditions;
    },
    "STI Symptoms, Male, Have you noticed non painful or painful ulcers on or around the penis?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['STI Symptoms, Male, Have you noticed non painful or painful ulcers on or around the penis?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("STI Symptoms, Male, Duration of the penis ulcer");
        } else {
            conditions.disable.push("STI Symptoms, Male, Duration of the penis ulcer");
        }
        return conditions;
        },
    "STI Symptoms, Male, Have you had rash with any of the symptoms?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['STI Symptoms, Male, Have you had rash with any of the symptoms?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("STI Symptoms, Male, If yes on rash, location of rash");
        } else {
            conditions.disable.push("STI Symptoms, Male, If yes on rash, location of rash");
        }
        return conditions;
        },
    "STI Symptoms, Female, Have you observed a vaginal discharge?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['STI Symptoms, Female, Have you observed a vaginal discharge?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("STI Symptoms, Female, If yes on vaginal discharge, specify type");
        } else {
            conditions.disable.push("STI Symptoms, Female, If yes on vaginal discharge, specify type");
        }
        return conditions;
        },
    "STI Symptoms, Female, If yes on vaginal discharge, specify type": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['STI Symptoms, Female, If yes on vaginal discharge, specify type'];
        if (conditionConcept.indexOf("Other") >=0) {
            conditions.enable.push("STI Symptoms, Female, Other type of vaginal discharge");
        } else {
            conditions.disable.push("STI Symptoms, Female, Other type of vaginal discharge");
        }
        return conditions;
        },
    "STI Symptoms, Male, If yes on penis discharge, specify type": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['STI Symptoms, Male, If yes on penis discharge, specify type'];
        if (conditionConcept.indexOf("Other") >=0) {
            conditions.enable.push("STI Symptoms, Male, Other type of discharge");
        } else {
            conditions.disable.push("STI Symptoms, Male, Other type of discharge");
        }
        return conditions;
        },
    "STI Symptoms, Female, Have you noticed non painful of painful ulcers on or around the labia?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['STI Symptoms, Female, Have you noticed non painful of painful ulcers on or around the labia?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("STI Symptoms, Female, Duration of the labia ulcer");
        } else {
            conditions.disable.push("STI Symptoms, Female, Duration of the labia ulcer");
        }
        return conditions;
        },
    "STI Symptoms, Female, Have you had rash with any of the symptoms?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['STI Symptoms, Female, Have you had rash with any of the symptoms?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("STI Symptoms, Female, If yes on rash, location of rash");
        } else {
            conditions.disable.push("STI Symptoms, Female, If yes on rash, location of rash");
        }
        return conditions;
        },
    "BJE, Have you experienced joint pain?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['BJE, Have you experienced joint pain?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("BJE, Location of joint pain", "BJE, Joint pain duration", "BJE, Is the pain associated with swelling of the joint?");
        } else {
            conditions.disable.push("BJE, Location of joint pain", "BJE, Joint pain duration", "BJE, Is the pain associated with swelling of the joint?");
        }
        return conditions;
        },
    "BJE, Have you experienced joint swelling?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['BJE, Have you experienced joint swelling?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("BJE, Location of joint swelling", "BJE, Joint swelling duration", "BJE, Is the joint swelling associated with pain?");
        } else {
            conditions.disable.push("BJE, Location of joint swelling", "BJE, Joint swelling duration", "BJE, Is the joint swelling associated with pain?");
        }
        return conditions;
        },
    "BJE, Abnormal joint mobility": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['BJE, Abnormal joint mobility'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("BJE, If yes on abnormal joint mobility, illustrate");
        } else {
            conditions.disable.push("BJE, If yes on abnormal joint mobility, illustrate");
        }
        return conditions;
        },
    "BJE, Have you experienced chronic back pain?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['BJE, Have you experienced chronic back pain?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("BJE, Does the back pain occur with specific movements?", "BJE, Does the back pain occur at night?", "BJE, Duration of back pain", "BJE, Location of back pain");
            var SpecMov = formFieldValues['BJE, Does the back pain occur with specific movements?'];
            if (SpecMov == "Yes"){
                conditions.enable.push("BJE, If yes, indicate the particular movements");
            } else {
                conditions.disable.push("BJE, If yes, indicate the particular movements");
            }
        } else {
            conditions.disable.push("BJE, Does the back pain occur with specific movements?", "BJE, Does the back pain occur at night?", "BJE, Duration of back pain", "BJE, Location of back pain");
        }
        return conditions;
        },
    "BJE, Does the back pain occur with specific movements?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['BJE, Does the back pain occur with specific movements?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("BJE, If yes, indicate the particular movements");
        } else {
            conditions.disable.push("BJE, If yes, indicate the particular movements");
        }
        return conditions;
        },
    "BJE, Have you experienced muscle aches?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['BJE, Have you experienced muscle aches?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("BJE, Duration of muscle aches?", "BJE, Location of muscle aches");
        }
          else {
            conditions.disable.push("BJE, Duration of muscle aches?", "BJE, Location of muscle aches");
        }
        return conditions;
        },
    "BJE, Do you have any muscular atrophy?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['BJE, Do you have any muscular atrophy?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("BJE, If yes on muscular atrophy, illustrate");
        } else {
            conditions.disable.push("BJE, If yes on muscular atrophy, illustrate");
        }
        return conditions;
        },
    "BJE, Are you currently on NRTIs": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['BJE, Are you currently on NRTIs'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("BJE, If yes on currently on NRTIs, indicate drugs");
        } else {
            conditions.disable.push("BJE, If yes on currently on NRTIs, indicate drugs");
        }
        return conditions;
        },
    "BJE, Clubbing of fingers": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['BJE, Clubbing of fingers'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("BJE, If yes on clubbing of fingers, specify additional information");
        } else {
            conditions.disable.push("BJE, If yes on clubbing of fingers, specify additional information");
        }
        return conditions;
        },

    "GU Tract, Type of Patient": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['GU Tract, Type of Patient'];
        if (conditionConcept == "Male") {
            conditions.enable.push("GU Tract, Male, Are you experiencing any problems when voiding?");
            conditions.disable.push("GU Tract, Female Details", "GU Tract, Child Details");
            var MaleVoidProb = formFieldValues['GU Tract, Male, Are you experiencing any problems when voiding?'];
            if (MaleVoidProb == "Yes") {
                conditions.enable.push("GU Tract, Male, Do you experience hesitancy before voiding?", "GU Tract, Male, Do you experience a burning sensation during micturation?");
            } else {
                conditions.disable.push("GU Tract, Male, Do you experience hesitancy before voiding?", "GU Tract, Male, Do you experience a burning sensation during micturation?");
            }

        }

        else if (conditionConcept == "Female") {
            conditions.enable.push("GU Tract, Female, Are you experiencing any problems when voiding?");
            conditions.disable.push("GU Tract, Male Details", "GU Tract, Child Details");
            var FemaleVoidProb = formFieldValues['GU Tract, Female, Are you experiencing any problems when voiding?'];
            if (FemaleVoidProb == "Yes") {
                conditions.enable.push("GU Tract, Female, Do you experience hesitancy before voiding?", "GU Tract, Female, Do you experience a burning sensation during micturation?");
            } else {
                conditions.disable.push("GU Tract, Female, Do you experience hesitancy before voiding?", "GU Tract, Female, Do you experience a burning sensation during micturation?");
            }
        }

        else if (conditionConcept == "Child") {
            conditions.enable.push("GU Tract, Child, Did the child cry during urination?");
            conditions.disable.push("GU Tract, Male Details", "GU Tract, Female Details");
            var ChildCry = formFieldValues['GU Tract, Child, Did the child cry during urination?'];
            if (ChildCry == "Yes") {
                conditions.enable.push("GU Tract, Child, Have you observed blood in the childs urine?");
            } else {
                conditions.disable.push("GU Tract, Child, Have you observed blood in the childs urine?");
            }
        }

        else {
            conditions.disable.push("GU Tract, Male Details", "GU Tract, Female Details", "GU Tract, Child Details");
        }
        return conditions;
        },
    "GU Tract, Male, Are you experiencing any problems when voiding?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['GU Tract, Male, Are you experiencing any problems when voiding?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("GU Tract, Male, Do you experience hesitancy before voiding?", "GU Tract, Male, Do you experience a burning sensation during micturation?", "GU Tract, Male, Do you have a sense of incomplete voiding?", "GU Tract, Male, Do you need to go more frequently?", "GU Tract, Male, Do you have to get up night?", "GU Tract, Male, Do you feel an urgency for urination?", "GU Tract, Male, Have you observed blood in your urine?", "GU Tract, Male, Have you experienced unintentional loss of urine?", "GU Tract, Male, Have you experienced loss of sexual interest?", "GU Tract, Male, Do you have erectile dysfunction?");
            var BurnMic = formFieldValues['GU Tract, Male, Do you experience a burning sensation during micturation?'];
            if (BurnMic == "Yes"){
                conditions.enable.push("GU Tract, Male, Burning sensation details");
            } else {
                conditions.disable.push("GU Tract, Male, Burning sensation details");
            }
        }
          else {
            conditions.disable.push("GU Tract, Male, Do you experience hesitancy before voiding?", "GU Tract, Male, Do you experience a burning sensation during micturation?", "GU Tract, Male, Do you have a sense of incomplete voiding?", "GU Tract, Male, Do you need to go more frequently?", "GU Tract, Male, Do you have to get up night?", "GU Tract, Male, Do you feel an urgency for urination?", "GU Tract, Male, Have you observed blood in your urine?", "GU Tract, Male, Have you experienced unintentional loss of urine?", "GU Tract, Male, Have you experienced loss of sexual interest?", "GU Tract, Male, Do you have erectile dysfunction?");
        }
        return conditions;
        },
    "GU Tract, Male, Do you experience a burning sensation during micturation?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['GU Tract, Male, Do you experience a burning sensation during micturation?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("GU Tract, Male, Burning sensation details",  "GU Tract, Male, Burning sensation duration");

        } else {
            conditions.disable.push("GU Tract, Male, Burning sensation details", "GU Tract, Male, If burning sensation associated with flank pain, which side", "GU Tract, Male, Burning sensation duration");
        }
        return conditions;
        },
    "GU Tract, Male, Burning sensation details": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['GU Tract, Male, Burning sensation details'];
        if (conditionConcept.indexOf("Associated with flank pain") >=0) {
            conditions.enable.push("GU Tract, Male, If burning sensation associated with flank pain, which side");
        } else {
            conditions.disable.push("GU Tract, Male, If burning sensation associated with flank pain, which side");
        }
        return conditions;
        },
    "GU Tract, Male, Have you observed blood in your urine?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['GU Tract, Male, Have you observed blood in your urine?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("GU Tract, Male, Blood in urine severity", "GU Tract, Male, Duration of blood in urine");
        } else {
            conditions.disable.push("GU Tract, Male, Blood in urine severity", "GU Tract, Male, Duration of blood in urine");
        }
        return conditions;
        },
    "GU Tract, Male, Have you experienced unintentional loss of urine?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['GU Tract, Male, Have you experienced unintentional loss of urine?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("GU Tract, Male, If yes on unintentional loss of urine, specify when");
        } else {
            conditions.disable.push("GU Tract, Male, If yes on unintentional loss of urine, specify when");
        }
        return conditions;
        },
    "GU Tract, Female, Are you experiencing any problems when voiding?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['GU Tract, Female, Are you experiencing any problems when voiding?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("GU Tract, Female, Do you experience hesitancy before voiding?", "GU Tract, Female, Do you experience a burning sensation during micturation?", "GU Tract, Female, Do you have a sense of incomplete voiding?", "GU Tract, Female, Do you need to go more frequently?", "GU Tract, Female, Do you have to get up night?", "GU Tract, Female, Do you feel an urgency for urination?", "GU Tract, Female, Have you observed blood in your urine?", "GU Tract, Female, Have you experienced unintentional loss of urine?", "GU Tract, Female, Lower mid-abdominal (bladder area) tenderness?", "GU Tract, Female, Was it associated with a menstrual period?", "GU Tract, Female, Dyparenuia (painful sexual intercourse)", "GU Tract, Female, Have you experienced loss of sexual interest?");
            var BurnMic = formFieldValues['GU Tract, Female, Do you experience a burning sensation during micturation?'];
            if (BurnMic == "Yes"){
                conditions.enable.push("GU Tract, Female, Burning sensation details");
            } else {
                conditions.disable.push("GU Tract, Female, Burning sensation details");
            }
        }
          else {
            conditions.disable.push("GU Tract, Female, Do you experience hesitancy before voiding?", "GU Tract, Female, Do you experience a burning sensation during micturation?", "GU Tract, Female, Do you have a sense of incomplete voiding?", "GU Tract, Female, Do you need to go more frequently?", "GU Tract, Female, Do you have to get up night?", "GU Tract, Female, Do you feel an urgency for urination?", "GU Tract, Female, Have you observed blood in your urine?", "GU Tract, Female, Have you experienced unintentional loss of urine?", "GU Tract, Female, Lower mid-abdominal (bladder area) tenderness?", "GU Tract, Female, Was it associated with a menstrual period?", "GU Tract, Female, Dyparenuia (painful sexual intercourse)", "GU Tract, Female, Have you experienced loss of sexual interest?");
        }
        return conditions;
        },
    "GU Tract, Female, Do you experience a burning sensation during micturation?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['GU Tract, Female, Do you experience a burning sensation during micturation?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("GU Tract, Female, Burning sensation details",  "GU Tract, Female, Burning sensation duration");

        } else {
            conditions.disable.push("GU Tract, Female, Burning sensation details", "GU Tract, Female, If burning sensation associated with flank pain, which side", "GU Tract, Female, Burning sensation duration");
        }
        return conditions;
        },
    "GU Tract, Female, Burning sensation details": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['GU Tract, Female, Burning sensation details'];
        if (conditionConcept.indexOf("Associated with flank pain") >=0) {
            conditions.enable.push("GU Tract, Female, If burning sensation associated with flank pain, which side");
        } else {
            conditions.disable.push("GU Tract, Female, If burning sensation associated with flank pain, which side");
        }
        return conditions;
        },
    "GU Tract, Female, Have you observed blood in your urine?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['GU Tract, Female, Have you observed blood in your urine?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("GU Tract, Female, Blood in urine severity", "GU Tract, Female, Duration of blood in urine");
        } else {
            conditions.disable.push("GU Tract, Female, Blood in urine severity", "GU Tract, Female, Duration of blood in urine");
        }
        return conditions;
        },
    "GU Tract, Female, Have you experienced unintentional loss of urine?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['GU Tract, Female, Have you experienced unintentional loss of urine?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("GU Tract, Female, If yes on unintentional loss of urine, specify when");
        } else {
            conditions.disable.push("GU Tract, Female, If yes on unintentional loss of urine, specify when");
        }
        return conditions;
        },
    "GU Tract, Child, Did the child cry during urination?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['GU Tract, Child, Did the child cry during urination?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("GU Tract, Child, Have you observed blood in the childs urine?", "GU Tract, Child, Blood in urine severity", "GU Tract, Child, Duration of blood in urine");
        } else {
            conditions.disable.push("GU Tract, Child, Have you observed blood in the childs urine?", "GU Tract, Child, Blood in urine severity", "GU Tract, Child, Duration of blood in urine");
        }
        return conditions;
        },
    "GU Tract, Child, Have you observed blood in the childs urine?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['GU Tract, Child, Have you observed blood in the childs urine?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("GU Tract, Child, Blood in urine severity", "GU Tract, Child, Duration of blood in urine");
        } else {
            conditions.disable.push("GU Tract, Child, Blood in urine severity", "GU Tract, Child, Duration of blood in urine");
        }
        return conditions;
        },
    "Substance Abuse, Do you drink alcoholic beverages?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Substance Abuse, Do you drink alcoholic beverages?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Substance Abuse, Alcohol consumption", "Substance Abuse, What type of alcohol do you drink?");
        } else {
            conditions.disable.push("Substance Abuse, Alcohol consumption", "Substance Abuse, What type of alcohol do you drink?");
        }
        return conditions;
        },
    "Substance Abuse, Do you use illicit drugs": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Substance Abuse, Do you use illicit drugs'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Substance Abuse, What types of illicit drugs do you use and how often?");
        } else {
            conditions.disable.push("Substance Abuse, What types of illicit drugs do you use and how often?");
        }
        return conditions;
        },
    "Substance Abuse, Are you or have you ever been a smoker?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Substance Abuse, Are you or have you ever been a smoker?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Substance Abuse, When did you start smoking? (year)", "Substance Abuse, How many cigarettes per day on average?", "Substance Abuse, Have you stopped smoking completely?");
        } else {
            conditions.disable.push("Substance Abuse, When did you start smoking? (year)", "Substance Abuse, How many cigarettes per day on average?", "Substance Abuse, Have you stopped smoking completely?");
        }
        return conditions;
        },
    'LH, Have you had a cough?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['LH, Have you had a cough?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("LH, Type of cough","LH, Duration of the cough");
        } else {
            conditions.disable.push("LH, Type of cough","LH, Duration of the cough");
        }
        return conditions;
         },
     'LH, Have you experienced shortness of breath?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['LH, Have you experienced shortness of breath?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("LH, When does the shortness of breath occur?","LH, Duration of shortness of breath?");
        } else {
            conditions.disable.push("LH, When does the shortness of breath occur?","LH, Duration of shortness of breath?");
        }
        return conditions;
        },
     'LH, Have you had a chest pain?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['LH, Have you had a chest pain?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("LH, Location of the chest pain","LH, Duration of chest pains?");
        } else {
            conditions.disable.push("LH, Location of the chest pain","LH, Duration of chest pains?");
        }
        return conditions;
        },
     'LH, Location of the chest pain': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['LH, Location of the chest pain'];
        if (conditionConcept.indexOf("Other locations") >=0) {
            conditions.enable.push("LH, If other location of the chest pain, specify");
        } else {
            conditions.disable.push("LH, If other location of the chest pain, specify");
        }
        return conditions;
        },
     'LH, Have you had more than one episodes of Pneumonia?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['LH, Have you had more than one episodes of Pneumonia?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("LH, How many episodes of Pneumonia?");
        } else {
            conditions.disable.push("LH, How many episodes of Pneumonia?");
        }
        return conditions;
        },
     'LH, Have you had Pneumocystis Carini Pneumonia?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['LH, Have you had Pneumocystis Carini Pneumonia?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("LH, Date of Pneumocystis Carini Pnemonia?");
        } else {
            conditions.disable.push("LH, Date of Pneumocystis Carini Pnemonia?");
        }
        return conditions;
        },
     'LH, Have you had oedema?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['LH, Have you had oedema?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("LH, If yes on oedema, where?","LH, Oedeme other comments");
        } else {
            conditions.disable.push("LH, If yes on oedema, where?","LH, Oedeme other comments");
        }
        return conditions;
        },
     'LH, Have you experienced wheezing?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['LH, Have you experienced wheezing?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("LH, If yes on wheezing, specify type","LH, Wheezing other comments");
        } else {
            conditions.disable.push("LH, If yes on wheezing, specify type","LH, Wheezing other comments");
        }
        return conditions;
        },
     'LH, Do you have a high blood pressure': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['LH, Do you have a high blood pressure'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("LH, Are you on Hypertensive drugs?","LH, Is your blood pressure controlled?");
         var OnHypersensitiveDrugs = formFieldValues['LH, Are you on Hypertensive drugs?'];
         if (OnHypersensitiveDrugs == "Yes") {
          conditions.enable.push("LH, If yes on Hypertensive drugs, specify");
         } else {
          conditions.disable.push("LH, If yes on Hypertensive drugs, specify");
         }
        } else {
            conditions.disable.push("LH, Are you on Hypertensive drugs?","LH, Is your blood pressure controlled?");
        }
        return conditions;
        },
     'LH, Are you on Hypertensive drugs?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['LH, Are you on Hypertensive drugs?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("LH, If yes on Hypertensive drugs, specify");
        } else {
            conditions.disable.push("LH, If yes on Hypertensive drugs, specify");
        }
        return conditions;
        },

    'TB History, Are you currently being treated for TB?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['TB History, Are you currently being treated for TB?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("TB History, How was the current TB diagnosed?","TB History, Location of current TB");
         var OtherMethod = formFieldValues['TB History, How was the current TB diagnosed?'];
         var OtherLocation = formFieldValues['TB History, Location of current TB'];
         if (OtherMethod == "Other") {
          conditions.enable.push("TB History, If other for current TB diagnosed, specify");
         } else {
          conditions.disable.push("TB History, If other for current TB diagnosed, specify");
         }
         if (OtherLocation == "Other") {
                conditions.enable.push("TB History, If other for current TB location, specify");
            } else {
                conditions.disable.push("TB History, If other for current TB location, specify");
            }
        } else {
            conditions.disable.push("TB History, How was the current TB diagnosed?","TB History, Location of current TB");
        }
        return conditions;
        },
     'TB History, How was the current TB diagnosed?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['TB History, How was the current TB diagnosed?'];
        if (conditionConcept == "Other") {
            conditions.enable.push("TB History, If other for current TB diagnosed, specify");
        } else {
            conditions.disable.push("TB History, If other for current TB diagnosed, specify");
        }
        return conditions;
        },
     'TB History, Location of current TB': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['TB History, Location of current TB'];
        if (conditionConcept == "Other") {
            conditions.enable.push("TB History, If other for current TB location, specify");
        } else {
            conditions.disable.push("TB History, If other for current TB location, specify");
        }
        return conditions;
        },
     'TB History, Have been treated for TB before?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['TB History, Have been treated for TB before?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("TB History, How was the previous TB diagnosed?","TB History, Location of previous TB","TB History, How many episodes of TB?","TB History, When were you treated for TB","TB History, Where were you last treated?","TB History, Was treatment interupted?");
            var OtherMethod = formFieldValues['TB History, How was the previous TB diagnosed?'];
            var OtherLocation = formFieldValues['TB History, Location of previous TB'];
            if (OtherMethod == "Other") {
                conditions.enable.push("TB History, If other for previous TB diagnosed, specify");
            } else {
                conditions.disable.push("TB History, If other for previous TB diagnosed, specify");
            }
            if (OtherLocation == "Other") {
                conditions.enable.push("TB History, If other for previous TB location, specify");
            } else {
                conditions.disable.push("TB History, If other for previous TB location, specify");
            }
        } else {
            conditions.disable.push("TB History, How was the previous TB diagnosed?","TB History, Location of previous TB","TB History, How many episodes of TB?","TB History, When were you treated for TB","TB History, Where were you last treated?","TB History, Was treatment interupted?");
        }
        return conditions;
        },
        'TB History, How was the previous TB diagnosed?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['TB History, How was the previous TB diagnosed?'];
        if (conditionConcept == "Other") {
            conditions.enable.push("TB History, If other for previous TB diagnosed, specify");
        } else {
            conditions.disable.push("TB History, If other for previous TB diagnosed, specify");
        }
        return conditions;
        },
        'TB History, Location of previous TB': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['TB History, Location of previous TB'];
        if (conditionConcept == "Other") {
            conditions.enable.push("TB History, If other for previous TB location, specify");
        } else {
            conditions.disable.push("TB History, If other for previous TB location, specify");
        }
        return conditions;
        },
     'TB History, Has you mother or caregiver been treated for TB? (for children under 5)': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['TB History, Has you mother or caregiver been treated for TB? (for children under 5)'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("TB History, Did you received IPT?");
        } else {
            conditions.disable.push("TB History, Did you received IPT?");
        }
        return conditions;
        },
    'Abuse, Have you experienced or are you experiencing any form of non-sexual abuse?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Abuse, Have you experienced or are you experiencing any form of non-sexual abuse?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Abuse, If yes on non-sexual abuse, specify type");
        } else {
            conditions.disable.push("Abuse, If yes on non-sexual abuse, specify type");
        }
        return conditions;
        },
    'Abuse, Have you been sexually abused?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Abuse, Have you been sexually abused?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Abuse, Has a police report been filed?","Abuse, Did you receive any medical treatment afterwards?","Abuse, Did you receive counseling?");
        } else {
            conditions.disable.push("Abuse, Has a police report been filed?","Abuse, Did you receive any medical treatment afterwards?","Abuse, Did you receive counseling?");
        }
        return conditions;
        },

    'HIV Prevention, Are you sexually active?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HIV Prevention, Are you sexually active?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("HIV Prevention, Age of sexual debut","HIV Prevention, Sexual partners","HIV Prevention, Do you use condoms every time you have sex?");
         var OtherPartners = formFieldValues['HIV Prevention, Sexual partners'];
         var CondomUse = formFieldValues['HIV Prevention, Do you use condoms every time you have sex?'];
         if (OtherPartners == "Other partners") {
          conditions.enable.push("HIV Prevention, If other partners, specify how many");
         } else {
          conditions.disable.push("HIV Prevention, If other partners, specify how many");
         }
         if (CondomUse == "Yes") {
          conditions.enable.push("HIV Prevention, Male condom use","HIV Prevention, Female condom use");
         } else {
          conditions.disable.push("HIV Prevention, Male condom use","HIV Prevention, Female condom use");
         }
        } else {
            conditions.disable.push("HIV Prevention, Age of sexual debut","HIV Prevention, Sexual partners","HIV Prevention, Do you use condoms every time you have sex?");
        }
        return conditions;
        },
     'HIV Prevention, Sexual partners': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HIV Prevention, Sexual partners'];
        if (conditionConcept == "Other partners") {
            conditions.enable.push("HIV Prevention, If other partners, specify how many");
        } else {
            conditions.disable.push("HIV Prevention, If other partners, specify how many");
        }
        return conditions;
        },
     'HIV Prevention, Do you use condoms every time you have sex?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HIV Prevention, Do you use condoms every time you have sex?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("HIV Prevention, Male condom use","HIV Prevention, Female condom use");
        } else {
            conditions.disable.push("HIV Prevention, Male condom use","HIV Prevention, Female condom use");
        }
        return conditions;
        },

      'Skin, Do you have any skin problems?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Skin, Do you have any skin problems?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Skin, Have you had a skin rash recently?","Skin, Have you ever had Herpes zoster / shingles?","Skin, Is your skin inflammed?","Skin, Have you ever had any of the following?","Skin, Fungal infections?","Skin, Pruritis / Prurigo","Skin, Papular pruritic eruptions","Skin, Have you ever had Kaposi Sarcoma?","Skin, Have you observed a lump growing?");
         var SkinRashRecently = formFieldValues['Skin, Have you had a skin rash recently?'];
         var HerpesShingles = formFieldValues['Skin, Have you ever had Herpes zoster / shingles?'];
         var SkinInflammed = formFieldValues['Skin, Is your skin inflammed?'];
         var FungalInfections = formFieldValues['Skin, Fungal infections?'];
         var Pruritis = formFieldValues['Skin, Pruritis / Prurigo'];
         var KaposiSarcoma = formFieldValues['Skin, Have you ever had Kaposi Sarcoma?'];
         var LumpGrow = formFieldValues['Skin, Have you observed a lump growing?'];
         if (SkinRashRecently == "Yes") {
          conditions.enable.push("Skin, Did the skin rash start after taking new medications","Skin, Did you experience any itching with the rash?","Skin, Morphology of rash","Skin, Date rash started","Skin, Location of the skin rash");
         } else {
          conditions.disable.push("Skin, Did the skin rash start after taking new medications","Skin, Did you experience any itching with the rash?","Skin, Morphology of rash","Skin, Date rash started","Skin, Location of the skin rash");
         }
         if (HerpesShingles == "Yes") {
          conditions.enable.push("Skin, Herpes Zoster (scars)?","Skin, Shingles dates");
         } else {
          conditions.disable.push("Skin, Herpes Zoster (scars)?","Skin, Shingles dates");
         }
            if (SkinInflammed == "Yes") {
                conditions.enable.push("Skin, If yes on skin inflammed, specify type");
            } else {
                conditions.disable.push("Skin, If yes on skin inflammed, specify type");
            }
            if (FungalInfections == "Yes") {
                conditions.enable.push("Skin, If yes on fungal infections, where");
            } else {
                conditions.disable.push("Skin, If yes on fungal infections, where");
            }
            if (Pruritis == "Yes") {
                conditions.enable.push("Skin, If yes on Pruritis, specify type");
            } else {
                conditions.disable.push("Skin, If yes on Pruritis, specify type");
            }
            if (KaposiSarcoma == "Yes") {
                conditions.enable.push("Skin, Location of Kaposi Sarcoma","Skin, Kaposi Sarcoma Lesions present");
            } else {
                conditions.disable.push("Skin, Location of Kaposi Sarcoma","Skin, Kaposi Sarcoma Lesions present");
            }
            if (LumpGrow == "Yes") {
                conditions.enable.push("Skin, Location of lump","Skin, Duration of lump","Skin, Is the lump growing in size?");
            } else {
                conditions.disable.push("Skin, Location of lump","Skin, Duration of lump","Skin, Is the lump growing in size?");
            }
     } else {
            conditions.disable.push("Skin, Have you had a skin rash recently?","Skin, Have you ever had Herpes zoster / shingles?","Skin, Is your skin inflammed?","Skin, Have you ever had any of the following?","Skin, Fungal infections?","Skin, Pruritis / Prurigo","Skin, Papular pruritic eruptions","Skin, Have you ever had Kaposi Sarcoma?","Skin, Have you observed a lump growing?");
        }
        return conditions;
        },
    'Skin, Have you had a skin rash recently?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Skin, Have you had a skin rash recently?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Skin, Did the skin rash start after taking new medications","Skin, Did you experience any itching with the rash?","Skin, Morphology of rash","Skin, Date rash started"
                ,"Skin, Location of the skin rash","Skin, Images of location of rash section");
         var AfterNewMeds = formFieldValues['Skin, Did the skin rash start after taking new medications'];
         var Itching = formFieldValues['Skin, Did you experience any itching with the rash?'];
         if (AfterNewMeds == "Yes") {
          conditions.enable.push("Skin, How long after taking the new medication?");
         } else {
          conditions.disable.push("Skin, How long after taking the new medication?");
         }
         if (Itching == "Yes") {
                conditions.enable.push("Skin, Severity of itchiness");
            } else {
                conditions.disable.push("Skin, Severity of itchiness");
            }
        } else {
            conditions.disable.push("Skin, Did the skin rash start after taking new medications","Skin, Did you experience any itching with the rash?","Skin, Morphology of rash","Skin, Date rash started"
                ,"Skin, Location of the skin rash","Skin, Images of location of rash section");
        }
        return conditions;
        },
     'Skin, Did the skin rash start after taking new medications': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Skin, Did the skin rash start after taking new medications'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Skin, How long after taking the new medication?");
        } else {
            conditions.disable.push("Skin, How long after taking the new medication?");
        }
        return conditions;
        },
     'Skin, Did you experience any itching with the rash?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Skin, Did you experience any itching with the rash?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Skin, Severity of itchiness");
        } else {
            conditions.disable.push("Skin, Severity of itchiness");
        }
        return conditions;
        },
     'Skin, Have you ever had Herpes zoster / shingles?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Skin, Have you ever had Herpes zoster / shingles?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Skin, Herpes Zoster (scars)?","Skin, Shingles dates");
         var Scars = formFieldValues['Skin, Herpes Zoster (scars)?'];
         if (Scars == "Yes") {
          conditions.enable.push("Skin, Location of the Shingles","Skin, Images of location of shingles section");
         } else {
          conditions.disable.push("Skin, Location of the Shingles","Skin, Images of location of shingles section");
         }
        } else {
            conditions.disable.push("Skin, Herpes Zoster (scars)?","Skin, Shingles dates");
        }
        return conditions;
        },
     'Skin, Herpes Zoster (scars)?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Skin, Herpes Zoster (scars)?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Skin, Location of the Shingles","Skin, Images of location of shingles section");
        } else {
            conditions.disable.push("Skin, Location of the Shingles","Skin, Images of location of shingles section");
        }
        return conditions;
        },
     'Skin, Is your skin inflammed?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Skin, Is your skin inflammed?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Skin, If yes on skin inflammed, specify type");
         
        } else {
            conditions.disable.push("Skin, If yes on skin inflammed, specify type");
        }
        return conditions;
        },
     'Skin, If yes on skin inflammed, specify type': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Skin, If yes on skin inflammed, specify type'];
        if (conditionConcept.indexOf('Other') >= 0) {
            conditions.enable.push("Skin, Specify other inflammation type");
        } else {
            conditions.disable.push("Skin, Specify other inflammation type");
        }
        return conditions;
        },
     'Skin, Fungal infections?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Skin, Fungal infections?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Skin, If yes on fungal infections, where");
        } else {
            conditions.disable.push("Skin, If yes on fungal infections, where");
        }
        return conditions;
        },
    'Skin, Pruritis / Prurigo': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Skin, Pruritis / Prurigo'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Skin, If yes on Pruritis, specify type");
        } else {
            conditions.disable.push("Skin, If yes on Pruritis, specify type");
        }
        return conditions;
        },
     'Skin, Have you ever had Kaposi Sarcoma?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Skin, Have you ever had Kaposi Sarcoma?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Skin, Location of Kaposi Sarcoma","Skin, Kaposi Sarcoma Lesions present");
        } else {
            conditions.disable.push("Skin, Location of Kaposi Sarcoma","Skin, Kaposi Sarcoma Lesions present");
        }
        return conditions;
        },
     'Skin, Have you observed a lump growing?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Skin, Have you observed a lump growing?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Skin, Location of lump","Skin, Duration of lump","Skin, Is the lump growing in size?");
        } else {
            conditions.disable.push("Skin, Location of lump","Skin, Duration of lump","Skin, Is the lump growing in size?");
        }
        return conditions;
        },
    'HIV Testing, Have you had a positive HIV test?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HIV Testing, Have you had a positive HIV test?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("HIV Testing, When was the test done?","HIV Testing, Do you have a copy of the test result?","HIV Testing, Why was the test done?","HIV Testing, Do you have a partner?","HIV Testing, Have you ever had a Negative HIV test?","HIV Testing, Do you have any children?","HIV Testing, Is any of your other family members HIV Positive?");
         var WhyTestDone = formFieldValues['HIV Testing, Why was the test done?'];
         var Partner = formFieldValues['HIV Testing, Do you have a partner?'];
         var NegHIVTest = formFieldValues['HIV Testing, Have you ever had a Negative HIV test?'];
         var Children = formFieldValues['HIV Testing, Do you have any children?'];
         var FamilyMemHIVPos = formFieldValues['HIV Testing, Is any of your other family members HIV Positive?'];
         if (WhyTestDone == "Other") {
          conditions.enable.push("HIV Testing, If other reason for test, specify why");
         } else {
          conditions.disable.push("HIV Testing, If other reason for test, specify why");
         }
            if (Partner == "Yes") {
                conditions.enable.push("HIV Testing, Is your (sexual) partner aware of your HIV status?","HIV Testing, Has your partner been tested?","HIV Testing, Is your (sexual) partner aware of his/her HIV status?");
            } else {
                conditions.disable.push("HIV Testing, Is your (sexual) partner aware of your HIV status?","HIV Testing, Has your partner been tested?","HIV Testing, Is your (sexual) partner aware of his/her HIV status?");
            }
            if (NegHIVTest == "Yes") {
                conditions.enable.push("HIV Testing, When was the negative test done?");
            } else {
                conditions.disable.push("HIV Testing, When was the negative test done?");
            }
            if (Children == "Yes") {
                conditions.enable.push("HIV Testing, How many children do you have?","HIV Testing, Has any of your children tested?");
            } else {
                conditions.disable.push("HIV Testing, How many children do you have?","HIV Testing, Has any of your children tested?");
            }
            if (FamilyMemHIVPos == "Yes") {
                conditions.enable.push("HIV Testing, Are they receiving HIV care?");
            } else {
                conditions.disable.push("HIV Testing, Are they receiving HIV care?");
            }
        } else {
            conditions.disable.push("HIV Testing, When was the test done?","HIV Testing, Do you have a copy of the test result?","HIV Testing, Why was the test done?","HIV Testing, Do you have a partner?","HIV Testing, Have you ever had a Negative HIV test?","HIV Testing, Do you have any children?","HIV Testing, Is any of your other family members HIV Positive?");
        }
        return conditions;
        },
     'HIV Testing, Why was the test done?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HIV Testing, Why was the test done?'];
        if (conditionConcept == "Other") {
            conditions.enable.push("HIV Testing, If other reason for test, specify why");
        } else {
            conditions.disable.push("HIV Testing, If other reason for test, specify why");
        }
        return conditions;
        },
     'HIV Testing, Do you have a partner?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HIV Testing, Do you have a partner?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("HIV Testing, Is your (sexual) partner aware of your HIV status?","HIV Testing, Has your partner been tested?","HIV Testing, Is your (sexual) partner aware of his/her HIV status?");
         var PartnerAware = formFieldValues['HIV Testing, Is your (sexual) partner aware of his/her HIV status?'];
         if (PartnerAware == "Yes") {
          conditions.enable.push("HIV Testing, If yes, what is the partners HIV status");
         } else {
          conditions.disable.push("HIV Testing, If yes, what is the partners HIV status");
         }
        } else {
            conditions.disable.push("HIV Testing, Is your (sexual) partner aware of your HIV status?","HIV Testing, Has your partner been tested?","HIV Testing, Is your (sexual) partner aware of his/her HIV status?");
        }
        return conditions;
        },
     'HIV Testing, Is your (sexual) partner aware of his/her HIV status?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HIV Testing, Is your (sexual) partner aware of his/her HIV status?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("HIV Testing, If yes, what is the partners HIV status");
        } else {
            conditions.disable.push("HIV Testing, If yes, what is the partners HIV status");
        }
        return conditions;
        },
     'HIV Testing, Have you ever had a Negative HIV test?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HIV Testing, Have you ever had a Negative HIV test?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("HIV Testing, When was the negative test done?");
        } else {
            conditions.disable.push("HIV Testing, When was the negative test done?");
        }
        return conditions;
        },
    'HIV Testing, Do you have any children?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HIV Testing, Do you have any children?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("HIV Testing, How many children do you have?","HIV Testing, Has any of your children tested?");
         var ChildrenTested = formFieldValues['HIV Testing, Has any of your children tested?'];
         if (ChildrenTested == "Yes") {
          conditions.enable.push("HIV Testing, Number of Children HIV positive","HIV Testing, Number of children HIV negative","HIV Testing, Number of children not tested");
         } else {
          conditions.disable.push("HIV Testing, Number of Children HIV positive","HIV Testing, Number of children HIV negative","HIV Testing, Number of children not tested");
         }
        } else {
            conditions.disable.push("HIV Testing, How many children do you have?","HIV Testing, Has any of your children tested?");
        }
        return conditions;
        },
     'HIV Testing, Has any of your children tested?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HIV Testing, Has any of your children tested?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("HIV Testing, Number of Children HIV positive","HIV Testing, Number of children HIV negative","HIV Testing, Number of children not tested");
        } else {
            conditions.disable.push("HIV Testing, Number of Children HIV positive","HIV Testing, Number of children HIV negative","HIV Testing, Number of children not tested");
        }
        return conditions;
        },
     'HIV Testing, Is any of your other family members HIV Positive?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HIV Testing, Is any of your other family members HIV Positive?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("HIV Testing, Are they receiving HIV care?");
        } else {
            conditions.disable.push("HIV Testing, Are they receiving HIV care?");
        }
        return conditions;
        },

    'GI Tract, Do you have difficulty swallowing?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['GI Tract, Do you have difficulty swallowing?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("GI Tract, Is swallowing painful","GI Tract, Swallowing difficulty details","GI Tract, Swallowing difficulty duration");
        } else {
            conditions.disable.push("GI Tract, Is swallowing painful","GI Tract, Swallowing difficulty details","GI Tract, Swallowing difficulty duration");
        }
        return conditions;
        },
     'GI Tract, Do you have frequent nausea?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['GI Tract, Do you have frequent nausea?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("GI Tract, Nausea severity");
        } else {
            conditions.disable.push("GI Tract, Nausea severity");
        }
        return conditions;
        },
     'GI Tract, Do you vomit frequently?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['GI Tract, Do you vomit frequently?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("GI Tract, When do you vomit?","GI Tract, Vomit content");
         var VomitOther = formFieldValues['GI Tract, When do you vomit?'];
         if (VomitOther == "Other") {
          conditions.enable.push("GI Tract, If other on vomit, specify");
         } else {
          conditions.disable.push("GI Tract, If other on vomit, specify");
         }
        } else {
            conditions.disable.push("GI Tract, When do you vomit?","GI Tract, Vomit content");
        }
        return conditions;
        },
          'GI Tract, When do you vomit?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['GI Tract, When do you vomit?'];
        if (conditionConcept == "Other") {
            conditions.enable.push("GI Tract, If other on vomit, specify");
        } else {
            conditions.disable.push("GI Tract, If other on vomit, specify");
        }
        return conditions;
        },
        'GI Tract, Vomit content': function (formName, formFieldValues) {
            var conditions = {enable: [], disable: []};
            var conditionConcept = formFieldValues['GI Tract, Vomit content'];
            if (conditionConcept == "Other") {
                conditions.enable.push("GI Tract, If other, specify details of vomit content");
            } else {
                conditions.disable.push("GI Tract, If other, specify details of vomit content");
            }
            return conditions;
        },
         'GI Tract, Do you suffer from heartburn?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['GI Tract, Do you suffer from heartburn?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("GI Tract, When does the heartburn occur?");
        } else {
            conditions.disable.push("GI Tract, When does the heartburn occur?");
        }
        return conditions;
        },
     'GI Tract, Do you have frequent diarrhea?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['GI Tract, Do you have frequent diarrhea?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("GI Tract, Diarrhea Details","GI Tract, Diarrhea duration");
        } else {
            conditions.disable.push("GI Tract, Diarrhea Details","GI Tract, Diarrhea duration");
        }
        return conditions;
        },
     'GI Tract, Do you have frequent abdominal pain?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['GI Tract, Do you have frequent abdominal pain?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("GI Tract, Abdominal pain location","GI Tract, Abdominal pain type","GI Tract, Abdominal pain duration","GI Tract, Does the abdominal pain occur during fasting?");
        } else {
            conditions.disable.push("GI Tract, Abdominal pain location","GI Tract, Abdominal pain type","GI Tract, Abdominal pain duration","GI Tract, Does the abdominal pain occur during fasting?");
        }
        return conditions;
        },
     'GI Tract, Are you frequently constipated?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['GI Tract, Are you frequently constipated?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("GI Tract, Duration of constipation?");
        } else {
            conditions.disable.push("GI Tract, Duration of constipation?");
        }
        return conditions;
        },
     'GI Tract, Have you experienced abdominal swelling?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['GI Tract, Have you experienced abdominal swelling?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("GI Tract, Duration of abdominal swelling");
        } else {
            conditions.disable.push("GI Tract, Duration of abdominal swelling");
        }
        return conditions;
        },

    'Contact Tracing, Has your partner been tested?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Contact Tracing, Has your partner been tested?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Contact Tracing, If Yes, what was the result");
         conditions.disable.push("Contact Tracing, If Not tested, why have they not been tested?");
         var Result = formFieldValues['Contact Tracing, If Yes, what was the result'];
         if (Result == "Positive") {
          conditions.enable.push("Contact Tracing, If Positive, are they on ART or No");
          conditions.disable.push("Contact Tracing, If Negative, when was the last test done");
         } else if (Result == "Negative") {
          conditions.enable.push("Contact Tracing, If Negative, when was the last test done");
          conditions.disable.push("Contact Tracing, If Positive, are they on ART or No");
         } else {
          conditions.disable.push("Contact Tracing, If Positive, are they on ART or No","Contact Tracing, If Negative, when was the last test done");
         }
        } else if (conditionConcept == "No") {
         conditions.enable.push("Contact Tracing, If Not tested, why have they not been tested?");
            conditions.disable.push("Contact Tracing, If Yes, what was the result");
         var WhyNotTested = formFieldValues['Contact Tracing, If Not tested, why have they not been tested?'];
         if (WhyNotTested == "Too Busy") {
          conditions.enable.push("Contact Tracing, If they are too busy, would you be comfortable in us visiting your home to provide the HIV testing?");
         } else {
          conditions.disable.push("Contact Tracing, If they are too busy, would you be comfortable in us visiting your home to provide the HIV testing?");
         }
        } else {
         conditions.disable.push("Contact Tracing, If Yes, what was the result","Contact Tracing, If Not tested, why have they not been tested?");
     }
        return conditions;
        },
     'Contact Tracing, If Yes, what was the result': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Contact Tracing, If Yes, what was the result'];
        if (conditionConcept == "Positive") {
            conditions.enable.push("Contact Tracing, If Positive, are they on ART or No");
            conditions.disable.push("Contact Tracing, If Negative, when was the last test done");
        } else if (conditionConcept == "Negative") {
            conditions.enable.push("Contact Tracing, If Negative, when was the last test done");
            conditions.disable.push("Contact Tracing, If Positive, are they on ART or No");
        } else {
            conditions.disable.push("Contact Tracing, If Positive, are they on ART or No","Contact Tracing, If Negative, when was the last test done");
        }
        return conditions;
        },
     'Contact Tracing, If Not tested, why have they not been tested?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Contact Tracing, If Not tested, why have they not been tested?'];
        if (conditionConcept == "Too Busy") {
            conditions.enable.push("Contact Tracing, If they are too busy, would you be comfortable in us visiting your home to provide the HIV testing?");
         var HomeVisit = formFieldValues['Contact Tracing, If they are too busy, would you be comfortable in us visiting your home to provide the HIV testing?'];
         if (HomeVisit == "Yes") {
          conditions.enable.push("Contact Tracing, Would you mind if we call to check when you are ready for the test","Contact Tracing, After how long do you think we should call you");
         } else {
          conditions.disable.push("Contact Tracing, Would you mind if we call to check when you are ready for the test","Contact Tracing, After how long do you think we should call you");
         }
        } else {
            conditions.disable.push("Contact Tracing, If they are too busy, would you be comfortable in us visiting your home to provide the HIV testing?");
        }
        return conditions;
        },
     'Contact Tracing, If they are too busy, would you be comfortable in us visiting your home to provide the HIV testing?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Contact Tracing, If they are too busy, would you be comfortable in us visiting your home to provide the HIV testing?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Contact Tracing, Would you mind if we call to check when you are ready for the test","Contact Tracing, After how long do you think we should call you");
        } else {
            conditions.disable.push("Contact Tracing, Would you mind if we call to check when you are ready for the test","Contact Tracing, After how long do you think we should call you");
        }
        return conditions;
        },
     'Contact Tracing, Would you be comfortable if we contact your partner(s) that they can come for HIV test': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Contact Tracing, Would you be comfortable if we contact your partner(s) that they can come for HIV test'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Contact Tracing, If Yes, should we mention that you gave us their details or it should be anonymous","Contact Tracing, What time of the day would be advisable to call your partner");
        } else {
            conditions.disable.push("Contact Tracing, If Yes, should we mention that you gave us their details or it should be anonymous","Contact Tracing, What time of the day would be advisable to call your partner");
        }
        return conditions;
        },
        "Contact Tracing, What time of the day would be advisable to call your partner": function (formName, formFieldValues) {
            var conditions = {enable: [], disable: []};
            var conditionConcept = formFieldValues['Contact Tracing, What time of the day would be advisable to call your partner'];
            if (conditionConcept == "Given a specific time") {
                conditions.enable.push("Contact Tracing, Specify time");
            } else {
                conditions.disable.push("Contact Tracing, Specify time");
            }
            return conditions;
        },
    'Contact Tracing, Do you have any children?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Contact Tracing, Do you have any children?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Contact Tracing, If Yes, how old are they, in their chronological order","Contact Tracing, Have any of your children been tested");
         var ChildrenTested = formFieldValues['Contact Tracing, Have any of your children been tested'];
         if (ChildrenTested == "Yes") {
          conditions.enable.push("Contact Tracing, If tested, how many","Contact Tracing, If tested, how many negative","Contact Tracing, If tested, how many positive");
          conditions.disable.push("Contact Tracing, If not tested, would you be comfortable if they get tested");
         } else if (ChildrenTested == "No") {
          conditions.enable.push("Contact Tracing, If not tested, would you be comfortable if they get tested");
          conditions.disable.push("Contact Tracing, If tested, how many","Contact Tracing, If tested, how many negative","Contact Tracing, If tested, how many positive");
         } else {
          conditions.disable.push("Contact Tracing, If tested, how many","Contact Tracing, If tested, how many negative","Contact Tracing, If tested, how many positive","Contact Tracing, If not tested, would you be comfortable if they get tested");
         }
        } else {
            conditions.disable.push("Contact Tracing, If Yes, how old are they, in their chronological order","Contact Tracing, Have any of your children been tested");
        }
        return conditions;
        },
     'Contact Tracing, Have any of your children been tested': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Contact Tracing, Have any of your children been tested'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Contact Tracing, If tested, how many","Contact Tracing, If tested, how many negative","Contact Tracing, If tested, how many positive");
            conditions.disable.push("Contact Tracing, If not tested, would you be comfortable if they get tested");
         var HIVPos = formFieldValues['Contact Tracing, If tested, how many positive'];
         if (HIVPos > 0) {
          conditions.enable.push("Contact Tracing, If positive are they on ART");
         } else {
          conditions.disable.push("Contact Tracing, If positive are they on ART");
         }
        } else if (conditionConcept == "No") {
            conditions.enable.push("Contact Tracing, If not tested, would you be comfortable if they get tested");
            conditions.disable.push("Contact Tracing, If tested, how many","Contact Tracing, If tested, how many negative","Contact Tracing, If tested, how many positive");
         var GetTested = formFieldValues['Contact Tracing, If not tested, would you be comfortable if they get tested'];
         if (GetTested == "Yes") {
          conditions.enable.push("Contact Tracing, If Yes, what would you prefer a home visit or bringing them to NSC");
         } else {
          conditions.disable.push("Contact Tracing, If Yes, what would you prefer a home visit or bringing them to NSC");
         }
        } else {
            conditions.disable.push("Contact Tracing, If tested, how many","Contact Tracing, If tested, how many negative","Contact Tracing, If tested, how many positive","Contact Tracing, If not tested, would you be comfortable if they get tested");
        }
        return conditions;
        },
     'Contact Tracing, If tested, how many positive': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Contact Tracing, If tested, how many positive'];
        if (conditionConcept > 0) {
            conditions.enable.push("Contact Tracing, If positive are they on ART");
        } else {
            conditions.disable.push("Contact Tracing, If positive are they on ART");
        }
        return conditions;
        },
     'Contact Tracing, If not tested, would you be comfortable if they get tested': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Contact Tracing, If not tested, would you be comfortable if they get tested'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Contact Tracing, If Yes, what would you prefer a home visit or bringing them to NSC");
        } else {
            conditions.disable.push("Contact Tracing, If Yes, what would you prefer a home visit or bringing them to NSC");
        }
        return conditions;
        },
     'Contact Tracing, Do you think there is a family member that might have been exposed to HIV that you would want to be tested': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Contact Tracing, Do you think there is a family member that might have been exposed to HIV that you would want to be tested'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Contact Tracing, If Yes, how would you want them contacted");
        } else {
            conditions.disable.push("Contact Tracing, If Yes, how would you want them contacted");
        }
        return conditions;
        },
	"PHTC, Ever had sexual intercourse": function(formName, formFieldValues) {
                var questionThatTriggersRule = "PHTC, Ever had sexual intercourse";
                var selectedResponses = formFieldValues[questionThatTriggersRule];
                var question1AffectedByRule = "PHTC, Age of first penetrative sex";
                var question2AffectedByRule = "PHTC, Do you or your partner currently have an STI";
                var question3AffectedByRule = "PHTC, In the last twelve months, ever had sex while intoxicated";
                var question4AffectedByRule = "PHTC, In the last twelve month exchanged money or goods for sex";
                var question5AffectedByRule = "PHTC, Last time you had sex did you use a condom";
                var question6AffectedByRule = "PHTC, Do you currently have more than one sexual partner (including your spouse or regular partner)";
                var question7AffectedByRule = "PHTC, How many sexual partners did you have in the last twelve months (including your spouse or sexual partner)";
                var question8AffectedByRule = "PHTC, Are you or your partner circumcised (Male circumcision)";
                var conditionTrue = selectedResponses == 'Yes';
                var ruleActions = {enable: [], disable: []};
                if(conditionTrue) {
                        ruleActions.enable.push(question1AffectedByRule);
                        ruleActions.enable.push(question2AffectedByRule);
                        ruleActions.enable.push(question3AffectedByRule);
                        ruleActions.enable.push(question4AffectedByRule);
                        ruleActions.enable.push(question5AffectedByRule);
                        ruleActions.enable.push(question6AffectedByRule);
                        ruleActions.enable.push(question7AffectedByRule);
                        ruleActions.enable.push(question8AffectedByRule);
                } else {
                        ruleActions.disable.push(question1AffectedByRule);
                        ruleActions.disable.push(question2AffectedByRule);
                        ruleActions.disable.push(question3AffectedByRule);
                        ruleActions.disable.push(question4AffectedByRule);
                        ruleActions.disable.push(question5AffectedByRule);
                        ruleActions.disable.push(question6AffectedByRule);
                        ruleActions.disable.push(question7AffectedByRule);
                        ruleActions.disable.push(question8AffectedByRule);
                }
                return ruleActions;
        },
    "PHTC, Are you currently coughing": function (formName, formFieldValues) {
                var conditions = {enable: [], disable: []};
                var conditionConcept = formFieldValues['PHTC, Are you currently coughing'];
                if (conditionConcept == "Yes") {
                        conditions.enable.push("PHTC, For how long have you been coughing");
                } else {
                        conditions.disable.push("PHTC, For how long have you been coughing");
                }
                return conditions;
        },
    "PHTC, Was referred to:  (Multiple responses possible)": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['PHTC, Was referred to:  (Multiple responses possible)'];
        if (conditionConcept.indexOf("Other") >=0) {
            conditions.enable.push("PHTC, Post Test Counselling Other");
        } else {
            conditions.disable.push("PHTC, Post Test Counselling Other");
        }
        return conditions;
        },
	"HST, External referral to:(Multiple responses possible)": function (formName, formFieldValues) {
                var conditions = {enable: [], disable: []};
                var conditionConcept = formFieldValues['HST, External referral to:(Multiple responses possible)'];
                if (conditionConcept.indexOf("Other") >= 0) {
                        conditions.enable.push("HST, If other on External referral to, specify");
                } else {
                        conditions.disable.push("HST, If other on External referral to, specify");
                }
                return conditions;
        },
    "Have you experienced problems with medicines?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you experienced problems with medicines?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Did you have a rash from taking the medications?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
      },
    "Do you have difficulty swallowing?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you have difficulty swallowing?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Is swallowing painful?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
    },
    "Have you lost your appetite?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you lost your appetite?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Duration of appetite loss ";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
    },
    "Coordinatedbilateral eye movements?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Coordinatedbilateral eye movements?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Double vision";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
    "Do you suffer from frequent nasal discharge?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you suffer from frequent nasal discharge?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Is the discharge associated with headaches?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
    "Do you suffer from frequent nasal discharge?(3)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you suffer from frequent nasal discharge?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Is the discharge associated with swelling in the face?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
    "How many children do you have?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="How many children do you have?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Have any of  your children been tested for HIV?";
        var conditionTrue = selectedResponses == 'Enter Answer';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
    "Are you hard of hearing?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you hard of hearing?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Additional comments about hearing loss";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
    "KS Lesions?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="KS Lesions?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Locations on body";
        var conditionTrue = selectedResponses == 'Enter Answer';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
    "Are you currently pregnant?(4)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you currently pregnant?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Are you on any other drugs?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
    "Have you been screened for cervical cancer?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you been screened for cervical cancer?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Screening result";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
    "Do you suffer from frequent nasal discharge?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you suffer from frequent nasal discharge?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Colour of discharge";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
    "Have you lost weight?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you lost weight?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "How much weight lost";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
    "Did the skin rash start after taking new medication?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Did the skin rash start after taking new medication?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "How long after taking the new medication?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
    "Have you had pneumocystis carinii pneumonia?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you had pneumocystis carinii pneumonia?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Date of pneumocystis carinii pneumonia";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
    "Have you noticed any lumps on the neck?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you noticed any lumps on the neck?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Draining fistulas";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
    "Do you vomit frequently?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you vomit frequently?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "When do you vomit?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
    "Have you noticed ulcers on the penis?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you noticed ulcers on the penis?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Duration of ulcers on the penis";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
    "Do you have any skin problems?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you have any skin problems?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Have you had a skin rash recently?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
    "Have you carried any full term pregnancies?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you carried any full term pregnancies?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "How many full term pregnancies?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
    "Have you been sexually abused?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you been sexually abused?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Has a police report been filed?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },

    "Do you suffer from heartburn?(3)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you suffer from heartburn?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "When does the heartburn occur?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
    "Did you receive PMTCT?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Did you receive PMTCT?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Did you receive PMTCT during pregnancy?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },

    "Have you experienced chronic back pain?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you experienced chronic back pain?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Does the back pain occur with specific movements?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
    "Do you know the due date?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you know the due date?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Due Date";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },

    "PMTCT Provided to Infant(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="PMTCT Provided to Infant";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Drugs/Regimen Received";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
    "Ear pain or discharge?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Ear pain or discharge?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Details";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },

    "Are Sclerae / Conjunctivae normal?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are Sclerae / Conjunctivae normal?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Pterygium present";
        var conditionTrue = selectedResponses == 'No';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
       },
        "Is the child developing like other children of the same age?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Is the child developing like other children of the same age?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Child development issues";
        var conditionTrue = selectedResponses == 'No';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },

        "Have you ever been pregnant?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you ever been pregnant?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Have you carried any full term pregnancies?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Have you had chest pain?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you had chest pain?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Location of chest pain";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Have you noticed any changes in or around the mouth and neck?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you noticed any changes in or around the mouth and neck?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Have you had sores or non healing ulcers in the mouth?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Have you ever been pregnant?(5)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you ever been pregnant?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Age of Children";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Have you had a rash with any of those symptoms?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you had a rash with any of those symptoms?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Duration of rash";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Have you observed a swelling of your limbs(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you observed a swelling of your limbs";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Swelling location";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Are you currently pregnant?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you currently pregnant?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Are you booked for antenatal care?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },

        "Was the pregnancy booked?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Was the pregnancy booked?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "How many antenatal visits did the patient attend?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },

        "Have you had blisters or swelling on/around the lips?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you had blisters or swelling on/around the lips?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "How often";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Have you experienced problems with medicines?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you experienced problems with medicines?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Nausea from taking the medications?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Have you had shortness of breath?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you had shortness of breath?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Shortness of breath duration";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },

        "Do you have a child health card?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you have a child health card?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Is the child growing well as per child health card curve?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },

        "Have you had a positive HIV test?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you had a positive HIV test?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Where was the test performed";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },

        "Do you suffer from frequent nasal discharge?(4)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you suffer from frequent nasal discharge?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Additional comments about nasal discharge";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },

        "Have you ever been pregnant?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you ever been pregnant?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Did you have any premature births?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Have you ever had Herpes zoster / shingles?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you ever had Herpes zoster / shingles?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Shingles date(s)";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Have you had a skin rash recently?(3)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you had a skin rash recently?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Did the skin rash start after taking new medication?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Have you ever had Herpes zoster / shingles?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you ever had Herpes zoster / shingles?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Have you had several episodes?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Have you ever been treated with ARV's?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you ever been treated with ARV's?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Did you miss a dose in the past three days?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Do you vomit frequently?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you vomit frequently?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Vomit content";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Is your (sexual) partner aware of his/her HIV status?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Is your (sexual) partner aware of his/her HIV status?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Partners HIV Status";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Have you ever had Kaposi Sarcoma?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you ever had Kaposi Sarcoma?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Location(s) of Kaposi Sarcoma";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Do you feel a burning sensation with urination?(5)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you feel a burning sensation with urination?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Do you have to get up at night?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },

        "Have you been sexually abused?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you been sexually abused?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Did you receive any medical treatment afterwards?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Do you feel a burning sensation with urination?(6)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you feel a burning sensation with urination?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Did you have a fever, rigors or chills with the burning sensation?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },

        "Do you feel unusually tired?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you feel unusually tired?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Duration of tiredness";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },

        "Do you use contraceptives?(4)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you use contraceptives?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "What types of contraceptives do you use?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Rectal exam performed?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Rectal exam performed?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Results";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Have you changed your medicines?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you changed your medicines?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Changes to ARV's";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },


        "Did you receive PMTCT after delivery?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Did you receive PMTCT after delivery?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "For how long?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Have you experienced loss of sexual interest?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you experienced loss of sexual interest?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Dysparenuia (painful sexual intercourse)";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },


        "Was the pregnancy booked?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Was the pregnancy booked?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Where was the pregnancy booked?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },

        "Do you have high blood pressure?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you have high blood pressure?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Is your BP well controlled?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },

        "Are you suffering from headaches?(3)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you suffering from headaches?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Headache association";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Have you ever been treated with ARV's?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you ever been treated with ARV's?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Have you experienced problems with medicines?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },

        "Thrush?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Thrush?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Associated with difficulty or pain when swallowing?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },

        "Have you experienced joint pain?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you experienced joint pain?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Joint pain duration";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Was the pregnancy booked?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Was the pregnancy booked?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "At what month of the pregnancy was the pregnancy booked?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },

        "Are you sexually active?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you sexually active?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Age of sexual debut";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },

        "Do you suffer from frequent nasal discharge?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you suffer from frequent nasal discharge?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Is the discharge associated with facial pain?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },

        "Are you in school?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you in school?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Did you drop out of  school?";
        var conditionTrue = selectedResponses == 'No';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Record Pulse(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Record Pulse";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Is Pulse Rate above 80 beats per minute?";
        var conditionTrue = selectedResponses == 'Enter Answer';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },

        "Did you have a fever recently?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Did you have a fever recently?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Duration of fever";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Have you reached menopause?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you reached menopause?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Have you missed your period?";
        var conditionTrue = selectedResponses == 'No';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },


        "Tumors?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Tumors?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Inflammation";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },

        "Have you observed blood in your urine?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you observed blood in your urine?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Blood in urine duration";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },




        "Abdominal tenderness?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Abdominal tenderness?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Localized location";
        var conditionTrue = selectedResponses == 'Localized';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Did you have a rash from taking the medications?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Did you have a rash from taking the medications?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Date rash started";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Is patient on triple therapy?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Is patient on triple therapy?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Which drugs?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },

        "Cough?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Cough?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Auscultation";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Has the child ever suffered from measles?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Has the child ever suffered from measles?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Did the child develop eye problems afterward?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Do you feel a burning sensation with urination?(3)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you feel a burning sensation with urination?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Do you feel an urgency to go?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Have you experienced problems with medicines?(3)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you experienced problems with medicines?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Numbness or pins and needles from taking the medications?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },


        "Does the abdominal pain occur during fasting?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Does the abdominal pain occur during fasting?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Epigastric pain?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },


        "Have you lost weight?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you lost weight?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Why do you think you lost weight?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Do you have frequent nausea?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you have frequent nausea?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Nausea severity";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Are you currently pregnant?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you currently pregnant?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "HIV-STATUS OF MOTHER";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Do you use illicit drugs?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you use illicit drugs?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "What types of illicit drugs do you use and how often?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Did the child have any birth defects?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Did the child have any birth defects?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Did the child have a cataract at birth?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Vomiting from taking the medications?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Vomiting from taking the medications?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Were tablets visible in vomitus?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Have you experienced problems with medicines?(6)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you experienced problems with medicines?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Other issues from taking the medications?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Have you observed blood in your urine?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you observed blood in your urine?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Blood in urine severity";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Have you observed a breast lump?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you observed a breast lump?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Duration of breast lump";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },

        "Do you have any skin problems?(3)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you have any skin problems?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Have you observed a lump growing?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },

        "Have you had a positive HIV test?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you had a positive HIV test?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "When was the test done?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },


        "Did you receive PMTCT during pregnancy?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Did you receive PMTCT during pregnancy?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Which drugs?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },



        "Ear pain or discharge?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Ear pain or discharge?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Otoscopic exam performed?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },

        "Have you noticed any changes in or around the mouth and neck?(3)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you noticed any changes in or around the mouth and neck?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Have you had painful or bleeding gums?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },

        "Have you experienced joint pain?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you experienced joint pain?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Location";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Are you suffering from headaches?(4)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you suffering from headaches?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Headache frequency";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Are you or have you ever been a smoker?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you or have you ever been a smoker?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Have you stopped smoking completely?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },

        "Do you have difficulty swallowing?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you have difficulty swallowing?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Swallowing difficulty details";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Did you receive PMTCT after delivery?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Did you receive PMTCT after delivery?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Which drugs?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },


        "Is Partner Dead(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Is Partner Dead";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Cause of Partners Death";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },

        "Do you know the due date?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you know the due date?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Gestational week";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Have you ever been pregnant?(4)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you ever been pregnant?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "How many of your children have died";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },


        "Are you suffering from headaches?(6)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you suffering from headaches?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Headache location";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },

        "Have you noticed painful ulcers on or around the labia?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you noticed painful ulcers on or around the labia?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Duration of labia ulcers";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Were there any problems associated with the pregnancy?(3)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Were there any problems associated with the pregnancy?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Did the mother suffer from severe viral illnesses during pregnancy?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Have you experienced problems with medicines?(5)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you experienced problems with medicines?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Changes in bodily appearance from taking the medications?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },


        "Do you drink alcoholic beverages?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you drink alcoholic beverages?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Alcohol consumption";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },

        "Have any children died(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have any children died";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "CAUSE OF DEATH(S)";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Have you had a skin rash recently?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you had a skin rash recently?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Location of skin rash";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Have you experienced abdominal swelling?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you experienced abdominal swelling?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Duration of abdominal swelling";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },

        "Have you had a skin rash recently?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you had a skin rash recently?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Morphology";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Did the child cry when urinating?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Did the child cry when urinating?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Did the child have a fever when urinating?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Have you observed a lump growing?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you observed a lump growing?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Location of lump";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Vomiting from taking the medications?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Vomiting from taking the medications?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Vomiting occurence";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Did the child breast feed?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Did the child breast feed?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Did the child exclusively breast feed?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },

        "Have you observed blood in your urine?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you observed blood in your urine?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Additional information about blood in the urine";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "KS Lesions?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="KS Lesions?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Approximate number";
        var conditionTrue = selectedResponses == 'Enter Answer';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },


        "Have you lost weight?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you lost weight?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Duration of weight loss";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },

        "Do you have frequent diarrhea?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you have frequent diarrhea?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Diarrhea Details";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Did you receive PMTCT?(3)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Did you receive PMTCT?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Did your baby receive PMTCT?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Did you receive PMTCT?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Did you receive PMTCT?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Did you receive PMTCT after delivery?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Accomodation(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Accomodation";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "How many rooms do you occupy?";
        var conditionTrue = selectedResponses == 'Lodger';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Are you or have you ever been a smoker?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you or have you ever been a smoker?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "How many cigarettes per day on average?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },

        "Are you suffering from headaches?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you suffering from headaches?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Headache duration";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },


        "Are you suffering from headaches?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you suffering from headaches?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Headache severity";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Do you have frequent abdominal pain?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you have frequent abdominal pain?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Addominal pain location";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },


        "Are you sexually active?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you sexually active?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Sexual partners";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Are you currently pregnant?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you currently pregnant?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Is patient on triple therapy?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },

        "Have you had sores or non healing ulcers in the mouth?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you had sores or non healing ulcers in the mouth?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "How often";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },

        "Do you have ear pain or discharge?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you have ear pain or discharge?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Ear pain or discharge duration";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },

        "Have you noticed any changes in or around the mouth and neck?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you noticed any changes in or around the mouth and neck?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Have you had blisters or swelling on/around the lips?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },

        "Have you had a skin rash recently?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you had a skin rash recently?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Duration of skin rash";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Have you had a cough?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you had a cough?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Type of cough";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Have you noticed any changes in or around the mouth and neck?(4)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you noticed any changes in or around the mouth and neck?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Have you had painful teeth?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Has your partner been tested?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Has your partner been tested?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Partners test result";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },

        "KS Lesions?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="KS Lesions?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Measure maximum lenght and width of an index legion";
        var conditionTrue = selectedResponses == 'Enter Answer';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Are you hard of hearing?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you hard of hearing?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Hearing loss duration";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Did you experience any itching?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Did you experience any itching?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Location of itching";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },

        "Are you suffering from headaches?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you suffering from headaches?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Headache course";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },




        "Have you experienced muscle ache?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you experienced muscle ache?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Location of muscle aches";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Have you had shortness of breath?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you had shortness of breath?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "When does shortness of breath occur";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Did you have a rash from taking the medications?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Did you have a rash from taking the medications?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Rash location";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Did your baby receive PMTCT?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Did your baby receive PMTCT?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Which drugs?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },


        "Do you have frequent diarrhea?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you have frequent diarrhea?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Diarrhea duration";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },




        "Did you have a fever recently?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Did you have a fever recently?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Did you have rigors (shaking chills) with the fever?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },

        "Itching rash?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Itching rash?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Eczema";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },


        "Do you have a partner?(4)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you have a partner?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Is your (sexual) partner aware of your HIV status?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Have you observed blood in your urine?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you observed blood in your urine?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Was it associated with a menstrual period?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Have you had a rash with any of those symptoms?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you had a rash with any of those symptoms?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Morphology";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },


        "Have you noticed any changes in or around the mouth and neck?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you noticed any changes in or around the mouth and neck?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Have you had non-healing cracks at the corner of your mouth?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Have you noticed any changes in or around the mouth and neck?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you noticed any changes in or around the mouth and neck?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Have you had oral thrush?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },

        "Has the child missed school?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Has the child missed school?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "School ending date";
        var conditionTrue = selectedResponses == 'Stopped going to school';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Are you in school?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you in school?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Have you ever missed school?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },


        "Have you had a positive HIV test?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you had a positive HIV test?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Why was the test done?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "PMTCT Provided to Mother(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="PMTCT Provided to Mother";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "PMTCT Date when drugs started";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Have you experienced loss of sexual interest?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you experienced loss of sexual interest?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Erectile dysfunction";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },

        "Enlarged lymph nodes?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Enlarged lymph nodes?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Location";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },

        "Loss of vision?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Loss of vision?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Assess visual acuity with handheld acuity chart or Snellen chart";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },

        "Do you have any skin problems?(4)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you have any skin problems?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Have you ever had Kaposi Sarcoma?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },

        "Do you have a child health card?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you have a child health card?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "What was the child`s APGAR score?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Were there any problems associated with the pregnancy?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Were there any problems associated with the pregnancy?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Was the mother treated for syphilis during pregnancy?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },


        "Have you ever been pregnant?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you ever been pregnant?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Do you have any living children?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Are immunizations up to date (Child Health Card)?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are immunizations up to date (Child Health Card)?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Note immunizations that have been missed according to schedule";
        var conditionTrue = selectedResponses == 'No';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Have you experienced problems with medicines?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you experienced problems with medicines?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Vomiting from taking the medications?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Do you have frequent abdominal pain?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you have frequent abdominal pain?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Does the abdominal pain occur during fasting?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Do you have ear pain or discharge?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you have ear pain or discharge?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Is discharge associated with pain?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Was the child part of a twin/ multiple birth?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Was the child part of a twin/ multiple birth?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Did the other(s) survive?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Have you experienced problems with medicines?(4)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you experienced problems with medicines?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Diarrhea from taking the medications?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Are you sexually active?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you sexually active?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Male condom use";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Did the child breast feed?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Did the child breast feed?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "For how long did the child breast feed?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Have you had any joint swelling?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you had any joint swelling?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Joint swelling location";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Where was the child delivered?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Where was the child delivered?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "What was the mode of delivery?";
        var conditionTrue = selectedResponses == 'At health care facility';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Have you noticed any changes in or around the mouth and neck?(5)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you noticed any changes in or around the mouth and neck?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Have you noticed any lumps on the neck?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Have you had TB in places other than the lungs?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you had TB in places other than the lungs?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "How was it diagnosed?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Are you currently pregnant?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you currently pregnant?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Do you know the due date?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Have you experienced chronic back pain?(3)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you experienced chronic back pain?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Does the back pain occur at night?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Have you changed your medicines?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you changed your medicines?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Have you self administrered or taken traditional medicines?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Is patient on triple therapy?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Is patient on triple therapy?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Since which date?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Have you been screened for cervical cancer?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you been screened for cervical cancer?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Date of  screening";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Did the child breast feed?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Did the child breast feed?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Did the child suckle properly?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },

        "PMTCT Provided to Infant(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="PMTCT Provided to Infant";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "PMTCT Date when drugs started";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Did your baby receive PMTCT?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Did your baby receive PMTCT?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "For how long?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Did you have a rash from taking the medications?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Did you have a rash from taking the medications?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Rash Morphology";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Have you ever been pregnant?(3)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you ever been pregnant?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Did you have any miscarriages or abortions?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Have you had a positive HIV test?(9)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you had a positive HIV test?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Do you have any children?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },

        "Do you feel a burning sensation with urination?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you feel a burning sensation with urination?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Burning urination duration";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Have you observed a swelling of your limbs(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you observed a swelling of your limbs";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Swelling duration";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },

        "Are Sclerae / Conjunctivae normal?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are Sclerae / Conjunctivae normal?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Conjunctivae";
        var conditionTrue = selectedResponses == 'No';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },

        "Have you had any joint swelling?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you had any joint swelling?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Joint swelling duration";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Have you carried any full term pregnancies?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you carried any full term pregnancies?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Did you receive PMTCT?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Have you ever been treated with ARV's?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you ever been treated with ARV's?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Have you missed a dose today?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Are you currently pregnant?(3)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you currently pregnant?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "HAS SHE BEEN SCREENED FOR TB";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Itching rash?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Itching rash?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Pruritis / Prurigo";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Have you ever had PTB?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you ever had PTB?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "How many episodes of PTB?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Have you experienced intermenstrual bleeding?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you experienced intermenstrual bleeding?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Intensity";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Have you experienced chronic back pain?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you experienced chronic back pain?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Back pain duration";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },

        "Cough?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Cough?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Percussion";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },

        "Tachypnea?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Tachypnea?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Use of auxiliary respiratory muscles?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Have you reached menopause?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you reached menopause?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Beginning date of LMP?";
        var conditionTrue = selectedResponses == 'No';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Did you interrupt treatment at times?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Did you interrupt treatment at times?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "When did you miss a dose?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Have you reached menopause?(4)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you reached menopause?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Dysmenorrhea";
        var conditionTrue = selectedResponses == 'No';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },

        "Do you have a partner?(5)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you have a partner?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Has your partner been tested?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Wheezing(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Wheezing";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Chronic wheezing";
        var conditionTrue = selectedResponses == 'Chronic';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Do you have high blood pressure?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you have high blood pressure?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Are you on BP drugs?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Did the child breast feed?(3)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Did the child breast feed?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Did the child breast feed well?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Have you noticed any lumps on the neck?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you noticed any lumps on the neck?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Duration of lumps";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },

        "Do you have any skin problems?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you have any skin problems?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Have you ever had Herpes zoster / shingles?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Loss of vision?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Loss of vision?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Are visual fields normal?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Have you experienced loss of sexual interest?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you experienced loss of sexual interest?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Other";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Tumors?(3)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Tumors?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Mobility";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },

        "Have you observed a breast lump?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you observed a breast lump?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Size of breast lump(s)";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },

        "Have you missed your period?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you missed your period?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Are you pregnant?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },

        "Lumps?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Lumps?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Size";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Tumors?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Tumors?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Locations";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Are you or have you ever been a smoker?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you or have you ever been a smoker?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "When did you start smoking?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Lumps?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Lumps?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Location";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Did you have night sweats?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Did you have night sweats?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Duration of night sweats";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Enlarged lymph nodes?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Enlarged lymph nodes?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Properties";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Did you interrupt treatment at times?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Did you interrupt treatment at times?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Why did you miss doses?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Were there any problems associated with the pregnancy?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Were there any problems associated with the pregnancy?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Was a TORCHES screen ever done on the mother?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Have you had chest pain?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you had chest pain?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "When does chest pain occur";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Addominal pain location(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Addominal pain location";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Abdominal pain location";
        var conditionTrue = selectedResponses == 'Localized';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },

        "Do you drink alcoholic beverages?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you drink alcoholic beverages?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "What type of alcohol do you drink?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Do you have any children?(7)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you have any children?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "How many children do you have?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },

        "Have you had a rash with any of those symptoms?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you had a rash with any of those symptoms?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Location of rash";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },

        "Have you experienced chronic back pain?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you experienced chronic back pain?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Location of back pain";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Do you feel generalized body pain?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you feel generalized body pain?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Duration of pain";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "DISCLOSURE DONE?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="DISCLOSURE DONE?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "DISCLOSURE DONE, TO WHOM?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Have you noticed any lumps on the neck?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you noticed any lumps on the neck?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Location of lumps";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Have you experienced muscle ache?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you experienced muscle ache?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Are you currently on NRTI's?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Did the skin rash start after taking new medication?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Did the skin rash start after taking new medication?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Which medication?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },

        "Did you receive PMTCT?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Did you receive PMTCT?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Did you receive PMTCT during delivery?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Have you had a positive HIV test?(8)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you had a positive HIV test?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Do you have a partner?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Abdominal swelling(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Abdominal swelling";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "LMP";
        var conditionTrue = selectedResponses == 'Pregnancy';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Do you feel a burning sensation with urination?(7)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you feel a burning sensation with urination?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Have you had several episodes?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Have you observed a lump growing?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you observed a lump growing?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Duration of lump";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },

        "Do you have any skin problems?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you have any skin problems?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Did you experience any itching?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Are you sexually active?(3)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you sexually active?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Female condom use";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Were there any problems associated with the pregnancy?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Were there any problems associated with the pregnancy?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Was the mother ever treated for any other sexually transmitted illnesses?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Have any of  your children been tested for HIV?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have any of  your children been tested for HIV?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Test Results";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },

        "Record Temperature(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Record Temperature";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Is temperature above 37.8°?";
        var conditionTrue = selectedResponses == 'Enter Answer';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Have you experienced abdominal swelling?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you experienced abdominal swelling?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Last Menstrual Period?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Do you feel a burning sensation with urination?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you feel a burning sensation with urination?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Burning senstation details";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Are you frequently constipated?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you frequently constipated?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Duration of constipation";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Did the child exclusively breast feed?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Did the child exclusively breast feed?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "For how long did the child exclusively breast feed?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Have you ever had PTB?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you ever had PTB?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Date(s) of previous episodes";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },

        "Are you suffering from headaches?(5)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you suffering from headaches?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Headache onset";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Do you feel a burning sensation with urination?(4)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you feel a burning sensation with urination?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Have you experienced flank pain during such epsiodes?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },

        "Have you had a positive HIV test?(3)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you had a positive HIV test?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Do you have a copy of the test result?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Do you have a partner?(6)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you have a partner?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Is your (sexual) partner aware of his/her HIV status?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },

        "Have any children died(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have any children died";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "AGE OF  CHILD(REN) AT TIME OF DEATH (MONTHS/YEARS)";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Have you reached menopause?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you reached menopause?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Are your periods irregular?";
        var conditionTrue = selectedResponses == 'No';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },
        "Itching rash?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Itching rash?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Papular pruritic eruptions";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },

        "Have you observed a swelling of your limbs(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you observed a swelling of your limbs";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Is swelling painful?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },

        "Are you currently pregnant?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you currently pregnant?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "GESTATIONAL AGE (IN WEEKS)";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule);}
        else
        {ruleActions.disable.push(question1AffectedByRule);}
        return ruleActions;
        },

       "Have you ever had a negative HIV test?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you ever had a negative HIV test?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "When was the negative test done?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },

        "Have you had a cough?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you had a cough?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Cough duration";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Do you have ear pain or discharge?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you have ear pain or discharge?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Ear pain or discharge location";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },

        "Have you reached menopause?(3)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you reached menopause?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Period intensity";
        var conditionTrue = selectedResponses == 'No';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Have you noticed any changes in or around the mouth and neck?(3)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you noticed any changes in or around the mouth and neck?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Have you had oral thrush?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Are you hard of hearing?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you hard of hearing?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Hearing loss location";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Have you ever been treated with ARV's?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you ever been treated with ARV's?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Did you interrupt treatment at times?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Did you receive PMTCT during pregnancy?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Did you receive PMTCT during pregnancy?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "When started?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Have you changed your medicines?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you changed your medicines?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Changes to other drugs";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Are you currently pregnant?(3)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you currently pregnant?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Is patient scheduled for AZT prophylaxis?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },


        "Do you want to stop the film of your life or do you have moments when you wish you were dead?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you want to stop the film of your life or do you have moments when you wish you were dead?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Have you thought about ending your life?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Have you been sexually abused?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you been sexually abused?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Did you receive counselling?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },


        "Are you currently pregnant?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you currently pregnant?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "HIV-STATUS OF PARTNER";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Are you sexually active?(4)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you sexually active?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Do you use condoms every time you have sex?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },

        "Tachypnea?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Tachypnea?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Nasal flaring?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Tumors?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Tumors?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Tumor size";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "HIV-STATUS OF MOTHER(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="HIV-STATUS OF MOTHER";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "DISCLOSURE DONE?";
        var conditionTrue = selectedResponses == 'Positive';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Have you observed a breast lump?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you observed a breast lump?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Where did the breast lump(s) occur?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },

        "Record Pulse(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Record Pulse";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Is Pulse Rate below 60 beats per minute?";
        var conditionTrue = selectedResponses == 'Enter Answer';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Do you have difficulty swallowing?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you have difficulty swallowing?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Swallowing difficulty duration";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },

        "Have you had TB in places other than the lungs?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you had TB in places other than the lungs?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Location of TB";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Did you receive PMTCT?(4)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Did you receive PMTCT?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Did you receive PMTCT for each pregnancy?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Do you have frequent abdominal pain?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you have frequent abdominal pain?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Abdominal pain duration";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Have you experienced intermenstrual bleeding?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you experienced intermenstrual bleeding?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Duration";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },
        "Do you feel a burning sensation with urination?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you feel a burning sensation with urination?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var question1AffectedByRule = "Do you need to go more frequently?";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {
            ruleActions.enable.push(question1AffectedByRule);
        }
        else
        {
            ruleActions.disable.push(question1AffectedByRule);
        }
        return ruleActions;
        },




    'Self-test outcome': function (formName, formFieldValues) {
        var conditions = {
                    enable: [],
                    disable: []
                    };
        var conditionConcept = formFieldValues['Self-test outcome'];
        if (conditionConcept == "Positive") {
            conditions.disable.push("HST, Request Services");
        } else {
            conditions.enable.push("HST, Request Services");
        }
        return conditions;
        },
     'PHTCTB, Are you currently being treated for TB?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['PHTCTB, Are you currently being treated for TB?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("PHTCTB, How was the current TB diagnosed?","PHTCTB, Location of current TB");
         var OtherMethod = formFieldValues['PHTCTB, How was the current TB diagnosed?'];
         var OtherLocation = formFieldValues['PHTCTB, Location of current TB'];
         if (OtherMethod == "Other") {
          conditions.enable.push("PHTCTB, If other for current TB diagnosed, specify");
         } else {
          conditions.disable.push("PHTCTB, If other for current TB diagnosed, specify");
         }
         if (OtherLocation == "Other") {
                conditions.enable.push("PHTCTB, If other for current TB location, specify");
            } else {
                conditions.disable.push("PHTCTB, If other for current TB location, specify");
            }
        } else {
            conditions.disable.push("PHTCTB, How was the current TB diagnosed?","PHTCTB, Location of current TB");
        }
        return conditions;
        },
     'PHTCTB, How was the current TB diagnosed?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['PHTCTB, How was the current TB diagnosed?'];
        if (conditionConcept == "Other") {
            conditions.enable.push("PHTCTB, If other for current TB diagnosed, specify");
        } else {
            conditions.disable.push("PHTCTB, If other for current TB diagnosed, specify");
        }
        return conditions;
        },
     'PHTCTB, Location of current TB': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['PHTCTB, Location of current TB'];
        if (conditionConcept == "Other") {
            conditions.enable.push("PHTCTB, If other for current TB location, specify");
        } else {
            conditions.disable.push("PHTCTB, If other for current TB location, specify");
        }
        return conditions;
        },
     'PHTCTB, Have been treated for TB before?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['PHTCTB, Have been treated for TB before?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("PHTCTB, How was the previous TB diagnosed?","PHTCTB, Location of previous TB","PHTCTB, How many episodes of TB?","PHTCTB, When were you treated for TB","PHTCTB, Where were you last treated?","PHTCTB, Was treatment interupted?");
            var OtherMethod = formFieldValues['PHTCTB, How was the previous TB diagnosed?'];
            var OtherLocation = formFieldValues['PHTCTB, Location of previous TB'];
            if (OtherMethod == "Other") {
                conditions.enable.push("PHTCTB, If other for previous TB diagnosed, specify");
            } else {
                conditions.disable.push("PHTCTB, If other for previous TB diagnosed, specify");
            }
            if (OtherLocation == "Other") {
                conditions.enable.push("PHTCTB, If other for previous TB location, specify");
            } else {
                conditions.disable.push("PHTCTB, If other for previous TB location, specify");
            }
        } else {
            conditions.disable.push("PHTCTB, How was the previous TB diagnosed?","PHTCTB, Location of previous TB","PHTCTB, How many episodes of TB?","PHTCTB, When were you treated for TB","PHTCTB, Where were you last treated?","PHTCTB, Was treatment interupted?");
        }
        return conditions;
        },
        'PHTCTB, How was the previous TB diagnosed?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['PHTCTB, How was the previous TB diagnosed?'];
        if (conditionConcept == "Other") {
            conditions.enable.push("PHTCTB, If other for previous TB diagnosed, specify");
        } else {
            conditions.disable.push("PHTCTB, If other for previous TB diagnosed, specify");
        }
        return conditions;
        },
        'PHTCTB, Location of previous TB': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['PHTCTB, Location of previous TB'];
        if (conditionConcept == "Other") {
            conditions.enable.push("PHTCTB, If other for previous TB location, specify");
        } else {
            conditions.disable.push("PHTCTB, If other for previous TB location, specify");
        }
        return conditions;
        },
     'PHTCTB, Has you mother or caregiver been treated for TB? (for children under 5)': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['PHTCTB, Has you mother or caregiver been treated for TB? (for children under 5)'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("PHTCTB, Did you received IPT?");
        } else {
            conditions.disable.push("PHTCTB, Did you received IPT?");
        }
        return conditions;
        },
    'PHT, Ever had oral sex': function (formName, formFieldValues) {
         var conditions = {
                     enable: [],
                     disable: []
                     };
                    var conditionConceptIntercourse = formFieldValues['PHT, Ever had sexual intercourse'];
                    var conditionConceptOral = formFieldValues['PHT, Ever had oral sex'];
                    var conditionConceptAnal = formFieldValues['PHT, Ever had anal sex'];

             if (conditionConceptIntercourse == "Yes" || conditionConceptOral =="Yes" || conditionConceptAnal=="Yes") {

             conditions.enable.push("PHT, Age of first penetrative sex");
             conditions.enable.push("PHT, Do you or your partner currently have an STI");
             conditions.enable.push("PHT, In the last twelve months, ever had sex while intoxicated");
             conditions.enable.push("PHT, In the last twelve month exchanged money or goods for sex");
             conditions.enable.push("PHT, Last time you had sex did you use a condom");
             conditions.enable.push("PHT, Do you currently have more than one sexual partner (including your spouse or regular partner)");
             conditions.enable.push("PHT, How many sexual partners did you have in the last twelve months (including your spouse or sexual partner)");
             conditions.enable.push("PHT, Are you or your partner circumcised (Male circumcision)");
            }
        else {
               conditions.disable.push("PHT, Age of first penetrative sex");
               conditions.disable.push("PHT, Do you or your partner currently have an STI");
               conditions.disable.push("PHT, In the last twelve months, ever had sex while intoxicated");
               conditions.disable.push("PHT, In the last twelve month exchanged money or goods for sex");
               conditions.disable.push("PHT, Last time you had sex did you use a condom");
               conditions.disable.push("PHT, Do you currently have more than one sexual partner (including your spouse or regular partner)");
               conditions.disable.push("PHT, How many sexual partners did you have in the last twelve months (including your spouse or sexual partner)");
               conditions.disable.push("PHT, Are you or your partner circumcised (Male circumcision)");
         }
         return conditions;
         },
    'PHT, Ever had sexual intercourse': function (formName, formFieldValues) {
          var conditions = {
                      enable: [],
                      disable: []
                      };
                     var conditionConceptIntercourse = formFieldValues['PHT, Ever had sexual intercourse'];
                     var conditionConceptOral = formFieldValues['PHT, Ever had oral sex'];
                     var conditionConceptAnal = formFieldValues['PHT, Ever had anal sex'];

              if (conditionConceptIntercourse == "Yes" || conditionConceptOral =="Yes" || conditionConceptAnal=="Yes") {

              conditions.enable.push("PHT, Age of first penetrative sex");
              conditions.enable.push("PHT, Do you or your partner currently have an STI");
              conditions.enable.push("PHT, In the last twelve months, ever had sex while intoxicated");
              conditions.enable.push("PHT, In the last twelve month exchanged money or goods for sex");
              conditions.enable.push("PHT, Last time you had sex did you use a condom");
              conditions.enable.push("PHT, Do you currently have more than one sexual partner (including your spouse or regular partner)");
              conditions.enable.push("PHT, How many sexual partners did you have in the last twelve months (including your spouse or sexual partner)");
              conditions.enable.push("PHT, Are you or your partner circumcised (Male circumcision)");
             }
         else {
                conditions.disable.push("PHT, Age of first penetrative sex");
                conditions.disable.push("PHT, Do you or your partner currently have an STI");
                conditions.disable.push("PHT, In the last twelve months, ever had sex while intoxicated");
                conditions.disable.push("PHT, In the last twelve month exchanged money or goods for sex");
                conditions.disable.push("PHT, Last time you had sex did you use a condom");
                conditions.disable.push("PHT, Do you currently have more than one sexual partner (including your spouse or regular partner)");
                conditions.disable.push("PHT, How many sexual partners did you have in the last twelve months (including your spouse or sexual partner)");
                conditions.disable.push("PHT, Are you or your partner circumcised (Male circumcision)");
          }
          return conditions;
          },
   'PHT, Ever had anal sex': function (formName, formFieldValues) {
            var conditions = {
                        enable: [],
                        disable: []
                        };
                       var conditionConceptIntercourse = formFieldValues['PHT, Ever had sexual intercourse'];
                       var conditionConceptOral = formFieldValues['PHT, Ever had oral sex'];
                       var conditionConceptAnal = formFieldValues['PHT, Ever had anal sex'];

                if (conditionConceptIntercourse == "Yes" || conditionConceptOral =="Yes" || conditionConceptAnal=="Yes") {

                conditions.enable.push("PHT, Age of first penetrative sex");
                conditions.enable.push("PHT, Do you or your partner currently have an STI");
                conditions.enable.push("PHT, In the last twelve months, ever had sex while intoxicated");
                conditions.enable.push("PHT, In the last twelve month exchanged money or goods for sex");
                conditions.enable.push("PHT, Last time you had sex did you use a condom");
                conditions.enable.push("PHT, Do you currently have more than one sexual partner (including your spouse or regular partner)");
                conditions.enable.push("PHT, How many sexual partners did you have in the last twelve months (including your spouse or sexual partner)");
                conditions.enable.push("PHT, Are you or your partner circumcised (Male circumcision)");
               }
           else {
                  conditions.disable.push("PHT, Age of first penetrative sex");
                  conditions.disable.push("PHT, Do you or your partner currently have an STI");
                  conditions.disable.push("PHT, In the last twelve months, ever had sex while intoxicated");
                  conditions.disable.push("PHT, In the last twelve month exchanged money or goods for sex");
                  conditions.disable.push("PHT, Last time you had sex did you use a condom");
                  conditions.disable.push("PHT, Do you currently have more than one sexual partner (including your spouse or regular partner)");
                  conditions.disable.push("PHT, How many sexual partners did you have in the last twelve months (including your spouse or sexual partner)");
                  conditions.disable.push("PHT, Are you or your partner circumcised (Male circumcision)");
            }
            return conditions;
            },
        'PHTC, Ever had oral sex': function (formName, formFieldValues) {
         var conditions = {
                     enable: [],
                     disable: []
                     };
                    var conditionConceptIntercourse = formFieldValues['PHTC, Ever had sexual intercourse'];
                    var conditionConceptOral = formFieldValues['PHTC, Ever had oral sex'];
                    var conditionConceptAnal = formFieldValues['PHTC, Ever had anal sex'];

             if (conditionConceptIntercourse == "Yes" || conditionConceptOral =="Yes" || conditionConceptAnal=="Yes") {

             conditions.enable.push("PHTC, Age of first penetrative sex");
             conditions.enable.push("PHTC, Do you or your partner currently have an STI");
             conditions.enable.push("PHTC, In the last twelve months, ever had sex while intoxicated");
             conditions.enable.push("PHTC, In the last twelve month exchanged money or goods for sex");
             conditions.enable.push("PHTC, Last time you had sex did you use a condom");
             conditions.enable.push("PHTC, Do you currently have more than one sexual partner (including your spouse or regular partner)");
             conditions.enable.push("PHTC, How many sexual partners did you have in the last twelve months (including your spouse or sexual partner)");
             conditions.enable.push("PHTC, Are you or your partner circumcised (Male circumcision)");
            }
        else {
               conditions.disable.push("PHTC, Age of first penetrative sex");
               conditions.disable.push("PHTC, Do you or your partner currently have an STI");
               conditions.disable.push("PHTC, In the last twelve months, ever had sex while intoxicated");
               conditions.disable.push("PHTC, In the last twelve month exchanged money or goods for sex");
               conditions.disable.push("PHTC, Last time you had sex did you use a condom");
               conditions.disable.push("PHTC, Do you currently have more than one sexual partner (including your spouse or regular partner)");
               conditions.disable.push("PHTC, How many sexual partners did you have in the last twelve months (including your spouse or sexual partner)");
               conditions.disable.push("PHTC, Are you or your partner circumcised (Male circumcision)");
         }
         return conditions;
         },
    'PHTC, Ever had sexual intercourse': function (formName, formFieldValues) {
          var conditions = {
                      enable: [],
                      disable: []
                      };
                     var conditionConceptIntercourse = formFieldValues['PHTC, Ever had sexual intercourse'];
                     var conditionConceptOral = formFieldValues['PHTC, Ever had oral sex'];
                     var conditionConceptAnal = formFieldValues['PHTC, Ever had anal sex'];

              if (conditionConceptIntercourse == "Yes" || conditionConceptOral =="Yes" || conditionConceptAnal=="Yes") {

              conditions.enable.push("PHTC, Age of first penetrative sex");
              conditions.enable.push("PHTC, Do you or your partner currently have an STI");
              conditions.enable.push("PHTC, In the last twelve months, ever had sex while intoxicated");
              conditions.enable.push("PHTC, In the last twelve month exchanged money or goods for sex");
              conditions.enable.push("PHTC, Last time you had sex did you use a condom");
              conditions.enable.push("PHTC, Do you currently have more than one sexual partner (including your spouse or regular partner)");
              conditions.enable.push("PHTC, How many sexual partners did you have in the last twelve months (including your spouse or sexual partner)");
              conditions.enable.push("PHTC, Are you or your partner circumcised (Male circumcision)");
             }
         else {
                conditions.disable.push("PHTC, Age of first penetrative sex");
                conditions.disable.push("PHTC, Do you or your partner currently have an STI");
                conditions.disable.push("PHTC, In the last twelve months, ever had sex while intoxicated");
                conditions.disable.push("PHTC, In the last twelve month exchanged money or goods for sex");
                conditions.disable.push("PHTC, Last time you had sex did you use a condom");
                conditions.disable.push("PHTC, Do you currently have more than one sexual partner (including your spouse or regular partner)");
                conditions.disable.push("PHTC, How many sexual partners did you have in the last twelve months (including your spouse or sexual partner)");
                conditions.disable.push("PHTC, Are you or your partner circumcised (Male circumcision)");
          }
          return conditions;
          },
   'PHTC, Ever had anal sex': function (formName, formFieldValues) {
            var conditions = {
                        enable: [],
                        disable: []
                        };
                       var conditionConceptIntercourse = formFieldValues['PHTC, Ever had sexual intercourse'];
                       var conditionConceptOral = formFieldValues['PHTC, Ever had oral sex'];
                       var conditionConceptAnal = formFieldValues['PHTC, Ever had anal sex'];

                if (conditionConceptIntercourse == "Yes" || conditionConceptOral =="Yes" || conditionConceptAnal=="Yes") {

                conditions.enable.push("PHTC, Age of first penetrative sex");
                conditions.enable.push("PHTC, Do you or your partner currently have an STI");
                conditions.enable.push("PHTC, In the last twelve months, ever had sex while intoxicated");
                conditions.enable.push("PHTC, In the last twelve month exchanged money or goods for sex");
                conditions.enable.push("PHTC, Last time you had sex did you use a condom");
                conditions.enable.push("PHTC, Do you currently have more than one sexual partner (including your spouse or regular partner)");
                conditions.enable.push("PHTC, How many sexual partners did you have in the last twelve months (including your spouse or sexual partner)");
                conditions.enable.push("PHTC, Are you or your partner circumcised (Male circumcision)");
               }
           else {
                  conditions.disable.push("PHTC, Age of first penetrative sex");
                  conditions.disable.push("PHTC, Do you or your partner currently have an STI");
                  conditions.disable.push("PHTC, In the last twelve months, ever had sex while intoxicated");
                  conditions.disable.push("PHTC, In the last twelve month exchanged money or goods for sex");
                  conditions.disable.push("PHTC, Last time you had sex did you use a condom");
                  conditions.disable.push("PHTC, Do you currently have more than one sexual partner (including your spouse or regular partner)");
                  conditions.disable.push("PHTC, How many sexual partners did you have in the last twelve months (including your spouse or sexual partner)");
                  conditions.disable.push("PHTC, Are you or your partner circumcised (Male circumcision)");
            }
            return conditions;
            },
        "Pregnancy Form Template, Are you currently pregnant?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Pregnancy Form Template, Are you currently pregnant?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Pregnancy Form Template, Are you booked for antenatal care?","Pregnancy Form Template, Due Date","Pregnancy Form Template, Are you on ARVs?","Pregnancy Form Template, Are you on any other drugs?","Pregnancy Form Template, Have you ever been pregnant before?","Pregnancy Form Template, Type of pregnancy","Pregnancy Form Template, If Yes ARVS for PMTCT then specify","Pregnancy Form Template, If Yes Specify other drug details");
        }
        else {
            conditions.disable.push("Pregnancy Form Template, Are you booked for antenatal care?","Pregnancy Form Template, Due Date","Pregnancy Form Template, Are you on ARVs?","Pregnancy Form Template, Are you on any other drugs?","Pregnancy Form Template, Have you ever been pregnant before?","Pregnancy Form Template, Type of pregnancy","Pregnancy Form Template, If Yes ARVS for PMTCT then specify","Pregnancy Form Template, If Yes Specify other drug details");
        }
            return conditions;
        },
        "Pregnancy Form Template, Are you booked for antenatal care?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Pregnancy Form Template, Are you booked for antenatal care?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Pregnancy Form Template, Due Date","Pregnancy Form Template, Where was the pregnancy booked?","Pregnancy Form Template, At what month was the pregnancy booked?","Pregnancy Form Template, How many antenatal visits did the mother attend?");
        }
        else {
            conditions.disable.push("Pregnancy Form Template, Due Date","Pregnancy Form Template, Where was the pregnancy booked?","Pregnancy Form Template, At what month was the pregnancy booked?","Pregnancy Form Template, How many antenatal visits did the mother attend?");
        }
            return conditions;
        },
        "Pregnancy Form Template, Have you ever been pregnant before?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Pregnancy Form Template, Have you ever been pregnant before?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Pregnancy Form Template, How many full pregnancies have you carries?","Pregnancy Form Template, Type of pregnancy","Pregnancy Form Template, Did you receive ARVs for PMTCT during pregnancy?","Pregnancy Form Template, Did you have any premature births?");
        }
        else {
            conditions.disable.push("Pregnancy Form Template, How many full pregnancies have you carries?","Pregnancy Form Template, Type of pregnancy","Pregnancy Form Template, Did you receive ARVs for PMTCT during pregnancy?","Pregnancy Form Template, Did you have any premature births?");
        }
            return conditions;
        },
        "Pregnancy Form Template, Are you on any other drugs?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Pregnancy Form Template, Are you on any other drugs?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Pregnancy Form Template, If Yes Specify other drug details");
        }
        else {
            conditions.disable.push("Pregnancy Form Template, If Yes Specify other drug details");
        }
            return conditions;
        },
        "Pregnancy Form Template, Did you receive ARVs for PMTCT during pregnancy?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Pregnancy Form Template, Did you receive ARVs for PMTCT during pregnancy?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Pregnancy Form Template, If Yes ARVS for PMTCT then specify");
        }
        else {
            conditions.disable.push("Pregnancy Form Template, If Yes ARVS for PMTCT then specify");
        }
            return conditions;
        },
        "Pregnancy Form Template, Did you have any premature births?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Pregnancy Form Template, Did you have any premature births?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Pregnancy Form Template, If Yes any premature births");
        }
        else {
            conditions.disable.push("Pregnancy Form Template, If Yes any premature births");
        }
            return conditions;
        },
          'N, Is the age equal or less than 18?': function (formName, formFieldValues) {
              var conditions = {
                      hide: [],
                      show: [],
                      enable: [],
                      disable: []
                      };
              var conditionConcept = formFieldValues['N, Is the age equal or less than 18?'];
                if (conditionConcept == "Yes") {
                      conditions.enable.push("N, Have you noticed a deterioration in school performance?");
                      conditions.show.push("N, Is child muscle strength normal?");
                      conditions.hide.push("N, Is adult muscle strength normal?");

                    }
             else if (conditionConcept == "No") {
                  conditions.show.push("N, Is adult muscle strength normal?");
                  conditions.hide.push("N, Is child muscle strength normal?");
            conditions.disable.push("N, Have you noticed a deterioration in school performance?");

                    }
             else {
                  conditions.show.push("N, Is child muscle strength normal?");
                  conditions.hide.push("N, Is adult muscle strength normal?");
                  conditions.disable.push("N, Have you noticed a deterioration in school performance?");
              }
              return conditions;
              },
        "BCH, Did the mother receive ARVs during pregnancy or delivery?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['BCH, Did the mother receive ARVs during pregnancy or delivery?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("BCH, If yes for mother receive ARVs during pregnancy or delivery");
        }
        else {
            conditions.disable.push("BCH, If yes for mother receive ARVs during pregnancy or delivery");
            }
            return conditions;
        },
        "BCH, If yes for mother receive ARVs during pregnancy or delivery": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['BCH, If yes for mother receive ARVs during pregnancy or delivery'];
        if (conditionConcept == "BCH, Other ARVs recevied by mother during pregnancy or delivery") {
            conditions.enable.push("BCH, Specify Other ARVs recevied by mother during pregnancy or delivery");
        }
        else {
            conditions.disable.push("BCH, Specify Other ARVs recevied by mother during pregnancy or delivery");
            }
            return conditions;
        },
        "BCH, Did the child had any birth defects?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['BCH, Did the child had any birth defects?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("BCH, If yes for child had any birth defects");
        }
        else {
            conditions.disable.push("BCH, If yes for child had any birth defects");
            }
            return conditions;
        },
        "BCH, Is child's birth weight known?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues["BCH, Is child's birth weight known?"];
        if (conditionConcept == "Yes") {
            conditions.enable.push("BCH, If yes for childs birth weight known");
        }
        else {
            conditions.disable.push("BCH, If yes for childs birth weight known");
            }
            return conditions;
        },
        "BCH, Do you know the child's APGAR score?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues["BCH, Do you know the child's APGAR score?"];
        if (conditionConcept == "Yes") {
            conditions.enable.push("BCH, If yes for child's APGAR score known");
        }
        else {
            conditions.disable.push("BCH, If yes for child's APGAR score known");
            }
            return conditions;
        },
        "BCH, Is the fontanelle Normal": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['BCH, Is the fontanelle Normal'];
        if (conditionConcept == "No") {
            conditions.enable.push("BCH, If no for fontanelle normal");
        }
        else {
            conditions.disable.push("BCH, If no for fontanelle normal");
            }
            return conditions;
        },
        "BCH, Was the child part of a twin / multiple birth?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['BCH, Was the child part of a twin / multiple birth?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("BCH, If yes for child part of a twin / multiple birth");
        }
        else {
            conditions.disable.push("BCH, If yes for child part of a twin / multiple birth");
            }
            return conditions;
        },
        "BCH, Did the child receive ARVs at birth?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['BCH, Did the child receive ARVs at birth?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("BCH, If Yes for child received ARVs at birth");
        }
        else {
            conditions.disable.push("BCH, If Yes for child received ARVs at birth");
            }
            return conditions;
        },
        "BCH, If Yes for child received ARVs at birth": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['BCH, If Yes for child received ARVs at birth'];
        if (conditionConcept == "BCH, Other ARVs received by child at birth") {
            conditions.enable.push("BCH, Specify Other ARVs received by child at birth");
        }
        else {
            conditions.disable.push("BCH, Specify Other ARVs received by child at birth");
            }
            return conditions;
        },
        "BCH, Are the child's milestones normal?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues["BCH, Are the child's milestones normal?"];
        if (conditionConcept == "No") {
            conditions.enable.push("BCH, If No for child's milestones normal then");
        }
        else {
            conditions.disable.push("BCH, If No for child's milestones normal then");
            }
            return conditions;
        },
        "BCH, Do you have a child health card?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['BCH, Do you have a child health card?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("BCH, If Yes for child health card");
        }
        else {
            conditions.disable.push("BCH, If Yes for child health card");
            }
            return conditions;
        },
        "BCH, Do you have a child health card?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['BCH, Do you have a child health card?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("BCH, If Yes for child health card");
        }
        else {
            conditions.disable.push("BCH, If Yes for child health card");
            }
            return conditions;
        },
        "BCH, If Yes for child health card": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['BCH, If Yes for child health card'];
        if (conditionConcept == "No") {
            conditions.enable.push("BCH, If No for Is the child growing as per the child health card curve");
        }
        else {
            conditions.disable.push("BCH, If No for Is the child growing as per the child health card curve");
            }
            return conditions;
        },
        "BCH, Is the child behaving like other children of the same age?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['BCH, Is the child behaving like other children of the same age?'];
        if (conditionConcept == "No") {
            conditions.enable.push("BCH, If No for the child behaving like other children of the same age?");
        }
        else {
            conditions.disable.push("BCH, If No for the child behaving like other children of the same age?");
            }
            return conditions;
        },
        "BCH, If No for the child behaving like other children of the same age?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['BCH, If No for the child behaving like other children of the same age?'];
        if (conditionConcept == "BCH, Other for Child behaving like other children of the same age") {
            conditions.enable.push("BCH, If Other for No for Child behaving like other children of the same age");
        }
        else {
            conditions.disable.push("BCH, If Other for No for Child behaving like other children of the same age");
            }
            return conditions;
        },
        "BCH, Is the physical activity of the child normal?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['BCH, Is the physical activity of the child normal?'];
        if (conditionConcept == "No") {
            conditions.enable.push("BCH, If No for the physical activity of the child normal?");
        }
        else {
            conditions.disable.push("BCH, If No for the physical activity of the child normal?");
            }
            return conditions;
        },
        "BCH, Did the child breast feed?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['BCH, Did the child breast feed?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("BCH, Did the child exclusively breast feed?","BCH, If yes for the child exclusively breast feed?","BCH, Did the child suckle properly?","BCH, Did the child breast feed well?","BCH, For how long did the child breast feed? (in months)");
        }
        else{
            conditions.disable.push("BCH, Did the child exclusively breast feed?","BCH, If yes for the child exclusively breast feed?","BCH, Did the child suckle properly?","BCH, Did the child breast feed well?","BCH, For how long did the child breast feed? (in months)");
            }
            return conditions;
        },
        "BCH, Did the child exclusively breast feed?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['BCH, Did the child exclusively breast feed?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("BCH, If yes for the child exclusively breast feed?");
        }
        else {
            conditions.disable.push("BCH, If yes for the child exclusively breast feed?");
            }
            return conditions;
        },
        "BCH, Did the child exclusively breast feed?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['BCH, Did the child exclusively breast feed?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("BCH, If yes for the child exclusively breast feed?");
        }
        else {
            conditions.disable.push("BCH, If yes for the child exclusively breast feed?");
            }
            return conditions;
        },
        "BCH, Was the child ever treated for malnutrition?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['BCH, Was the child ever treated for malnutrition?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("BCH, Was the child admitted in hospital for malnutrition?","BCH, If Yes for the child admitted in hospital for malnutrition","BCH, What does the child's diet consist of? (free text)","BCH, Does the child eat well?","BCH, Does the child swallow well?");
        }
        else {
            conditions.disable.push("BCH, Was the child admitted in hospital for malnutrition?","BCH, If Yes for the child admitted in hospital for malnutrition","BCH, What does the child's diet consist of? (free text)","BCH, Does the child eat well?","BCH, Does the child swallow well?");
            }
            return conditions;
        },
        "BCH, Was the child admitted in hospital for malnutrition?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['BCH, Was the child admitted in hospital for malnutrition?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("BCH, If Yes for the child admitted in hospital for malnutrition");
        }
        else {
            conditions.disable.push("BCH, If Yes for the child admitted in hospital for malnutrition");
            }
            return conditions;
        },
        "BCH, Has the child been treated for worms?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['BCH, Has the child been treated for worms?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("BCH, If yes for Has the child been treated for worms?");
        }
        else {
            conditions.disable.push("BCH, If yes for Has the child been treated for worms?");
            }
            return conditions;
        },
        "BCH, Has the child ever attended school?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['BCH, Has the child ever attended school?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("BCH, How is the child's performance at school?","BCH, What is the child's latest school Grade?","BCH, Has the child missed school?");
        }
        else {
            conditions.disable.push("BCH, How is the child's performance at school?","BCH, What is the child's latest school Grade?","BCH, Has the child missed school?");
            }
            return conditions;
        },

        "GY, Have you experienced abnormal bleeding?": function (formName, formFieldValues) {
          var conditions = {enable: [], disable: []};
          var conditionConcept = formFieldValues['GY, Have you experienced abnormal bleeding?'];
          if (conditionConcept == "Yes") {
              conditions.enable.push("GY, Have you experienced intermenstrual bleeding?",
              "GY, Have you experienced post menopausal bleeding?",
              "GY, Have you experienced Post-coital bleeding?");
          }
          else {
          conditions.disable.push("GY, Have you experienced intermenstrual bleeding?",
                        "GY, Have you experienced post menopausal bleeding?",
                        "GY, Have you experienced Post-coital bleeding?");
          }
           return conditions;
          },
           "GY, Have you experienced intermenstrual bleeding?": function (formName, formFieldValues) {
           var conditions = {enable: [], disable: []};
           var conditionConcept = formFieldValues['GY, Have you experienced intermenstrual bleeding?'];
           if (conditionConcept == "Yes") {
               conditions.enable.push("GY, Intensity of intermenstrual bleeding","GY, Duration of intermenstrual bleeding");
           }
           else {
             conditions.disable.push("GY, Intensity of intermenstrual bleeding","GY, Duration of intermenstrual bleeding");
           }
            return conditions;
           },
            "GY, Duration of intermenstrual bleeding": function (formName, formFieldValues) {
             var conditions = {enable: [], disable: []};
             var conditionConcept = formFieldValues['GY, Duration of intermenstrual bleeding'];
             if (conditionConcept == "Several months") {
                 conditions.enable.push("GY, Number of intermenstrual bleeding months");
             }
             else {
               conditions.disable.push("GY, Number of intermenstrual bleeding months");
             }
              return conditions;
             },
            "GY, Have you experienced post menopausal bleeding?": function (formName, formFieldValues) {
            var conditions = {enable: [], disable: []};
            var conditionConcept = formFieldValues['GY, Have you experienced post menopausal bleeding?'];
            if (conditionConcept == "Yes") {
                conditions.enable.push("GY, Intensity of post menopausal bleeding?","GY, Duration of post menopausal bleeding?");
            }
            else {
              conditions.disable.push("GY, Intensity of post menopausal bleeding?","GY, Duration of post menopausal bleeding?");
            }
             return conditions;
            },
             "GY, Duration of post menopausal bleeding?": function (formName, formFieldValues) {
              var conditions = {enable: [], disable: []};
              var conditionConcept = formFieldValues['GY, Duration of post menopausal bleeding?'];
              if (conditionConcept == "Several months") {
                  conditions.enable.push("GY, Number of post menopausal bleeding months");
              }
              else {
                conditions.disable.push("GY, Number of post menopausal bleeding months");
              }
               return conditions;
              },
              "GY, Have you experienced Post-coital bleeding?": function (formName, formFieldValues) {
              var conditions = {enable: [], disable: []};
              var conditionConcept = formFieldValues['GY, Have you experienced Post-coital bleeding?'];
              if (conditionConcept == "Yes") {
                  conditions.enable.push("GY, Intensity of Post-coital bleeding?","GY, Duration of Post-coital bleeding?");
              }
              else {
                conditions.disable.push("GY, Intensity of Post-coital bleeding?","GY, Duration of Post-coital bleeding?");
              }
               return conditions;
              },
               "GY, Duration of Post-coital bleeding?": function (formName, formFieldValues) {
                var conditions = {enable: [], disable: []};
                var conditionConcept = formFieldValues['GY, Duration of Post-coital bleeding?'];
                if (conditionConcept == "Several months") {
                    conditions.enable.push("GY, Number of Post-coital bleeding months");
                }
                else {
                  conditions.disable.push("GY, Number of Post-coital bleeding months");
                }
                 return conditions;
                },
            "GY, Beginning of your last normal menstrual period": function (formName, formFieldValues) {
            var conditions = {enable: [], disable: []};
            var conditionConcept = formFieldValues['GY, Beginning of your last normal menstrual period'];
            if (conditionConcept) {
                conditions.enable.push("GY, Period intensity","GY, Dymenorrhea intensity","GY, Are your periods irregular?");
                conditions.disable.push("GY, If not applicable, why?");
            }
            else {
            conditions.disable.push("GY, Period intensity","GY, Dymenorrhea intensity","GY, Are your periods irregular?");
            conditions.enable.push("GY, If not applicable, why?");

            }
             return conditions;
            },
             "GY, Have you been screened for cervical cancer?": function (formName, formFieldValues) {
             var conditions = {enable: [], disable: []};
             var conditionConcept = formFieldValues['GY, Have you been screened for cervical cancer?'];
             if (conditionConcept == "Yes") {
                 conditions.enable.push("GY, Date of screening","GY, What was the result?");
             }
             else {
                conditions.disable.push("GY, Date of screening","GY, What was the result?");
             }
              return conditions;
             },
              "GY, What was the result?": function (formName, formFieldValues) {
              var conditions = {enable: [], disable: []};
              var conditionConcept = formFieldValues['GY, What was the result?'];
              if (conditionConcept =="Other") {
                  conditions.enable.push("GY, If Others, Specify");
              }
              else {
                 conditions.disable.push("GY, If Others, Specify");
              }
               return conditions;
              },
               "GY, Have you observed a breast lump(s)?": function (formName, formFieldValues) {
               var conditions = {enable: [], disable: []};
               var conditionConcept = formFieldValues['GY, Have you observed a breast lump(s)?'];
               if (conditionConcept =="Yes") {
                   conditions.enable.push("GY, Duration of the lump","GY, Size of the breast lump (s)");
               }
               else {
                  conditions.disable.push("GY, Duration of the lump","GY, Size of the breast lump (s)");
               }
                return conditions;
               },
                "GY, Do you have a discharge from the nipple(s)?": function (formName, formFieldValues) {
                var conditions = {enable: [], disable: []};
                var conditionConcept = formFieldValues['GY, Do you have a discharge from the nipple(s)?'];
                if (conditionConcept =="Yes") {
                    conditions.enable.push("GY, Side of the nipple(s)");
                }
                else {
                   conditions.disable.push("GY, Side of the nipple(s)");
                }
                 return conditions;
                },
                  "GY, Do you use contraceptives?": function (formName, formFieldValues) {
                  var conditions = {enable: [], disable: []};
                  var conditionConcept = formFieldValues['GY, Do you use contraceptives?'];
                  if (conditionConcept =="Yes") {
                      conditions.enable.push("GY, Type of contraceptives");
                  }
                  else {
                     conditions.disable.push("GY, Type of contraceptives");
                  }
                   return conditions;
                  },
                    "GY, Type of contraceptives": function (formName, formFieldValues) {
                    var conditions = {enable: [], disable: []};
                    var conditionConcept = formFieldValues['GY, Type of contraceptives'];
                    if (conditionConcept =="Other") {
                        conditions.enable.push("GY, Other contraceptives");
                    }
                    else {
                       conditions.disable.push("GY, Other contraceptives");
                    }
                     return conditions;
                    },

        "Skin diseases": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var SkinYes = formFieldValues['Skin diseases'];
        if (SkinYes == "Yes") {
            conditions.enable.push("If Skin diseases yes then specify");
        }
            else {
            conditions.disable.push("If Skin diseases yes then specify");
            }
        return conditions;
                    },
        "Neurological or Psychiatric diseases": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var NeurologicalPsychiatricYes = formFieldValues['Neurological or Psychiatric diseases'];
        if (NeurologicalPsychiatricYes == "Yes") {
            conditions.enable.push("If Neurological or Psychiatric diseases yes then specify");
        }
            else {
            conditions.disable.push("If Neurological or Psychiatric diseases yes then specify");
            }
        return conditions;
                    },
        "Accidents": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var AccidentsYes = formFieldValues['Accidents'];
        if (AccidentsYes == "Yes") {
            conditions.enable.push("If Accidents yes then specify");
        }
            else {
            conditions.disable.push("If Accidents yes then specify");
            }
        return conditions;
                    },
        "Respiratory or cardiac diseases": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var RespiratoryCardiacYes = formFieldValues['Respiratory or cardiac diseases'];
        if (RespiratoryCardiacYes == "Yes") {
            conditions.enable.push("If Respiratory or cardiac diseases yes then specify");
        }
            else {
            conditions.disable.push("If Respiratory or cardiac diseases yes then specify");
            }
        return conditions;
                    },
        "GI and liver diseases": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var GILiverYes = formFieldValues['GI and liver diseases'];
        if (GILiverYes == "Yes") {
            conditions.enable.push("If GI and liver diseases yes then specify");
        }
            else {
            conditions.disable.push("If GI and liver diseases yes then specify");
            }
        return conditions;
                    },
        "Operations": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var OperationsYes = formFieldValues['Operations'];
        if (OperationsYes == "Yes") {
            conditions.enable.push("If Operations yes then specify");
        }
            else {
            conditions.disable.push("If Operations yes then specify");
            }
        return conditions;
                    },
        "EENT diseases": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var EENTYes = formFieldValues['EENT diseases'];
        if (EENTYes == "Yes") {
            conditions.enable.push("If EENT diseases yes then specify");
        }
            else {
            conditions.disable.push("If EENT diseases yes then specify");
            }
        return conditions;
                    },
        "Cancers": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var CancersYes = formFieldValues['Cancers'];
        if (CancersYes == "Yes") {
            conditions.enable.push("If Cancers yes then specify");
        }
            else {
            conditions.disable.push("If Cancers yes then specify");
            }
        return conditions;
                    },
        "Obstetric or gynecological illness": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var ObstetricGynecologicalillness = formFieldValues['Obstetric or gynecological illness'];
        if (ObstetricGynecologicalillness == "Yes") {
            conditions.enable.push("If Obstetric or gynecological illness yes then specify");
        }
            else {
            conditions.disable.push("If Obstetric or gynecological illness yes then specify");
            }
        return conditions;
                    },
        "GU Tract": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var GUTractYes = formFieldValues['GU Tract'];
        if (GUTractYes == "Yes") {
            conditions.enable.push("If GU Tract yes then specify");
        }
            else {
            conditions.disable.push("If GU Tract yes then specify");
            }
        return conditions;
                    },

        "Are you in school?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Are you in school?'];
        if (conditionConcept == "Yes") {
            conditions.disable.push("Did you drop out of school?");
            conditions.enable.push("Have you ever missed school?");
        }
        else if (conditionConcept == "No")
        {
            conditions.enable.push("Did you drop out of school?");
            conditions.disable.push("Have you ever missed school?");
        }
        else
        {
            conditions.disable.push("Have you ever missed school?","Did you drop out of school?");
        }
        return conditions;
        },

        "RUUV, Do you have any health related problems since your last visit?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['RUUV, Do you have any health related problems since your last visit?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("RUUV, If yes for Do you have any health related problems since your last visit?");
        }
            else {
            conditions.disable.push("RUUV, If yes for Do you have any health related problems since your last visit?");
            }
        return conditions;
        },
        "RUUV, Did you have fever recently?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['RUUV, Did you have fever recently?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("RUUV, Duration of fever");
        }
            else {
            conditions.disable.push("RUUV, Duration of fever");
            }
        return conditions;
        },
        "RUUV, Did you have night sweats?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['RUUV, Did you have night sweats?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("RUUV, Duration of night sweats");
        }
            else {
            conditions.disable.push("RUUV, Duration of night sweats");
            }
        return conditions;
        },
        "RUUV, Do you have weight loss?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['RUUV, Do you have weight loss?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("RUUV, Duration of weight loss");
        }
            else {
            conditions.disable.push("RUUV, Duration of weight loss");
            }
        return conditions;
        },
        "RUUV, Do you have shortness of breath?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['RUUV, Do you have shortness of breath?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("RUUV, Duration of shortness of breath");
        }
            else {
            conditions.disable.push("RUUV, Duration of shortness of breath");
            }
        return conditions;
        },
        "RUUV, Have you had a cough?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['RUUV, Have you had a cough?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("RUUV, Type of cough","RUUV, Duration of cough");
        }
            else {
            conditions.disable.push("RUUV, Type of cough","RUUV, Duration of cough");
            }
        return conditions;
        },
        "RUUV, Are you suffering from headaches": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['RUUV, Are you suffering from headaches'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("RUUV, Duration of headache","RUUV, Severity of Headache","RUUV, Course of Headache","RUUV, Headache Association");
        }
            else {
            conditions.disable.push("RUUV, Duration of headache","RUUV, Severity of Headache","RUUV, Course of Headache","RUUV, Headache Association");
            }
        return conditions;
        },
        "RUUV, Female Have you observed a vaginal Discharge?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['RUUV, Female Have you observed a vaginal Discharge?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("RUUV, If Yes for Female Have you observed a vaginal Discharge?");
        }
            else {
            conditions.disable.push("RUUV, If Yes for Female Have you observed a vaginal Discharge?");
            }
        return conditions;
        },
        "RUUV, Have you observed a discharge from the penis?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['RUUV, Have you observed a discharge from the penis?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("RUUV, If Yes for Male Have you observed a discharge from the penis?");
        }
            else {
            conditions.disable.push("RUUV, If Yes for Male Have you observed a discharge from the penis?");
            }
        return conditions;
        },
        "RUUV, Have u ever been treated for a sexually transmitted infection?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['RUUV, Have u ever been treated for a sexually transmitted infection?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("RUUV, If yes for RUUV, Have u ever been treated for a sexually transmitted infection?");
        }
            else {
            conditions.disable.push("RUUV, If yes for RUUV, Have u ever been treated for a sexually transmitted infection?");
            }
        return conditions;
        },
        "RUUV, Have you changed your medicines": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['RUUV, Have you changed your medicines'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("RUUV, Details of Medication changes");
        }
            else {
            conditions.disable.push("RUUV, Details of Medication changes");
            }
        return conditions;
        },
        "RUUV, Do you use illicit drugs?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['RUUV, Do you use illicit drugs?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("RUUV, What type do you use and how often?");
        }
            else {
            conditions.disable.push("RUUV, What type do you use and how often?");
            }
        return conditions;
        },
        "RUUV, Has the client defaulted treatment for more than 28 days?": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['RUUV, Has the client defaulted treatment for more than 28 days?'];
        if (conditionConcept =="Yes") {
            conditions.enable.push("RUUV, Date of Reinitiation");

        }
            else {
            conditions.disable.push("RUUV, Date of Reinitiation");
            }
        return conditions;
        },
        "AP, Type of Visit": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['AP, Type of Visit'];
        if (conditionConcept =="Pickup drugs") {
              conditions.enable.push("AP, Has the client defaulted treatment for more than 28 days?");
              conditions.enable.push("AP, Have you ever been screened for cervical cancer?");
              conditions.enable.push("AP, Is the client eligible for cervical cancer screening today?");

        }
        else if (conditionConcept =="Review by MD or Doctor") {
              conditions.enable.push("AP, Has the client defaulted treatment for more than 28 days?");
              conditions.disable.push("AP, Have you ever been screened for cervical cancer?");
              conditions.disable.push("AP, Is the client eligible for cervical cancer screening today?");

        }
        else if (conditionConcept =="AP, Review By nurse") {
              conditions.enable.push("AP, Has the client defaulted treatment for more than 28 days?");
              conditions.enable.push("AP, Have you ever been screened for cervical cancer?");
              conditions.enable.push("AP, Is the client eligible for cervical cancer screening today?");

        }
            else {
            conditions.disable.push("AP, Has the client defaulted treatment for more than 28 days?");
            conditions.disable.push("AP, Have you ever been screened for cervical cancer?");
            conditions.disable.push("AP, Is the client eligible for cervical cancer screening today?");
        }
        return conditions;
        },
        "AP, Has the client defaulted treatment for more than 28 days?": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['AP, Has the client defaulted treatment for more than 28 days?'];
        if (conditionConcept =="Yes") {
              conditions.enable.push("AP, Date of Reinitiation");

        }
            else {
            conditions.disable.push("AP, Date of Reinitiation");
            }
        return conditions;
        },

        "AS, Activity status": function (formName, formFieldValues) {
        var conditions = {show: [], hide: []};
        var conditionConceptTransferIn = formFieldValues['AS, Activity status'];
        var conditionConceptTransferOut = formFieldValues['AS, Activity status'];
        if (conditionConceptTransferIn.indexOf("Transfer in") >=0) {
            conditions.show.push("AS, Details of facility from where patient is transferred");
        }

            else {
            conditions.hide.push("AS, Details of facility from where patient is transferred");
            }
        if (conditionConceptTransferOut.indexOf("Transfer Out") >=0) {
            conditions.show.push("AS, Details of facility to where patient is transferred");
        }

            else {
            conditions.hide.push("AS, Details of facility to where patient is transferred");
            }
        return conditions;
        }
      ,
     "AIVC, Sourse giving history": function(formName, formFieldValues) {
          var conditions = {
              enable: [],
              disable: []
          };
          var conditionConcept = formFieldValues['AIVC, Sourse giving history'];
          if (conditionConcept == "Other (specify)") {
              conditions.enable.push("AIVC, Sourse giving history, Other");
          } else {
              conditions.disable.push("AIVC, Sourse giving history, Other");
          }
          return conditions;
      },
      "AIVC, Have you had a positive HIV test?": function(formName, formFieldValues) {
          var conditions = {
              enable: [],
              disable: []
          };
          var conditionConcept = formFieldValues['AIVC, Have you had a positive HIV test?'];
          if (conditionConcept == "Yes") {
              conditions.enable.push("AIVC, Why were u tested?", "AIVC, When was the test done?", "AIVC, Do you have a partner?", "AIVC, Do you have any children?");
          } else {
              conditions.disable.push("AIVC, Why were u tested?", "AIVC, When was the test done?", "AIVC, Do you have a partner?", "AIVC, Do you have any children?");
          }
          return conditions;
      },
      "AIVC, Why were u tested?": function(formName, formFieldValues) {
          var conditions = {
              enable: [],
              disable: []
          };
          var conditionConcept = formFieldValues['AIVC, Why were u tested?'];
          if (conditionConcept == "Others") {
              conditions.enable.push("AIVC, Why were u tested, Other");
          } else {
              conditions.disable.push("AIVC, Why were u tested, Other");
          }
          return conditions;
      },
      "AIVC, Do you have a partner?": function(formName, formFieldValues) {
          var conditions = {
              enable: [],
              disable: []
          };
          var conditionConcept = formFieldValues['AIVC, Do you have a partner?'];
          if (conditionConcept == "Yes") {
              conditions.enable.push("AIVC, Is your (sexual) partner aware of your HIV status?", "AIVC, Has you partner been tested?");
          } else {
              conditions.disable.push("AIVC, Is your (sexual) partner aware of your HIV status?", "AIVC, Has you partner been tested?");
          }
          return conditions;
      },
      "AIVC, Has you partner been tested?": function(formName, formFieldValues) {
          var conditions = {
              enable: [],
              disable: []
          };
          var conditionConcept = formFieldValues['AIVC, Has you partner been tested?'];
          if (conditionConcept == "Yes") {
              conditions.enable.push("AIVC, Partners test result");
          } else {
              conditions.disable.push("AIVC, Partners test result");
          }
          return conditions;
      },
      "AIVC, Do you have any children?": function(formName, formFieldValues) {
          var conditions = {
              enable: [],
              disable: []
          };
          var conditionConcept = formFieldValues['AIVC, Do you have any children?'];
          if (conditionConcept == "Yes") {
              conditions.enable.push("AIVC, How many children do you have?", "AIVC, Have any of your children been tested for HIV?");
          } else {
              conditions.disable.push("AIVC, How many children do you have?", "AIVC, Have any of your children been tested for HIV?");
          }
          return conditions;
      },
      "AIVC, Have any of your children been tested for HIV?": function(formName, formFieldValues) {
          var conditions = {
              enable: [],
              disable: []
          };
          var conditionConcept = formFieldValues['AIVC, Have any of your children been tested for HIV?'];
          if (conditionConcept == "Yes") {
              conditions.enable.push("AIVC, Test Results");
          } else {
              conditions.disable.push("AIVC, Test Results");
          }
          return conditions;
      },
      "AIVC, Have you had CD4 count lab test ?": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['AIVC, Have you had CD4 count lab test ?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("AIVC, CD4 count results");

        }
        else
        {
            conditions.disable.push("AIVC, CD4 count results");
        }
        return conditions;

    },
      "AIVC, Did you have fever recently?": function(formName, formFieldValues) {
          var conditions = {
              enable: [],
              disable: []
          };
          var conditionConcept = formFieldValues['AIVC, Did you have fever recently?'];
          if (conditionConcept == "Yes") {
              conditions.enable.push("AIVC, Duration of fever");
          } else {
              conditions.disable.push("AIVC, Duration of fever");
          }
          return conditions;
      },
      "AIVC, Did you have night sweats?": function(formName, formFieldValues) {
          var conditions = {
              enable: [],
              disable: []
          };
          var conditionConcept = formFieldValues['AIVC, Did you have night sweats?'];
          if (conditionConcept == "Yes") {
              conditions.enable.push("AIVC, Duration of night sweats");
          } else {
              conditions.disable.push("AIVC, Duration of night sweats");
          }
          return conditions;
      },
      "AIVC, Do you have weight loss?": function(formName, formFieldValues) {
          var conditions = {
              enable: [],
              disable: []
          };
          var conditionConcept = formFieldValues['AIVC, Do you have weight loss?'];
          if (conditionConcept == "Yes") {
              conditions.enable.push("AIVC, Duration of weight loss");
          } else {
              conditions.disable.push("AIVC, Duration of weight loss");
          }
          return conditions;
      },
      "AIVC, Do you have shortness of breath?": function(formName, formFieldValues) {
          var conditions = {
              enable: [],
              disable: []
          };
          var conditionConcept = formFieldValues['AIVC, Do you have shortness of breath?'];
          if (conditionConcept == "Yes") {
              conditions.enable.push("AIVC, Duration of shortness of breath");
          } else {
              conditions.disable.push("AIVC, Duration of shortness of breath");
          }
          return conditions;
      },
      "AIVC, Have you ever had TB?": function(formName, formFieldValues) {
          var conditions = {
              enable: [],
              disable: []
          };
          var conditionConcept = formFieldValues['AIVC, Have you ever had TB?'];
          if (conditionConcept == "Yes") {
              conditions.enable.push("AIVC, How many episodes of TB?", "AIVC, TB Dates of previous episodes");
          } else {
              conditions.disable.push("AIVC, How many episodes of TB?", "AIVC, TB Dates of previous episodes");
          }
          return conditions;
      },
      "AIVC, Are you currently being treated for TB?": function(formName, formFieldValues) {
          var conditions = {
              enable: [],
              disable: []
          };
          var conditionConcept = formFieldValues['AIVC, Are you currently being treated for TB?'];
          if (conditionConcept == "Yes") {
              conditions.enable.push("AIVC, How was it Diagnosed", "AIVC, Location of TB");
          } else {
              conditions.disable.push("AIVC, How was it Diagnosed", "AIVC, Location of TB");
          }
          return conditions;
      },
      "AIVC, Do you have any skin problems": function(formName, formFieldValues) {
          var conditions = {
              enable: [],
              disable: []
          };
          var conditionConcept = formFieldValues['AIVC, Do you have any skin problems'];
          if (conditionConcept == "Yes") {
              conditions.enable.push("AIVC, Have you had a skin rash recently?", "AIVC, Have you ever had Herpes zoster/shingles?", "AIVC, Did you experience ant itching?", "AIVC, Have you observed a lump growing?");
          } else {
              conditions.disable.push("AIVC, Have you had a skin rash recently?", "AIVC, Have you ever had Herpes zoster/shingles?", "AIVC, Did you experience ant itching?", "AIVC, Have you observed a lump growing?");
          }
          return conditions;
      },
      "AIVC, Have you had a skin rash recently?": function(formName, formFieldValues) {
          var conditions = {
              enable: [],
              disable: []
          };
          var conditionConcept = formFieldValues['AIVC, Have you had a skin rash recently?'];
          if (conditionConcept == "Yes") {
              conditions.enable.push("AIVC, Duration of skin rash","AIVC, Location of skin rash details","AIVC, Location of skin rash Image","AIVC, Mophology","AIVC, Did the skin rash start after taking medications?");
          } else {
              conditions.disable.push("AIVC, Duration of skin rash","AIVC, Location of skin rash details","AIVC, Location of skin rash Image","AIVC, Mophology","AIVC, Did the skin rash start after taking medications?");
          }
          return conditions;
      },
      "AIVC, Have you observed a lump growing?": function(formName, formFieldValues) {
          var conditions = {
              enable: [],
              disable: []
          };
          var conditionConcept = formFieldValues['AIVC, Have you observed a lump growing?'];
          if (conditionConcept == "Yes") {
              conditions.enable.push("AIVC, Location Lump Image","AIVC, Location lump details");
          } else {
              conditions.disable.push("AIVC, Location Lump Image","AIVC, Location lump details");
          }
          return conditions;
      },
      "AIVC, Are you suffering from headaches?": function(formName, formFieldValues) {
          var conditions = {
              enable: [],
              disable: []
          };
          var conditionConcept = formFieldValues['AIVC, Are you suffering from headaches?'];
          if (conditionConcept == "Yes") {
              conditions.enable.push("AIVC, Duration of Headache", "AIVC, Headache Severity", "AIVC, Headache Course", "AIVC, Headache association");
          } else {
              conditions.disable.push("AIVC, Duration of Headache", "AIVC, Headache Severity", "AIVC, Headache Course", "AIVC, Headache association");
          }
          return conditions;
      },
      "AIVC, Have you noticed any changes in or around the mouth and neck?": function(formName, formFieldValues) {
          var conditions = {
              enable: [],
              disable: []
          };
          var conditionConcept = formFieldValues['AIVC, Have you noticed any changes in or around the mouth and neck?'];
          if (conditionConcept == "Yes") {
              conditions.enable.push("AIVC, Have you had blisters or swelling on/around the lips?", "AIVC, Have you had oral thrush?");
          } else {
              conditions.disable.push("AIVC, Have you had blisters or swelling on/around the lips?", "AIVC, Have you had oral thrush?");
          }
          return conditions;
      },
      "AIVC, Have you had a cough?": function(formName, formFieldValues) {
          var conditions = {
              enable: [],
              disable: []
          };
          var conditionConcept = formFieldValues['AIVC, Have you had a cough?'];
          if (conditionConcept == "Yes") {
              conditions.enable.push("AIVC, Type of cough", "AIVC, Duration of the cough");
          } else {
              conditions.disable.push("AIVC, Type of cough", "AIVC, Duration of the cough");
          }
          return conditions;
      },
      "AIVC, Have you had a chest pain?": function(formName, formFieldValues) {
          var conditions = {
              enable: [],
              disable: []
          };
          var conditionConcept = formFieldValues['AIVC, Have you had a chest pain?'];
          if (conditionConcept == "Yes") {
              conditions.enable.push("AIVC, Location of the chest pain", "AIVC, When does chest pain occur", "AIVC, Duration of chest pains?");
          } else {
              conditions.disable.push("AIVC, Location of the chest pain", "AIVC, When does chest pain occur", "AIVC, Duration of chest pains?");
          }
          return conditions;
      },
      "AIVC, Location of the chest pain": function(formName, formFieldValues) {
          var conditions = {
              enable: [],
              disable: []
          };
          var conditionConcept = formFieldValues['AIVC, Location of the chest pain'];
          if (conditionConcept == "Other locations") {
              conditions.enable.push("AIVC, If other location of the chest pain, specify");
          } else {
              conditions.disable.push("AIVC, If other location of the chest pain, specify");
          }
          return conditions;
      },
      "AIVC, When does chest pain occur": function(formName, formFieldValues) {
          var conditions = {
              enable: [],
              disable: []
          };
          var conditionConcept = formFieldValues['AIVC, When does chest pain occur'];
          if (conditionConcept == "Others") {
              conditions.enable.push("AIVC, chest pain occur Other");
          } else {
              conditions.disable.push("AIVC, chest pain occur Other");
          }
          return conditions;
      },
      "AIVC, Have you experienced shortness of breath?": function(formName, formFieldValues) {
          var conditions = {
              enable: [],
              disable: []
          };
          var conditionConcept = formFieldValues['AIVC, Have you experienced shortness of breath?'];
          if (conditionConcept == "Yes") {
              conditions.enable.push("AIVC, When does the shortness of breath occur?", "AIVC, Duration of shortness of breath?");
          } else {
              conditions.disable.push("AIVC, When does the shortness of breath occur?", "AIVC, Duration of shortness of breath?");
          }
          return conditions;
      },
      "AIVC, Have you had more than one episodes of Pneumonia?": function(formName, formFieldValues) {
          var conditions = {
              enable: [],
              disable: []
          };
          var conditionConcept = formFieldValues['AIVC, Have you had more than one episodes of Pneumonia?'];
          if (conditionConcept == "Yes") {
              conditions.enable.push("AIVC, How many episodes of Pneumonia?");
          } else {
              conditions.disable.push("AIVC, How many episodes of Pneumonia?");
          }
          return conditions;
      },
      "AIVC, Do you have a high blood pressure": function(formName, formFieldValues) {
          var conditions = {
              enable: [],
              disable: []
          };
          var conditionConcept = formFieldValues['AIVC, Do you have a high blood pressure'];
          if (conditionConcept == "Yes") {
              conditions.enable.push("AIVC, Are you on Hypertensive drugs?");
          } else {
              conditions.disable.push("AIVC, Are you on Hypertensive drugs?");
          }
          return conditions;
      },
      "AIVC, Are you on Hypertensive drugs?": function(formName, formFieldValues) {
          var conditions = {
              enable: [],
              disable: []
          };
          var conditionConcept = formFieldValues['AIVC, Are you on Hypertensive drugs?'];
          if (conditionConcept == "Yes") {
              conditions.enable.push("AIVC, If yes on Hypertensive drugs, specify");
          } else {
              conditions.disable.push("AIVC, If yes on Hypertensive drugs, specify");
          }
          return conditions;
      },
      "AIVC, Do you have difficulty swallowing?": function(formName, formFieldValues) {
          var conditions = {
              enable: [],
              disable: []
          };
          var conditionConcept = formFieldValues['AIVC, Do you have difficulty swallowing?'];
          if (conditionConcept == "Yes") {
              conditions.enable.push("AIVC, Is swallowing painful");
          } else {
              conditions.disable.push("AIVC, Is swallowing painful");
          }
          return conditions;
      },
       "AIVC, Do you vomit frequently?": function(formName, formFieldValues) {
           var conditions = {
               enable: [],
               disable: []
           };
           var conditionConcept = formFieldValues['AIVC, Do you vomit frequently?'];
           if (conditionConcept == "Yes") {
               conditions.enable.push("AIVC, When do you vomit?","AIVC, Vomit content");
           } else {
               conditions.disable.push("AIVC, When do you vomit?","AIVC, Vomit content");
           }
           return conditions;
       },
       "AIVC, When do you vomit?": function(formName, formFieldValues) {
           var conditions = {
               enable: [],
               disable: []
           };
           var conditionConcept = formFieldValues['AIVC, When do you vomit?'];
           if (conditionConcept == "Other (specify)") {
               conditions.enable.push("AIVC, If other on vomit, specify");
           } else {
               conditions.disable.push("AIVC, If other on vomit, specify");
           }
           return conditions;
       },
        "AIVC, Vomit content": function(formName, formFieldValues) {
            var conditions = {
                enable: [],
                disable: []
            };
            var conditionConcept = formFieldValues['AIVC, Vomit content'];
            if (conditionConcept == "Other (specify)") {
                conditions.enable.push("AIVC, Vommit Content Other");
            } else {
                conditions.disable.push("AIVC, Vommit Content Other");
            }
            return conditions;
        },
        "AIVC, Do you have diarrhea?": function(formName, formFieldValues) {
            var conditions = {
                enable: [],
                disable: []
            };
            var conditionConcept = formFieldValues['AIVC, Do you have diarrhea?'];
            if (conditionConcept == "Yes") {
                conditions.enable.push("AIVC, Diarrhea duration","AIVC, Diarrhea Details");
            } else {
                conditions.disable.push("AIVC, Diarrhea duration","AIVC, Diarrhea Details");
            }
            return conditions;
        },
        "AIVC, Do you have frequent abdominal pain?": function(formName, formFieldValues) {
            var conditions = {
                enable: [],
                disable: []
            };
            var conditionConcept = formFieldValues['AIVC, Do you have frequent abdominal pain?'];
            if (conditionConcept == "Yes") {
                conditions.enable.push("AIVC, Abdominal pain location","AIVC, Abdominal pain duration","AIVC, Does the abdominal pain occur during fasting?");
            } else {
                conditions.disable.push("AIVC, Abdominal pain location","AIVC, Abdominal pain duration","AIVC, Does the abdominal pain occur during fasting?");
            }
            return conditions;
        },
        "AIVC, Does the abdominal pain occur during fasting?": function(formName, formFieldValues) {
            var conditions = {
                enable: [],
                disable: []
            };
            var conditionConcept = formFieldValues['AIVC, Does the abdominal pain occur during fasting?'];
            if (conditionConcept == "Yes") {
                conditions.enable.push("AIVC, Do you have frequent epigastric pain?");
            } else {
                conditions.disable.push("AIVC, Do you have frequent epigastric pain?");
            }
            return conditions;
        },
        "AIVC, Have you experienced joint pain?": function(formName, formFieldValues) {
            var conditions = {
                enable: [],
                disable: []
            };
            var conditionConcept = formFieldValues['AIVC, Have you experienced joint pain?'];
            if (conditionConcept == "Yes") {
                conditions.enable.push("AIVC, Joint pain duration","AIVC, Location of joint pain");
            } else {
                conditions.disable.push("AIVC, Joint pain duration","AIVC, Location of joint pain");
            }
            return conditions;
        },
        "AIVC, Have you experienced joint swelling?": function(formName, formFieldValues) {
            var conditions = {
                enable: [],
                disable: []
            };
            var conditionConcept = formFieldValues['AIVC, Have you experienced joint swelling?'];
            if (conditionConcept == "Yes") {
                conditions.enable.push("AIVC, Joint swelling duration","AIVC, Location of joint swelling");
            } else {
                conditions.disable.push("AIVC, Joint swelling duration","AIVC, Location of joint swelling");
            }
            return conditions;
        },
        "AIVC, Do you feel a burning sensation with micturation?": function(formName, formFieldValues) {
            var conditions = {
                enable: [],
                disable: []
            };
            var conditionConcept = formFieldValues['AIVC, Do you feel a burning sensation with micturation?'];
            if (conditionConcept == "Yes") {
                conditions.enable.push("AIVC, Did you have a fever rigors or chills with the burning sensation?");
            } else {
                conditions.disable.push("AIVC, Did you have a fever rigors or chills with the burning sensation?");
            }
            return conditions;
        },
         "AIVC, Have you experienced loss of sexual interest?": function(formName, formFieldValues) {
             var conditions = {
                 enable: [],
                 disable: []
             };
             var conditionConcept = formFieldValues['AIVC, Do you feel a burning sensation with micturation?'];
             if (conditionConcept == "Yes") {
                 conditions.enable.push("AIVC, Erectile dysfunction","AIVC, Dysparenuia (painful sexual intercourse)");
             } else {
                 conditions.disable.push("AIVC, Erectile dysfunction","AIVC, Dysparenuia (painful sexual intercourse)");
             }
             return conditions;
         },
         "AIVC, Female, Have you observed a vaginal discharge?": function(formName, formFieldValues) {
             var conditions = {
                 enable: [],
                 disable: []
             };
             var conditionConcept = formFieldValues['AIVC, Female, Have you observed a vaginal discharge?'];
             if (conditionConcept == "Yes") {
                 conditions.enable.push("AIVC, Female, If yes on vaginal discharge, specify type");
             } else {
                 conditions.disable.push("AIVC, Female, If yes on vaginal discharge, specify type");
             }
             return conditions;
         },
         "AIVC, Male, Have you observed a discharge from the penis?": function(formName, formFieldValues) {
             var conditions = {
                 enable: [],
                 disable: []
             };
             var conditionConcept = formFieldValues['AIVC, Male, Have you observed a discharge from the penis?'];
             if (conditionConcept == "Yes") {
                 conditions.enable.push("AIVC, Male, If yes on penis discharge, specify type");
             } else {
                 conditions.disable.push("AIVC, Male, If yes on penis discharge, specify type");
             }
             return conditions;
         },
         "AIVC, Are you currently pregnant?": function(formName, formFieldValues) {
             var conditions = {
                 enable: [],
                 disable: []
             };
             var conditionConcept = formFieldValues['AIVC, Are you currently pregnant?'];
             if (conditionConcept == "Yes") {
                 conditions.enable.push("AIVC, Are you booked for antenatal care?","AIVC, Is the client on triple therapy?");

             }
            else if(conditionConcept == "No") {
                    conditions.disable.push("AIVC, Are you booked for antenatal care?","AIVC, Do you know the EDD?");
                    conditions.enable.push("AIVC, Is the client on triple therapy?");
                 }
             else {
                 conditions.disable.push("AIVC, Are you booked for antenatal care?","AIVC, Do you know the EDD?","AIVC, Is the client on triple therapy?");
             }
             return conditions;
            },
          "AIVC, Are you booked for antenatal care?": function(formName, formFieldValues) {
              var conditions = {
                  enable: [],
                  disable: []
              };
              var conditionConcept = formFieldValues['AIVC, Are you booked for antenatal care?'];
              if (conditionConcept == "Yes") {
                  conditions.enable.push("AIVC, Do you know the EDD?");
              } else {
                  conditions.disable.push("AIVC, Do you know the EDD?");
              }
              return conditions;
          },
          "AIVC, Do you know the EDD?": function(formName, formFieldValues) {
              var conditions = {
                  enable: [],
                  disable: []
              };
              var conditionConcept = formFieldValues['AIVC, Do you know the EDD?'];
              if (conditionConcept == "Yes") {
                  conditions.enable.push("AIVC, Date");
              } else {
                  conditions.disable.push("AIVC, Date");
              }
              return conditions;
          },
           "AIVC, Have you experienced intermenstrual bleeding?": function(formName, formFieldValues) {
               var conditions = {
                   enable: [],
                   disable: []
               };
               var conditionConcept = formFieldValues['AIVC, Have you experienced intermenstrual bleeding?'];
               if (conditionConcept == "Yes") {
                   conditions.enable.push("AIVC, Duration of intermenstrual bleeding");
               } else {
                   conditions.disable.push("AIVC, Duration of intermenstrual bleeding");
               }
               return conditions;
           },
            "AIVC, Do you use contraceptives?": function(formName, formFieldValues) {
                var conditions = {
                    enable: [],
                    disable: []
                };
                var conditionConcept = formFieldValues['AIVC, Do you use contraceptives?'];
                if (conditionConcept == "Yes") {
                    conditions.enable.push("What types of contraceptives do you use?");
                } else {
                    conditions.disable.push("What types of contraceptives do you use?");
                }
                return conditions;
            },
            "What types of contraceptives do you use?": function(formName, formFieldValues) {
                var conditions = {
                    enable: [],
                    disable: []
                };
                var conditionConcept = formFieldValues['What types of contraceptives do you use?'];
                if (conditionConcept == "AIVC, Other") {
                    conditions.enable.push("AIVC, Other contraceptives?");
                } else {
                    conditions.disable.push("AIVC, Other contraceptives?");
                }
                return conditions;
            },
             "AIVC, Have you been screened for cervical cancer?": function(formName, formFieldValues) {
                 var conditions = {
                     enable: [],
                     disable: []
                 };
                 var conditionConcept = formFieldValues['AIVC, Have you been screened for cervical cancer?'];
                 if (conditionConcept == "Yes") {
                     conditions.enable.push("AIVC, Date of screening","Screening result");
                 } else {
                     conditions.disable.push("AIVC, Date of screening","Screening result");
                 }
                 return conditions;
             },
              "AIVC, Have you observed a breast lump(s)?": function(formName, formFieldValues) {
                  var conditions = {
                      enable: [],
                      disable: []
                  };
                  var conditionConcept = formFieldValues['AIVC, Have you observed a breast lump(s)?'];
                  if (conditionConcept == "Yes") {
                      conditions.enable.push("AIVC, Duration of breast lump","AIVC, Location of breast lump");
                  } else {
                      conditions.disable.push("AIVC, Duration of breast lump","AIVC, Location of breast lump");
                  }
                  return conditions;
              },
              "AIVC, Have you been taking other medications or muti (herbs) within the past 2 months?": function(formName, formFieldValues) {
                  var conditions = {
                      enable: [],
                      disable: []
                  };
                  var conditionConcept = formFieldValues['AIVC, Have you been taking other medications or muti (herbs) within the past 2 months?'];
                  if (conditionConcept == "Yes") {
                      conditions.enable.push("AIVC, Medication Notes");
                  } else {
                      conditions.disable.push("AIVC, Medication Notes");
                  }
                  return conditions;
              },
               "AIVC, Have you ever experienced  a drug allergy?": function(formName, formFieldValues) {
                   var conditions = {
                       enable: [],
                       disable: []
                   };
                   var conditionConcept = formFieldValues['AIVC, Have you ever experienced  a drug allergy?'];
                   if (conditionConcept == "Yes") {
                       conditions.enable.push("AIVC, If yes, specify drug allergy details");
                   } else {
                       conditions.disable.push("AIVC, If yes, specify drug allergy details");
                   }
                   return conditions;
               },
                "AIVC, Have you been sexually abused?": function(formName, formFieldValues) {
                    var conditions = {
                        enable: [],
                        disable: []
                    };
                    var conditionConcept = formFieldValues['AIVC, Have you been sexually abused?'];
                    if (conditionConcept == "Yes") {
                        conditions.enable.push("AIVC, Has a police report been filed?","AIVC, Did you receive any medical treatment afterwards?","AIVC, Did you receive counseling?");
                    } else {
                        conditions.disable.push("AIVC, Has a police report been filed?","AIVC, Did you receive any medical treatment afterwards?","AIVC, Did you receive counseling?");
                    }
                    return conditions;
                },
                  "AIVC, Do you use illicit drugs?": function(formName, formFieldValues) {
                      var conditions = {
                          enable: [],
                          disable: []
                      };
                      var conditionConcept = formFieldValues['AIVC, Do you use illicit drugs?'];
                      if (conditionConcept == "Yes") {
                          conditions.enable.push("AIVC, What types of illicit drugs do you use and how often?");
                      } else {
                          conditions.disable.push("AIVC, What types of illicit drugs do you use and how often?");
                      }
                      return conditions;
                  },
                  "AIVC, Have been treated for any of the following conditions?": function(formName, formFieldValues) {
                      var conditions = {
                          enable: [],
                          disable: []
                      };
                      var conditionConcept = formFieldValues['AIVC, Have been treated for any of the following conditions?'];
                      if (conditionConcept == "Yes") {
                          conditions.enable.push("AIVC, if yes, Specify details","AIVC, Medical and Surigcal History Notes");
                      } else {
                          conditions.disable.push("AIVC, if yes, Specify details","AIVC, Medical and Surigcal History Notes");
                      }
                      return conditions;
                  },

                  "AIVC, Have you experienced loss of vision?": function(formName, formFieldValues) {
                      var conditions = {
                          enable: [],
                          disable: []
                      };
                      var conditionConcept = formFieldValues['AIVC, Have you experienced loss of vision?'];
                      if (conditionConcept == "Yes") {
                          conditions.enable.push("AIVC, HEENT If yes, specify details");
                      } else {
                          conditions.disable.push("AIVC, HEENT If yes, specify details");
                      }
                      return conditions;
                  },

                  "PR, Program": function (formName, formFieldValues) {
                      var conditions = {
                          show: [],
                          hide: []
                      };
                      var conditionConcept = formFieldValues['PR, Program'];
                      if (conditionConcept == "PR, ART") {
                          conditions.show.push("PR, Start date of ART program", "PR, ART Stage", "PR, Start date of ART Stage", "PR, ART Program Stop Date",
                          "PR, Reason for Stopping ART Program");

                          conditions.hide.push("PR, Start date of Breast Feeding program", "PR, Start date of IPT program",
                          "PR, Start date of Pregnancy program", "PR, Start date of PrEP program", "PR, Start date of TB program", "PR, Breast Feeding Stage",
                          "PR, Pregnancy Stage", "PR, TB Stage", "PR, Start date of Breast Feeding Stage", "PR, Start date of Pregnancy Stage", "PR, Start date of TB Stage",
                          "PR, Breast Feeding Program Stop Date", "PR, IPT Program Stop Date", "PR, Pregnancy Program Stop Date","PR, PrEP Program Stop Date",
                          "PR, TB Program Stop Date", "PR, Reason for Stopping Breast Feeding Program", "PR, Reason for Stopping IPT Program", "PR, Reason for Stopping Pregnancy Program",
                          "PR, Reason for Stopping PrEP Program", "PR, Reason for Stopping TB Program");
          }
          else if (conditionConcept == "PR, Breast Feeding") {
           conditions.show.push("PR, Start date of Breast Feeding program", "PR, Breast Feeding Stage", "PR, Start date of Breast Feeding Stage", "PR, Breast Feeding Program Stop Date",
            "PR, Reason for Stopping Breast Feeding Program");
           conditions.hide.push("PR, Start date of ART program", "PR, Start date of IPT program",  "PR, Start date of Pregnancy program", "PR, Start date of PrEP program",
            "PR, Start date of TB program", "PR, ART Stage", "PR, Pregnancy Stage", "PR, TB Stage", "PR, Start date of ART Stage", "PR, ART Program Stop Date", "PR, Start date of Pregnancy Stage",
            "PR, Start date of TB Stage", "PR, IPT Program Stop Date", "PR, Pregnancy Program Stop Date","PR, PrEP Program Stop Date", "PR, TB Program Stop Date", "PR, Reason for Stopping IPT Program", "PR, Reason for Stopping Pregnancy Program", "PR, Reason for Stopping PrEP Program",
            "PR, Reason for Stopping TB Program","PR, Reason for Stopping ART Program");
         }
         else if (conditionConcept == "PR, IPT(Isoniazid Preventive Therapy)") {
           conditions.show.push("PR, Start date of IPT program", "PR, IPT Program Stop Date",
            "PR, Reason for Stopping IPT Program");
           conditions.hide.push("PR, Start date of ART program", "PR, Start date of Breast Feeding program",  "PR, Start date of Pregnancy program", "PR, Start date of PrEP program",
            "PR, Start date of TB program", "PR, ART Stage", "PR, Breast Feeding Stage", "PR, Pregnancy Stage", "PR, TB Stage", "PR, Start date of Breast Feeding Stage",
            "PR, Start date of Pregnancy Stage", "PR, Start date of TB Stage", "PR, Breast Feeding Program Stop Date", "PR, Pregnancy Program Stop Date","PR, PrEP Program Stop Date",
            "PR, TB Program Stop Date", "PR, Start date of ART Stage", "PR, ART Program Stop Date","PR, Reason for Stopping Breast Feeding Program", "PR, Reason for Stopping Pregnancy Program",
            "PR, Reason for Stopping PrEP Program", "PR, Reason for Stopping TB Program", "PR, Reason for Stopping ART Program");
         }
         else if (conditionConcept == "PR, Pregnancy") {
            conditions.show.push("PR, Start date of Pregnancy program", "PR, Pregnancy Stage", "PR, Start date of Pregnancy Stage", "PR, Pregnancy Program Stop Date",
              "PR, Reason for Stopping Pregnancy Program");
            conditions.hide.push("PR, Start date of ART program", "PR, Start date of Breast Feeding program",
              "PR, Start date of IPT program", "PR, Start date of PrEP program", "PR, Start date of TB program",
              "PR, Breast Feeding Stage", "PR, ART Stage", "PR, TB Stage", "PR, Start date of Breast Feeding Stage", "PR, Start date of TB Stage",
              "PR, Breast Feeding Program Stop Date", "PR, IPT Program Stop Date", "PR, PrEP Program Stop Date", "PR, TB Program Stop Date", "PR, Start date of ART Stage",
              "PR, ART Program Stop Date", "PR, Reason for Stopping Breast Feeding Program", "PR, Reason for Stopping IPT Program", "PR, Reason for Stopping PrEP Program",
              "PR, Reason for Stopping TB Program", "PR, Reason for Stopping ART Program");
         }
        else if (conditionConcept == "PR, PrEP") {
            conditions.show.push("PR, Start date of PrEP program", "PR, PrEP Program Stop Date",
              "PR, Reason for Stopping PrEP Program");
            conditions.hide.push("PR, Start date of ART program", "PR, Start date of Breast Feeding program",
              "PR, Start date of IPT program", "PR, Start date of Pregnancy program", "PR, Start date of TB program",
              "PR, ART Stage", "PR, Breast Feeding Stage", "PR, Pregnancy Stage", "PR, TB Stage", "PR, Start date of Breast Feeding Stage",
              "PR, Start date of Pregnancy Stage", "PR, Start date of TB Stage", "PR, Breast Feeding Program Stop Date", "PR, IPT Program Stop Date",
              "PR, Pregnancy Program Stop Date", "PR, TB Program Stop Date", "PR, Start date of ART Stage", "PR, ART Program Stop Date",
              "PR, Reason for Stopping Breast Feeding Program", "PR, Reason for Stopping IPT Program", "PR, Reason for Stopping Pregnancy Program",
              "PR, Reason for Stopping TB Program", "PR, Reason for Stopping ART Program");
         }
        else if (conditionConcept == "PR,TB") {
            conditions.show.push("PR, Start date of TB program", "PR, TB Stage", "PR, Start date of TB Stage", "PR, TB Program Stop Date",
              "PR, Reason for Stopping TB Program");
            conditions.hide.push("PR, Start date of ART program", "PR, Start date of Breast Feeding program",
              "PR, Start date of IPT program", "PR, Start date of Pregnancy program", "PR, Start date of PrEP program",
              "PR, ART Stage", "PR, Breast Feeding Stage", "PR, Pregnancy Stage", "PR, Start date of Breast Feeding Stage", "PR, Start date of Pregnancy Stage",
               "PR, Breast Feeding Program Stop Date", "PR, IPT Program Stop Date", "PR, Pregnancy Program Stop Date",
               "PR, PrEP Program Stop Date", "PR, Start date of ART Stage", "PR, ART Program Stop Date", "PR, Reason for Stopping Breast Feeding Program", "PR, Reason for Stopping IPT Program",
               "PR, Reason for Stopping Pregnancy Program", "PR, Reason for Stopping ART Program", "PR, Reason for Stopping PrEP Program");
        }
        else {
                 conditions.hide.push("PR, Start date of ART program", "PR, Start date of Breast Feeding program", "PR, Start date of IPT program",
                  "PR, Start date of Pregnancy program", "PR, Start date of PrEP program", "PR, Start date of TB program", "PR, ART Stage", "PR, Breast Feeding Stage", "PR, Pregnancy Stage",
                  "PR, TB Stage", "PR, Start date of ART Stage", "PR, ART Program Stop Date", "PR, Start date of Breast Feeding Stage", "PR, Start date of Pregnancy Stage", "PR, Start date of TB Stage",
                  "PR, Breast Feeding Program Stop Date", "PR, IPT Program Stop Date", "PR, Pregnancy Program Stop Date","PR, PrEP Program Stop Date", "PR, TB Program Stop Date",
                  "PR, Reason for Stopping ART Program", "PR, Reason for Stopping Breast Feeding Program", "PR, Reason for Stopping IPT Program", "PR, Reason for Stopping Pregnancy Program", "PR, Reason for Stopping PrEP Program",
                  "PR, Reason for Stopping TB Program");
         }
         return conditions;
       },
    "PHTC-TB Screening, Have you had a cough?": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['PHTC-TB Screening, Have you had a cough?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("PHTC-TB Screening, Type of cough","PHTC-TB Screening, Cough Duration");

        }
        else
        {
            conditions.disable.push("PHTC-TB Screening, Type of cough","PHTC-TB Screening, Cough Duration");
        }
        return conditions;

    },
    "PHTC-TB Screening, Have you had chest pain?": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['PHTC-TB Screening, Have you had chest pain?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("PHTC-TB Screening, Location of chest pains?","PHTC-TB Screening, When does the chest pain occur?",
                "PHTC-TB Screening, Chest Pain Duration");

        }
        else
        {
            conditions.disable.push("PHTC-TB Screening, Location of chest pains?","PHTC-TB Screening, When does the chest pain occur?",
                "PHTC-TB Screening, Chest Pain Duration");
        }
        return conditions;

    },
    "PHTC-TB Screening, Location of chest pains?": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['PHTC-TB Screening, Location of chest pains?'];
        if (conditionConcept=='Other locations') {
            conditions.enable.push("PHTC-TB Screening, If other location, specify details");

        }
        else
        {
            conditions.disable.push("PHTC-TB Screening, If other location, specify details");
        }
        return conditions;

    },
    "PHTC-TB Screening, When does the chest pain occur?": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['PHTC-TB Screening, When does the chest pain occur?'];
        if (conditionConcept=='Other') {
            conditions.enable.push("PHTC-TB Screening, If other, specify details");

        }
        else
        {
            conditions.disable.push("PHTC-TB Screening, If other, specify details");
        }
        return conditions;

    },
    "PHTC-TB Screening, Have you had shortness of breath?": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['PHTC-TB Screening, Have you had shortness of breath?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("PHTC-TB Screening, Shortness of breath Duration","PHTC-TB Screening, When does the shortness of breath occur?");

        }
        else
        {
            conditions.disable.push("PHTC-TB Screening, Shortness of breath Duration","PHTC-TB Screening, When does the shortness of breath occur?");
        }
        return conditions;

    },
    "PHTC-TB Screening, Did you have fever recently?": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['PHTC-TB Screening, Did you have fever recently?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("PHTC-TB Screening, Duration of fever");

        }
        else
        {
            conditions.disable.push("PHTC-TB Screening, Duration of fever");
        }
        return conditions;

    },
    "PHTC-TB Screening, Did you have night sweats?": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['PHTC-TB Screening, Did you have night sweats?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("PHTC-TB Screening, Duration of night sweats");

        }
        else
        {
            conditions.disable.push("PHTC-TB Screening, Duration of night sweats");
        }
        return conditions;

    },
    "PHTC-TB Screening, Do you have weight loss?": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['PHTC-TB Screening, Do you have weight loss?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("PHTC-TB Screening, Duration of weight loss");

        }
        else
        {
            conditions.disable.push("PHTC-TB Screening, Duration of weight loss");
        }
        return conditions;

    },
    "PHTC, Late read result?": function(formName, formFieldValues) {
    var conditions = {enable: [], disable: []};
    var conditionConcept = formFieldValues['PHTC, Late read result?'];
    if (conditionConcept == "Yes") {
        conditions.enable.push("PHTC-Late Read result If yes, specify the result");

    }
    else
    {
        conditions.disable.push("PHTC-Late Read result If yes, specify the result");
    }
    return conditions;
},
"FPS FORM,Referred in for": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['FPS FORM,Referred in for'];
     if (conditionConcept == "Other") {
           conditions.enable.push("FPS FORM,If other Referred in then specify details");

       }
     else
       {
           conditions.disable.push("FPS FORM,If other Referred in then specify details");
       }
     return conditions;
     },
     "FPS FORM,Have you ever used any contraception before (tick all that apply)" : function (formName, formFieldValues) {
      var conditions = {enable: [], disable: []};
      var obj = formFieldValues['FPS FORM,Have you ever used any contraception before (tick all that apply)'];
      if (obj.includes('None')) {
          conditions.enable.push("FPS FORM,If none when was the last time you used one");
              }
      else {
          conditions.disable.push("FPS FORM,If none when was the last time you used one");
           }
          return conditions;
     },
"FPS FORM,Allergies (state below if any)": function(formName, formFieldValues) {
      var conditions = {enable: [], disable: []};
      var conditionConcept = formFieldValues['FPS FORM,Allergies (state below if any)'];
      if (conditionConcept == "Yes") {
          conditions.enable.push("FPS FORM,If yes, specify details");

      }
      else
      {
          conditions.disable.push("FPS FORM,If yes, specify details");
      }
      return conditions;
},
"FPS FORM,Any other illness?": function(formName, formFieldValues) {
      var conditions = {enable: [], disable: []};
      var conditionConcept = formFieldValues['FPS FORM,Any other illness?'];
      if (conditionConcept == "Yes") {
          conditions.enable.push("FPS FORM,Other illness If Yes");

      }
      else
      {
        conditions.disable.push("FPS FORM,Other illness If Yes");
   }
   return conditions;
},


"FPS FORM,Currently receiving ART?": function(formName, formFieldValues) {
      var conditions = {enable: [], disable: []};
      var conditionConcept = formFieldValues['FPS FORM,Currently receiving ART?'];
      if (conditionConcept == "Yes") {
         conditions.enable.push("FPS FORM,other ART");

      }
      else
      {
         conditions.disable.push("FPS FORM,other ART");
      }
       return conditions;
},

 "FPS FORM,Is the client taking any medications": function(formName, formFieldValues) {
      var conditions = {enable: [], disable: []};
      var conditionConcept = formFieldValues['FPS FORM,Is the client taking any medications'];
      if (conditionConcept == "Yes") {
          conditions.enable.push("FPS FORM,Other Medications");

      }
      else
        {
            conditions.disable.push("FPS FORM,Other Medications");
        }
    return conditions;
},
"FPS FORM,Did the client have any surgical operation?": function(formName, formFieldValues) {
    var conditions = {enable: [], disable: []};
    var conditionConcept = formFieldValues['FPS FORM,Did the client have any surgical operation?'];
    if (conditionConcept == "Yes") {
        conditions.enable.push("FPS FORM,Other surgical Operation");

    }
    else
    {
        conditions.disable.push("FPS FORM,Other surgical Operation");
    }
    return conditions;
},
"FPS FORM,General clinical examination, Any clinical abnormality" : function (formName, formFieldValues) {
    var conditions = {enable: [], disable: []};
    var obj = formFieldValues['FPS FORM,General clinical examination, Any clinical abnormality'];
    if (obj.length > 0) {
             conditions.enable.push("FPS FORM,Physical sec Specify details");
             }
    else {
               conditions.disable.push("FPS FORM,Physical sec Specify details");
             }
        return conditions;
    },
"FPS FORM,Have you ever used any contraception before (tick all that apply)" : function (formName, formFieldValues) {
   var conditions = {enable: [], disable: []};
   var obj = formFieldValues['FPS FORM,Have you ever used any contraception before (tick all that apply)'];
   if (obj.includes('None')) {
       conditions.enable.push("FPS FORM,If none when was the last time you used one");
           }
   else {
       conditions.disable.push("FPS FORM,If none when was the last time you used one");
        }
        return conditions;
   },
 "FPS FORM,Genital examination: Does the client have any of the following conditions?" : function (formName, formFieldValues) {
      var conditions = {enable: [], disable: []};
      var obj = formFieldValues['FPS FORM,Genital examination: Does the client have any of the following conditions?'];
      if (obj.includes('Other')) {
          conditions.enable.push("FPS FORM,If other for physical examination");
              }
      else {
          conditions.disable.push("FPS FORM,If other for physical examination");
           }
           return conditions;
      },
   "FPS FORM,Changing State": function(formName, formFieldValues) {
           var conditions = {enable: [], disable: []};
           var conditionConcept = formFieldValues['FPS FORM,Changing State'];
           if (conditionConcept == "Yes") {
               conditions.enable.push("FPS FORM,Changeing_state if yes specify details");

           }
           else
           {
               conditions.disable.push("FPS FORM,Changeing_state if yes specify details");
           }
           return conditions;
   },
   "FPS FORM,Medically eligible": function(formName, formFieldValues) {
           var conditions = {enable: [], disable: []};
           var conditionConcept = formFieldValues['FPS FORM,Medically eligible'];
           if (conditionConcept == "No") {
               conditions.enable.push("FPS FORM,If not medically eligible");

           }
           else
           {
               conditions.disable.push("FPS FORM,If not medically eligible");
           }
           return conditions;
   },
"FPS FORM,Method issued and/or administered" : function (formName, formFieldValues) {
      var conditions = {enable: [], disable: []};
      var obj = formFieldValues['FPS FORM,Method issued and/or administered'];
      if (obj ==='FPS FORM,Projesterone only pill (POP)') {
          conditions.enable.push("FPS FORM, State POP Cycles");
            }
      else  {
          conditions.disable.push("FPS FORM, State POP Cycles");
            }
       if (obj ==='FPS FORM,Combined oral contaceptive (COC)') {
          conditions.enable.push("FPS FORM,State COC Cycles");
            }
      else  {
          conditions.disable.push("FPS FORM,State COC Cycles");
            }
          return conditions;
     },
"FPS FORM,Device removal": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: [],show: [], hide: []};
 		var questionThatTriggersRule = "FPS FORM,Device removal";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
 		var aboveQuestionAnswer = "FPS FORM,FP type";
 		var secondAnswer = "FPS FORM,State reason for removal";
 		var thirdAnswer = "FPS FORM,Device Inserted by";
        var conditionTrue = selectedResponses == 'Yes';
     	var ruleActions = {enable: [], disable: []};
         if(conditionTrue) {
             ruleActions.enable.push(aboveQuestionAnswer);
             ruleActions.enable.push(secondAnswer);
             ruleActions.enable.push(thirdAnswer);
         } else {
             ruleActions.disable.push(aboveQuestionAnswer);
             ruleActions.disable.push(secondAnswer);
             ruleActions.disable.push(thirdAnswer);
         }
         return ruleActions;
 	    },
 "FPS FORM,Device Inserted by": function(formName, formFieldValues) {
         var conditions = {enable: [], disable: []};
         var conditionConcept = formFieldValues['FPS FORM,Device Inserted by'];
         if (conditionConcept == "Other") {
              conditions.enable.push("FPS FORM,Other Device");

         }
         else
         {
              conditions.disable.push("FPS FORM,Other Device");
         }
          return conditions;
},
 "FPS FORM,State reason for removal": function(formName, formFieldValues) {
         var conditions = {enable: [], disable: []};
         var conditionConcept = formFieldValues['FPS FORM,State reason for removal'];
         if (conditionConcept == "Other") {
              conditions.enable.push("FPS FORM,State removal If other");

         }
         else
         {
              conditions.disable.push("FPS FORM,State removal If other");
             }

         if (conditionConcept == "FPS FORM,Health concerns" || conditionConcept == "FPS FORM,Complications")
         {
              conditions.enable.push("FPS Form, State the health concerns and complications");

         }
         else
         {
              conditions.disable.push("FPS Form, State the health concerns and complications");
             }
              return conditions;
      },
"FPS Form, State the health concerns and complications": function(formName, formFieldValues) {
         var conditions = {enable: [], disable: []};
         var conditionConcept = formFieldValues['FPS Form, State the health concerns and complications'];
         if (conditionConcept == "Side effects") {
              conditions.enable.push("FPS Form If side effects, specify details");

         }
         else
         {
              conditions.disable.push("FPS Form If side effects, specify details");
         }
          return conditions;
},
 "FPS FORM,Complications during insertions": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: [],show: [], hide: []};
 		var questionThatTriggersRule = "FPS FORM,Complications during insertions";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
 		var aboveQuestionEffected = "FPS FORM,If complication is Yes";
        var conditionTrue = selectedResponses == 'Yes';
     	var ruleActions = {enable: [], disable: []};
         if(conditionTrue) {
             ruleActions.enable.push(aboveQuestionEffected);
         } else {
             ruleActions.disable.push(aboveQuestionEffected);
         }
         return ruleActions;
 	   },
 "FPS FORM,If complication is Yes": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['FPS FORM,If complication is Yes'];
     if (conditionConcept == "Other") {
          conditions.enable.push("FPS Form, If Yes for other complication");

     }
     else
     {
          conditions.disable.push("FPS Form, If Yes for other complication");
     }
          return conditions;
  },
 "FPS FORM,Adverse Event": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: [],show: [], hide: []};
  		var questionThatTriggersRule = "FPS FORM,Adverse Event";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
  		var aboveQuestionEffected = "FPS FORM,If yes, select the adverse event";
        var conditionTrue = selectedResponses == 'Yes';
      	var ruleActions = {enable: [], disable: []};
          if(conditionTrue) {
              ruleActions.enable.push(aboveQuestionEffected);
      } else {
          ruleActions.disable.push(aboveQuestionEffected);
      }
  return ruleActions;
},
 "FPS FORM,If yes, select the adverse event": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['FPS FORM,If yes, select the adverse event'];
     if (conditionConcept == "Other") {
          conditions.enable.push("FPS Form, If Yes for other adverse event");

     }
     else
     {
          conditions.disable.push("FPS Form, If Yes for other adverse event");
     }
          return conditions;
  },
 "FPS FORM,Referred out ?": function(formName, formFieldValues) {
   var conditions = {enable: [], disable: [],show: [], hide: []};
   var questionThatTriggersRule = "FPS FORM,Referred out ?";
   var selectedResponses = formFieldValues[questionThatTriggersRule];
   var aboveQuestionEffected = "FPS FORM,Indicate where client was referred to";
   var otherQuestionEffected = "FPS FORM,Referral slip and instructions to leave slip at the clinic given";
   var thirdQuestionEffected = "FPS FORM,State reason for referral";

   var conditionTrue = selectedResponses == 'Yes';
   var ruleActions = {enable: [], disable: []};
      if(conditionTrue) {
            ruleActions.enable.push(aboveQuestionEffected);
            ruleActions.enable.push(thirdQuestionEffected);
            ruleActions.enable.push(otherQuestionEffected);
   } else {
        ruleActions.disable.push(aboveQuestionEffected);
        ruleActions.disable.push(thirdQuestionEffected);
        ruleActions.disable.push(otherQuestionEffected);
     }
   return ruleActions;
 },
 "FPS FORM,Indicate where client was referred to": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['FPS FORM,Indicate where client was referred to'];
     if (conditionConcept.indexOf("Other") >= 0)  {
          conditions.enable.push("FPS FORM,Other referal");

     }
     else
     {
          conditions.disable.push("FPS FORM,Other referal");
     }
     if (conditionConcept.indexOf("Surgical (state the problem)") >= 0){
          conditions.enable.push("FPS Form, State the surgical problem");

     }
     else
     {
          conditions.disable.push("FPS Form, State the surgical problem");
     }
     if (conditionConcept.indexOf("Medical (state the problem)") >= 0){
          conditions.enable.push("FPS Form, State the medical problem");

     }
     else
     {
          conditions.disable.push("FPS Form, State the medical problem");
     }
      if (conditionConcept.indexOf("Gynaecological problem (state the problem)") >= 0){
          conditions.enable.push("FPS Form, State the gynaecological problem");

     }
     else
     {
          conditions.disable.push("FPS Form, State the gynaecological problem");
     }
          return conditions;
  },
  "FPS FORM,Condoms given" : function (formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var obj = formFieldValues['FPS FORM,Condoms given'];
     if (obj.includes('Male')) {
         conditions.enable.push("FPS FORM,Specify the quantity for male condoms");
         }
     else {
         conditions.disable.push("FPS FORM,Specify the quantity for male condoms");
          }
     if (obj.includes('Female')) {
         conditions.enable.push("FPS FORM,Specify the quantity for female condoms");
     }
     else {
         conditions.disable.push("FPS FORM,Specify the quantity for female condoms");
          }
         return conditions;
     },
    "FPS REG,Reason for the visit": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['FPS REG,Reason for the visit'];
        if (conditionConcept == "Method") {
            conditions.enable.push("FPS REG,Reason for family planning");

        }
        else
        {
            conditions.disable.push("FPS REG,Reason for family planning");
        }
        return conditions;

    },
    "FPS REG,How did you hear about the FP services at sites?": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['FPS REG,How did you hear about the FP services at sites?'];
        if (conditionConcept == "FPS REG,Other site") {
            conditions.enable.push("FPS FORM, Other for How did you hear about the FP services at sites?");

        }
        else
        {
            conditions.disable.push("FPS FORM, Other for How did you hear about the FP services at sites?");
        }
        return conditions;

    },
    "FPS FORM,Current Method": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['FPS FORM,Current Method'];
     if (conditionConcept.indexOf("Others") >=0) {
          conditions.enable.push("FPS Form, IF Current method others, then specify");

     }
     else
     {
          conditions.disable.push("FPS Form, IF Current method others, then specify");
     }
          return conditions;
  },
      "FPS FORM,Pregnancy test": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['FPS FORM,Pregnancy test'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("FPS Form, If Yes for pregnancy test");

        }
        else
        {
            conditions.disable.push("FPS Form, If Yes for pregnancy test");
        }
        return conditions;

    },
    "FP Counselling Only, Current Method": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['FP Counselling Only, Current Method'];
     if (conditionConcept.indexOf("Others") >=0) {
          conditions.enable.push("FPS Counselling, IF Current method others, then specify");

     }
     else
     {
          conditions.disable.push("FPS Counselling, IF Current method others, then specify");
     }
          return conditions;
  },

"FP Counselling Only,Device removal": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: [],show: [], hide: []};
        var questionThatTriggersRule = "FP Counselling Only,Device removal";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var aboveQuestionAnswer = "FP Counselling Only,FP type";
        var secondAnswer = "FP Counselling Only,State reason for removal";
        var thirdAnswer = "FP Counselling Only,Device Inserted by";
        var forthAnswer = "FP Counselling Only, End of procedure, indicate time";
        var fifthAnswer = "FPS Counselling Only, Complications during insertions";
        var sixthAnswer = "FPS Counselling Only, Adverse Event";
        var seventhAnswer = "FPS Counselling Only, Procedure done by (Name of counsellor)";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
         if(conditionTrue) {
             ruleActions.enable.push(aboveQuestionAnswer);
             ruleActions.enable.push(secondAnswer);
             ruleActions.enable.push(thirdAnswer);
             ruleActions.enable.push(forthAnswer);
             ruleActions.enable.push(fifthAnswer);
             ruleActions.enable.push(sixthAnswer);
             ruleActions.enable.push(seventhAnswer);
         } else {
             ruleActions.disable.push(aboveQuestionAnswer);
             ruleActions.disable.push(secondAnswer);
             ruleActions.disable.push(thirdAnswer);
             ruleActions.disable.push(forthAnswer);
             ruleActions.disable.push(fifthAnswer);
             ruleActions.disable.push(sixthAnswer);
             ruleActions.disable.push(seventhAnswer);
         }
         return ruleActions;
        },
 "FP Counselling Only,Device Inserted by": function(formName, formFieldValues) {
         var conditions = {enable: [], disable: []};
         var conditionConcept = formFieldValues['FP Counselling Only,Device Inserted by'];
         if (conditionConcept == "Other") {
              conditions.enable.push("FP Counselling Only,Other Device");

         }
         else
         {
              conditions.disable.push("FP Counselling Only,Other Device");
         }
          return conditions;
},
 "FP Counselling Only,State reason for removal": function(formName, formFieldValues) {
         var conditions = {enable: [], disable: []};
         var conditionConcept = formFieldValues['FP Counselling Only,State reason for removal'];
         if (conditionConcept == "Other") {
              conditions.enable.push("FP Counselling Only,State removal If other");

         }
         else
         {
              conditions.disable.push("FP Counselling Only,State removal If other");
             }

         if (conditionConcept == "FP Counselling Only,Health concerns" || conditionConcept == "FP Counselling Only,Complications")
         {
              conditions.enable.push("FP Counselling Only, State the health concerns and complications");

         }
         else
         {
              conditions.disable.push("FP Counselling Only, State the health concerns and complications");
             }
              return conditions;
      },
"FP Counselling Only, State the health concerns and complications": function(formName, formFieldValues) {
         var conditions = {enable: [], disable: []};
         var conditionConcept = formFieldValues['FP Counselling Only, State the health concerns and complications'];
         if (conditionConcept == "Side effects") {
              conditions.enable.push("FP Counselling Only If side effects, specify details");

         }
         else
         {
              conditions.disable.push("FP Counselling Only If side effects, specify details");
         }
          return conditions;
},
 "FPS Counselling Only, Complications during insertions": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: [],show: [], hide: []};
        var questionThatTriggersRule = "FPS Counselling Only, Complications during insertions";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var aboveQuestionEffected = "FPS Counselling Only,If complication is Yes";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
         if(conditionTrue) {
             ruleActions.enable.push(aboveQuestionEffected);
         } else {
             ruleActions.disable.push(aboveQuestionEffected);
         }
         return ruleActions;
       },
 "FPS Counselling Only,If complication is Yes": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['FPS Counselling Only,If complication is Yes'];
     if (conditionConcept == "Other") {
          conditions.enable.push("FPS Counselling Only, If Yes for other complication");

     }
     else
     {
          conditions.disable.push("FPS Counselling Only, If Yes for other complication");
     }
          return conditions;
  },
   "FPS Counselling Only, Adverse Event": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: [],show: [], hide: []};
        var questionThatTriggersRule = "FPS Counselling Only, Adverse Event";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var aboveQuestionEffected = "FPS Counselling Only, If yes, select the adverse event";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
          if(conditionTrue) {
              ruleActions.enable.push(aboveQuestionEffected);
      } else {
          ruleActions.disable.push(aboveQuestionEffected);
      }
  return ruleActions;
},
 "FPS Counselling Only, If yes, select the adverse event": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['FPS Counselling Only, If yes, select the adverse event'];
     if (conditionConcept == "Other") {
          conditions.enable.push("FPS Counselling Only, If Yes for other adverse event");

     }
     else
     {
          conditions.disable.push("FPS Counselling Only, If Yes for other adverse event");
     }
          return conditions;
  },
  "FPS Counselling Only, Referred out ?": function(formName, formFieldValues) {
   var conditions = {enable: [], disable: [],show: [], hide: []};
   var questionThatTriggersRule = "FPS Counselling Only, Referred out ?";
   var selectedResponses = formFieldValues[questionThatTriggersRule];
   var aboveQuestionEffected = "FPS Counselling Only, Indicate where client was referred to";
   var otherQuestionEffected = "FPS Counselling Only, Referral slip and instructions to leave slip at the clinic given";
   var thirdQuestionEffected = 'FPS Counselling Only, State reason for referral';

   var conditionTrue = selectedResponses == 'Yes';
   var ruleActions = {enable: [], disable: []};
      if(conditionTrue) {
            ruleActions.enable.push(aboveQuestionEffected);
            ruleActions.enable.push(thirdQuestionEffected);
            ruleActions.enable.push(otherQuestionEffected);
   } else {
        ruleActions.disable.push(aboveQuestionEffected);
        ruleActions.disable.push(thirdQuestionEffected);
        ruleActions.disable.push(otherQuestionEffected);
     }
   return ruleActions;
 },
 "FPS Counselling Only, Indicate where client was referred to": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['FPS Counselling Only, Indicate where client was referred to'];
     if (conditionConcept.indexOf("Other") >= 0)  {
          conditions.enable.push("FPS Counselling Only, Other referal");

     }
     else
     {
          conditions.disable.push("FPS Counselling Only, Other referal");
     }
     if (conditionConcept.indexOf("Surgical (state the problem)") >= 0){
          conditions.enable.push("FPS Counselling Only, State the surgical problem");

     }
     else
     {
          conditions.disable.push("FPS Counselling Only, State the surgical problem");
     }
     if (conditionConcept.indexOf("Medical (state the problem)") >= 0){
          conditions.enable.push("FPS Counselling Only, State the medical problem");

     }
     else
     {
          conditions.disable.push("FPS Counselling Only, State the medical problem");
     }
      if (conditionConcept.indexOf("Gynaecological problem (state the problem)") >= 0){
          conditions.enable.push("FPS Counselling Only, State the gynaecological problem");

     }
     else
     {
          conditions.disable.push("FPS Counselling Only, State the gynaecological problem");
     }
          return conditions;
  },
    "FP Continuation, Current Method": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['FP Continuation, Current Method'];
     if (conditionConcept.indexOf("Others") >=0) {
          conditions.enable.push("FP Continuation, IF Current method others, then specify");

     }
     else
     {
          conditions.disable.push("FP Continuation, IF Current method others, then specify");
     }
          return conditions;
  },
    "FP Continuation,Referred out ?": function(formName, formFieldValues) {
   var conditions = {enable: [], disable: [],show: [], hide: []};
   var questionThatTriggersRule = "FP Continuation,Referred out ?";
   var selectedResponses = formFieldValues[questionThatTriggersRule];
   var aboveQuestionEffected = "FP Continuation,Indicate where client was referred to";
   var otherQuestionEffected = "FP Continuation,Referral slip and instructions to leave slip at the clinic given";
   var thirdQuestionEffected = "FP Continuation,State reason for referral";

   var conditionTrue = selectedResponses == 'Yes';
   var ruleActions = {enable: [], disable: []};
      if(conditionTrue) {
            ruleActions.enable.push(aboveQuestionEffected);
            ruleActions.enable.push(thirdQuestionEffected);
            ruleActions.enable.push(otherQuestionEffected);
   } else {
        ruleActions.disable.push(aboveQuestionEffected);
        ruleActions.disable.push(thirdQuestionEffected);
        ruleActions.disable.push(otherQuestionEffected);
     }
   return ruleActions;
 },
 "FP Continuation,Indicate where client was referred to": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['FP Continuation,Indicate where client was referred to'];
     if (conditionConcept.indexOf("Other") >= 0)  {
          conditions.enable.push("FP Continuation,Other referal");

     }
     else
     {
          conditions.disable.push("FP Continuation,Other referal");
     }
     if (conditionConcept.indexOf("Surgical (state the problem)") >= 0){
          conditions.enable.push("FP Continuation, State the surgical problem");

     }
     else
     {
          conditions.disable.push("FP Continuation, State the surgical problem");
     }
     if (conditionConcept.indexOf("Medical (state the problem)") >= 0){
          conditions.enable.push("FP Continuation, State the medical problem");

     }
     else
     {
          conditions.disable.push("FP Continuation, State the medical problem");
     }
      if (conditionConcept.indexOf("Gynaecological problem (state the problem)") >= 0){
          conditions.enable.push("FP Continuation, State the gynaecological problem");

     }
     else
     {
          conditions.disable.push("FP Continuation, State the gynaecological problem");
     }
          return conditions;
  },
  "FPS Continuation, Procedure Done": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: [],show: [], hide: []};
        var questionThatTriggersRule = "FPS Continuation, Procedure Done";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var aboveQuestionAnswer = "FPS Continuation, State Procedure";
        var secondAnswer = "FP Continuation, Date of Procedure indicate";
        var thirdAnswer = "FP Continuation, Pre-Procedure counseling and assessment conducted?";
        var forthAnswer = "FP Continuation, Indicate name of Counselor";
        var fifthAnswer = "FP Cont Form, Start of procedure indicate time";
        var sixthAnswer = "FP Cont Form, End of procedure indicate time";
        var seventhAnswer = "FP Continuation, Complications during insertions";
        var eighthAnswer = "FP Continuation, Adverse Event";
        var ninethAnswer = "FP Continuation, Procedure done by (Name of counsellor)";
        var tenthAnswer = "FP Continuation, Batch number of the method given";
        var eleventhAnswer = "FP Continuation, Expiry date of the method given";
        var twelvethAnswer = "FP Continuation, Manufacturer of the method given";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
         if(conditionTrue) {
             ruleActions.enable.push(aboveQuestionAnswer);
             ruleActions.enable.push(secondAnswer);
             ruleActions.enable.push(thirdAnswer);
             ruleActions.enable.push(forthAnswer);
             ruleActions.enable.push(fifthAnswer);
             ruleActions.enable.push(sixthAnswer);
             ruleActions.enable.push(seventhAnswer);
             ruleActions.enable.push(eighthAnswer);
             ruleActions.enable.push(ninethAnswer);
             ruleActions.enable.push(tenthAnswer);
             ruleActions.enable.push(eleventhAnswer);
             ruleActions.enable.push(twelvethAnswer);
         } else {
             ruleActions.disable.push(aboveQuestionAnswer);
             ruleActions.disable.push(secondAnswer);
             ruleActions.disable.push(thirdAnswer);
             ruleActions.disable.push(forthAnswer);
             ruleActions.disable.push(fifthAnswer);
             ruleActions.disable.push(sixthAnswer);
             ruleActions.disable.push(seventhAnswer);
             ruleActions.disable.push(eighthAnswer);
             ruleActions.disable.push(ninethAnswer);
             ruleActions.disable.push(tenthAnswer);
             ruleActions.disable.push(eleventhAnswer);
             ruleActions.disable.push(twelvethAnswer);
         }
         return ruleActions;
        },
  "FP Continuation, Complications during insertions": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: [],show: [], hide: []};
        var questionThatTriggersRule = "FP Continuation, Complications during insertions";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var aboveQuestionEffected = "FPS Continuation, If Yes select the complications";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
         if(conditionTrue) {
             ruleActions.enable.push(aboveQuestionEffected);
         } else {
             ruleActions.disable.push(aboveQuestionEffected);
         }
         return ruleActions;
       },
 "FPS Continuation, If Yes select the complications": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['FPS Continuation, If Yes select the complications'];
     if (conditionConcept =="Other") {
          conditions.enable.push("FPS Continuation, If other for yes as complication");

     }
     else
     {
          conditions.disable.push("FPS Continuation, If other for yes as complication");
     }
          return conditions;
  },
"FP Continuation, Adverse Event": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: [],show: [], hide: []};
        var questionThatTriggersRule = "FP Continuation, Adverse Event";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var aboveQuestionEffected = "FP Continuation, If yes, select the adverse event";
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
          if(conditionTrue) {
              ruleActions.enable.push(aboveQuestionEffected);
      } else {
          ruleActions.disable.push(aboveQuestionEffected);
      }
  return ruleActions;
},
 "FP Continuation, If yes, select the adverse event": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['FP Continuation, If yes, select the adverse event'];
     if (conditionConcept =="Other") {
          conditions.enable.push("FP Continuation, If Yes for other adverse event");

     }
     else
     {
          conditions.disable.push("FP Continuation, If Yes for other adverse event");
     }
          return conditions;
  },
  "FPS Continuation, State Procedure": function (formName, formFieldValues) {
        var conditions = {show: [], hide: []};
        var conditionConcept = formFieldValues['FPS Continuation, State Procedure'];

        if (conditionConcept == "Insertion") {
            conditions.show.push("FPS Continuation, Insertion Method");
            conditions.hide.push("FPS Continuation, Removal Method");
            conditions.hide.push("FP Continuation, Insertion/Removal Method");
            conditions.hide.push("FP Continuation, State reason for removal");
            conditions.hide.push("FP Cont Form, Removal Method");
            conditions.hide.push("FP Cont Form, State reason for removal");

        }
        else if (conditionConcept == "Removal") {
            conditions.show.push("FPS Continuation, Removal Method");
            conditions.show.push("FP Continuation, State reason for removal");
            conditions.hide.push("FPS Continuation, Insertion Method");
            conditions.hide.push("FP Continuation, Insertion/Removal Method");
            conditions.hide.push("FP Cont Form, Removal Method");
            conditions.hide.push("FP Cont Form, State reason for removal");

        }
        else if (conditionConcept == "Insertion/Removal") {
            conditions.show.push("FP Continuation, Insertion/Removal Method");
            conditions.show.push("FP Cont Form, Removal Method");
            conditions.show.push("FP Cont Form, State reason for removal");
            conditions.hide.push("FPS Continuation, Removal Method");
            conditions.hide.push("FPS Continuation, Insertion Method");
            conditions.hide.push("FP Continuation, State reason for removal");

        }
        else {
            conditions.hide.push("FPS Continuation, Insertion Method",
                                 "FPS Continuation, Removal Method",
                                 "FP Continuation, Insertion/Removal Method",
                                 "FP Continuation, State reason for removal",
                                 "FP Cont Form, Removal Method",
                                 "FP Cont Form, State reason for removal");
        }
        return conditions;
    },
      "FPS FORM,HIV infection?": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: [],show: [], hide: []};
        var questionThatTriggersRule = "FPS FORM,HIV infection?";
        var selectedResponses = formFieldValues[questionThatTriggersRule];
        var aboveQuestionAnswer = "FPS FORM,Diagnosed when?";
        var secondAnswer = "FPS FORM,Recent CD4 cell count";
        var thirdAnswer = "FPS FORM,Currently receiving ART?";
        var forthAnswer = "FPS FORM,In the past included in PMTCT program?";
        var fifthAnswer = "FPS FORM,Is the client taking any medications";
        var sixthAnswer = "FPS FORM,Did the client have any surgical operation?";
        var conditionTrue = selectedResponses == 'Positive';
        var ruleActions = {enable: [], disable: []};
         if(conditionTrue) {
             ruleActions.enable.push(aboveQuestionAnswer);
             ruleActions.enable.push(secondAnswer);
             ruleActions.enable.push(thirdAnswer);
             ruleActions.enable.push(forthAnswer);
             ruleActions.enable.push(fifthAnswer);
             ruleActions.enable.push(sixthAnswer);
         } else {
             ruleActions.disable.push(aboveQuestionAnswer);
             ruleActions.disable.push(secondAnswer);
             ruleActions.disable.push(thirdAnswer);
             ruleActions.disable.push(forthAnswer);
             ruleActions.disable.push(fifthAnswer);
             ruleActions.disable.push(sixthAnswer);
         }
         return ruleActions;
        },
    "COSD Form, Current ART Regimen": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['COSD Form, Current ART Regimen'];
     if (conditionConcept =="Adult 1st line ART Regimens") {
          conditions.enable.push("COSD Form, Specify Adult 1st line ART Regimen");
          conditions.disable.push("COSD Form, Specify Adult 2nd line ART Regimen");

     }
     else if (conditionConcept =="Adult 2nd line ART Regimens")
     {
          conditions.enable.push("COSD Form, Specify Adult 2nd line ART Regimen");
          conditions.disable.push("COSD Form, Specify Adult 1st line ART Regimen");
     }
     else
     {
          conditions.disable.push("COSD Form, Specify Adult 1st line ART Regimen","COSD Form, Specify Adult 2nd line ART Regimen");
     }
          return conditions;
  },
    "COSD Form, Previous ART Regimens (allow for multiple entries)": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['COSD Form, Previous ART Regimens (allow for multiple entries)'];
     if (conditionConcept.indexOf("Adult 1st line ART Regimens") >=0 && !(conditionConcept.indexOf("Adult 2nd line ART Regimens") >=0))
        {
          conditions.enable.push("COSD FORM, Previous Regimen Specify Adult 1st line ART Regimen");
          conditions.disable.push("COSD Form, Previous Regimen Specify Adult 2nd line ART Regimen");

        }
     else if (conditionConcept.indexOf("Adult 2nd line ART Regimens") >=0 && !(conditionConcept.indexOf("Adult 1st line ART Regimens") >=0) )
        {
        conditions.enable.push("COSD Form, Previous Regimen Specify Adult 2nd line ART Regimen");
        conditions.disable.push("COSD FORM, Previous Regimen Specify Adult 1st line ART Regimen");

        }

    else if (conditionConcept.indexOf("Adult 1st line ART Regimens") >=0 && conditionConcept.indexOf("Adult 2nd line ART Regimens") >=0)
     {
        conditions.enable.push("COSD FORM, Previous Regimen Specify Adult 1st line ART Regimen","COSD Form, Previous Regimen Specify Adult 2nd line ART Regimen");
     }

     else
     {
       conditions.disable.push("COSD FORM, Previous Regimen Specify Adult 1st line ART Regimen","COSD Form, Previous Regimen Specify Adult 2nd line ART Regimen");
     }
          return conditions;
  },
    "COSD Form, Visit Type": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['COSD Form, Visit Type'];
     if (conditionConcept =="D = Community ART refill group member (CARG)") {
          conditions.enable.push("COSD Form, Name of CARG","COSD Form, Name of CARG Leader");

     }
     else
     {
          conditions.disable.push("COSD Form, Name of CARG","COSD Form, Name of CARG Leader");
     }
          return conditions;
  },
    "COSD, Disclosure Done": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['COSD, Disclosure Done'];
     if (conditionConcept =="Yes") {
          conditions.enable.push("COSD, If Yes for Disclosure Done");

     }
     else
     {
          conditions.disable.push("COSD, If Yes for Disclosure Done");
     }
          return conditions;
  },
    "COSD, If Yes for Disclosure Done": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['COSD, If Yes for Disclosure Done'];
     if (conditionConcept.indexOf("Other (specify)") >=0) {
          conditions.enable.push("COSD, If others for Yes for Disclosure Done");

     }
     else
     {
          conditions.disable.push("COSD, If others for Yes for Disclosure Done");
     }
          return conditions;
  },
    "COSD, Are you a member of any support group?": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['COSD, Are you a member of any support group?'];
     if (conditionConcept =="Yes") {
          conditions.enable.push("COSD, Name of support group","COSD, Support group leader","COSD, How many times did you meet in the last 3 months?","COSD, Do you have the HIV Literacy Manual to guide the discussions in the support group?");
          conditions.disable.push("COSD, Why Not?","COSD, Would you like to be linked to any support group?");

     }
     else if (conditionConcept =="No")
     {
          conditions.enable.push("COSD, Why Not?","COSD, Would you like to be linked to any support group?");
          conditions.disable.push("COSD, Name of support group","COSD, Support group leader","COSD, How many times did you meet in the last 3 months?","COSD, Do you have the HIV Literacy Manual to guide the discussions in the support group?");
     }
     else {
        conditions.disable.push("COSD, Name of support group","COSD, Support group leader","COSD, How many times did you meet in the last 3 months?","COSD, Do you have the HIV Literacy Manual to guide the discussions in the support group?","COSD, Why Not?","COSD, Would you like to be linked to any support group?");
     }
          return conditions;
  },
    "COSD, Why Not?": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['COSD, Why Not?'];
     if (conditionConcept =="Others") {
          conditions.enable.push("COSD, Others for why not");

     }
     else
     {
          conditions.disable.push("COSD, Others for why not");
     }
          return conditions;
  },
    "COSD, Would you like to be linked to any support group?": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['COSD, Would you like to be linked to any support group?'];
     if (conditionConcept =="Yes") {
          conditions.enable.push("COSD, If Yes for linked to any support group");

     }
     else
     {
          conditions.disable.push("COSD, If Yes for linked to any support group");
     }
          return conditions;
  },
    "COSD, Do you have any health problems today?": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['COSD, Do you have any health problems today?'];
     if (conditionConcept =="Yes") {
          conditions.enable.push("COSD, If yes for any health problems");

     }
     else
     {
          conditions.disable.push("COSD, If yes for any health problems");
     }
          return conditions;
  },
    "COSD, Any health problems since the last ART refill?": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['COSD, Any health problems since the last ART refill?'];
     if (conditionConcept =="Yes") {
          conditions.enable.push("COSD, If yes for any health problems since the last ART refill");

     }
     else
     {
          conditions.disable.push("COSD, If yes for any health problems since the last ART refill");
     }
          return conditions;
  },
    "COSD, Are you coughing?": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['COSD, Are you coughing?'];
     if (conditionConcept =="Yes") {
          conditions.enable.push("COSD, If yes for coughing then how long?");

     }
     else
     {
          conditions.disable.push("COSD, If yes for coughing then how long?");
     }
          return conditions;
  },
    "COSD, Have you lost weight?": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['COSD, Have you lost weight?'];
     if (conditionConcept =="Yes") {
          conditions.enable.push("COSD, If yes for lost weight then select");

     }
     else
     {
          conditions.disable.push("COSD, If yes for lost weight then select");
     }
          return conditions;
  },
    "COSD, Any other chronic illnesses (NCDs)": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['COSD, Any other chronic illnesses (NCDs)'];
     if (conditionConcept =="Yes") {
          conditions.enable.push("COSD, If yes for any other chronic illnessess");

     }
     else
     {
          conditions.disable.push("COSD, If yes for any other chronic illnessess");
     }
          return conditions;
  },
    "COSD, If yes for any other chronic illnessess": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['COSD, If yes for any other chronic illnessess'];
        if (conditionConcept.indexOf("Others") >=0) {
            conditions.enable.push("COSD, If others for yes for any other chronic illnessess");
        } else {
            conditions.disable.push("COSD, If others for yes for any other chronic illnessess");
        }
        return conditions;
        },
    "COSD, Have you ever been screened for cervical cancer?": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['COSD, Have you ever been screened for cervical cancer?'];
     if (conditionConcept =="Yes") {
          conditions.enable.push("COSD, If yes for even been screened for cervical cancer then when was last screening done");

     }
     else
     {
          conditions.disable.push("COSD, If yes for even been screened for cervical cancer then when was last screening done");
     }
          return conditions;
  },
    "COSD, Referred to health facility": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['COSD, Referred to health facility'];
     if (conditionConcept =="Yes") {
          conditions.enable.push("COSD, If yes for referred to health facility then specify");

     }
     else
     {
          conditions.disable.push("COSD, If yes for referred to health facility then specify");
     }
          return conditions;
  },
    "COSD, If yes for referred to health facility then specify": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['COSD, If yes for referred to health facility then specify'];
     if (conditionConcept.indexOf("Others") >=0) {
          conditions.enable.push("COSD, If others for yes for referred to health facility");

     }
     else
     {
          conditions.disable.push("COSD, If others for yes for referred to health facility");
     }
          return conditions;
  },
     "FP Continuation, State reason for removal": function(formName, formFieldValues) {
         var conditions = {enable: [], disable: [], show: [], hide: []};
         var conditionConcept = formFieldValues['FP Continuation, State reason for removal'];
         if (conditionConcept == "FPS FORM,Health concerns" || conditionConcept == "FPS FORM,Complications")
         {
              conditions.show.push("FP Continuation, State the health concerns and complications");

         }
         else
         {
              conditions.hide.push("FP Continuation, State the health concerns and complications");
             }
              return conditions;
      },
      "FP Continuation, State the health concerns and complications": function(formName, formFieldValues) {
         var conditions = {show: [], hide: []};
         var conditionConcept = formFieldValues['FP Continuation, State the health concerns and complications'];
         if (conditionConcept == "Side effects") {
              conditions.show.push("FP Continuation If side effects, specify details");

         }
         else
         {
              conditions.hide.push("FP Continuation If side effects, specify details");
         }
          return conditions;
},
    "FPS Form,Site Type": function(formName, formFieldValues) {
     var conditions = {show: [], hide: []};
     var conditionConcept = formFieldValues['FPS Form,Site Type'];
     if (conditionConcept =="Outreach") {
          conditions.show.push("FPS, District");

     }
     else
     {
          conditions.hide.push("FPS, District");
     }
          return conditions;
  },
    "Prep Init Form, Have you had an HIV test in the past 1 week?": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['Prep Init Form, Have you had an HIV test in the past 1 week?'];
     if (conditionConcept =="Yes") {
          conditions.enable.push("Prep Init Form, When was the test done?","Prep Init Form, What was the result?");

     }
     else
     {
          conditions.disable.push("Prep Init Form, When was the test done?","Prep Init Form, What was the result?");
     }
          return conditions;
  },
    "Prep Init Form, Do you have any heath related problems today?": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['Prep Init Form, Do you have any heath related problems today?'];
     if (conditionConcept =="Yes") {
          conditions.enable.push("Prep Init Form, If Yes for health related problems today");

     }
     else
     {
          conditions.disable.push("Prep Init Form, If Yes for health related problems today");
     }
          return conditions;
  },
    "Prep Init Form, Have you been diagnosed of any chronic illness?": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['Prep Init Form, Have you been diagnosed of any chronic illness?'];
     if (conditionConcept.indexOf("Other") >=0) {
          conditions.enable.push("Prep Init Form, If other for diagnosed for any clinic illness");

     }
     else
     {
          conditions.disable.push("Prep Init Form, If other for diagnosed for any clinic illness");
     }
          return conditions;
  },
    "Prep Init Form, Pregnacy test done?": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['Prep Init Form, Pregnacy test done?'];
     if (conditionConcept =="Yes") {
          conditions.enable.push("Prep Init Form, Pregnancy test What was the result?");

     }
     else
     {
          conditions.disable.push("Prep Init Form, Pregnancy test What was the result?");
     }
          return conditions;
  },
    "Prep Init Form, Are you or your partner using any contraception?": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['Prep Init Form, Are you or your partner using any contraception?'];
     if (conditionConcept.indexOf("Other") >=0) {
          conditions.enable.push("Prep Init Form, If Other for Are you or your partner using any contraception?");

     }
     else
     {
          conditions.disable.push("Prep Init Form, If Other for Are you or your partner using any contraception?");
     }
          return conditions;
  },
    "Prep Init Form, Are you taking any drugs or medications?": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['Prep Init Form, Are you taking any drugs or medications?'];
     if (conditionConcept.indexOf("Other") >=0) {
          conditions.enable.push("Prep Init Form, If other for taking any drugs or medications?");

     }
     else
     {
          conditions.disable.push("Prep Init Form, If other for taking any drugs or medications?");
     }
          return conditions;
  },
    "Prep Init Form, Are you sexually active?": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['Prep Init Form, Are you sexually active?'];
     if (conditionConcept =="Yes") {
          conditions.enable.push("Prep Init Form, Are you married or in a stable relationship for the past 6 months and above?","Prep Init Form, Do you have more than 1 sexual partner?","Prep Init Form, Are you single or not in a stable relationship?");

     }
     else
     {
          conditions.disable.push("Prep Init Form, Are you married or in a stable relationship for the past 6 months and above?","Prep Init Form, Do you have more than 1 sexual partner?","Prep Init Form, Are you single or not in a stable relationship?");
     }
          return conditions;
  },

    "Prep Init Form, Are you married or in a stable relationship for the past 6 months and above?": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['Prep Init Form, Are you married or in a stable relationship for the past 6 months and above?'];
     if (conditionConcept =="Yes") {
          conditions.enable.push("Prep Init Form, Do you know your partner's HIV status?","Prep Init Form, Do you use condoms every time you have sex with your partner?","Prep Init Form, Have you had any other sexual partners in the last 6 months?");

     }
     else
     {
          conditions.disable.push("Prep Init Form, Do you know your partner's HIV status?","Prep Init Form, Do you use condoms every time you have sex with your partner?","Prep Init Form, Have you had any other sexual partners in the last 6 months?");
     }
          return conditions;
  },
   "Prep Init Form, Do you know your partner's HIV status?": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues["Prep Init Form, Do you know your partner's HIV status?"];
     if (conditionConcept =="Positive") {
          conditions.enable.push("Prep Init Form, Is your partner on ART?");

     }
     else
     {
          conditions.disable.push("Prep Init Form, Is your partner on ART?");
     }
          return conditions;
  },
    "Prep Init Form, Is your partner on ART?": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['Prep Init Form, Is your partner on ART?'];
     if (conditionConcept =="Yes") {
          conditions.enable.push("Prep Init Form, Do you know your partner's adherence to ART?","Prep Init Form, Has your partner had a viral load test done in the last 12 months?");

     }
     else
     {
          conditions.disable.push("Prep Init Form, Do you know your partner's adherence to ART?","Prep Init Form, Has your partner had a viral load test done in the last 12 months?");
     }
          return conditions;
  },
    "Prep Init Form, Has your partner had a viral load test done in the last 12 months?": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['Prep Init Form, Has your partner had a viral load test done in the last 12 months?'];
     if (conditionConcept =="Yes") {
          conditions.enable.push("Prep Init Form, If yes for partner had a viral load test done in the last 12 months?");

     }
     else
     {
          conditions.disable.push("Prep Init Form, If yes for partner had a viral load test done in the last 12 months?");
     }
          return conditions;
  },
    "Prep Init Form, Have you had any other sexual partners in the last 6 months?": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['Prep Init Form, Have you had any other sexual partners in the last 6 months?'];
     if (conditionConcept =="Yes") {
          conditions.enable.push("Prep Init Form, If yes for had any other sexual partners in the last 6 months?");

     }
     else
     {
          conditions.disable.push("Prep Init Form, If yes for had any other sexual partners in the last 6 months?");
     }
          return conditions;
  },
    "Prep Init Form, Do you have more than 1 sexual partner?": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['Prep Init Form, Do you have more than 1 sexual partner?'];
     if (conditionConcept =="Yes") {
          conditions.enable.push("Prep Init Form, Do you know your non-regular partner(s) HIV status?","Prep Init Form, Do you use condoms every time you have sex with your non-regular partner?","Prep Init Form, Have you been treated for an STI in the last 3 months?","Prep Init Form, Have you exchanged sex for money, goods or services?","Prep Init Form, Do you have a history of sexual abuse/gender based violence?","Prep Init Form, Have you used emergency contraception in the last 6 months?","Prep Init Form, Have you used PEP in the last 6 months?");

     }
     else
     {
          conditions.disable.push("Prep Init Form, Do you know your non-regular partner(s) HIV status?","Prep Init Form, Do you use condoms every time you have sex with your non-regular partner?","Prep Init Form, Have you been treated for an STI in the last 3 months?","Prep Init Form, Have you exchanged sex for money, goods or services?","Prep Init Form, Do you have a history of sexual abuse/gender based violence?","Prep Init Form, Have you used emergency contraception in the last 6 months?","Prep Init Form, Have you used PEP in the last 6 months?");
     }
          return conditions;
  },
    "Prep Init Form, Do you know your non-regular partner(s) HIV status?": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['Prep Init Form, Do you know your non-regular partner(s) HIV status?'];
     if (conditionConcept =="Yes") {
          conditions.enable.push("Prep Init Form, Specify HIV status of partner");

     }
     else
     {
          conditions.disable.push("Prep Init Form, Specify HIV status of partner");
     }
          return conditions;
  },
    "Prep Init Form, Have you used PEP in the last 6 months?": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['Prep Init Form, Have you used PEP in the last 6 months?'];
     if (conditionConcept =="Yes") {
          conditions.enable.push("Prep Init Form, What was the reason for taking PEP?");

     }
     else
     {
          conditions.disable.push("Prep Init Form, What was the reason for taking PEP?");
     }
          return conditions;
  },
    "Prep Init Form, What was the reason for taking PEP?": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['Prep Init Form, What was the reason for taking PEP?'];
     if (conditionConcept.indexOf("Other") >=0) {
          conditions.enable.push("Prep Init Form, If Other for reason for taking PEP?");

     }
     else
     {
          conditions.disable.push("Prep Init Form, If Other for reason for taking PEP?");
     }
          return conditions;
  },
    "Prep Init Form, Are you single or not in a stable relationship?": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['Prep Init Form, Are you single or not in a stable relationship?'];
     if (conditionConcept =="Yes") {
          conditions.enable.push("Prep Init Form, Have you had sexual partner(s) in the last 6 months?","Prep Init Form, Do you use condoms every time you have vaginal or anal sex?","Prep Init Form, In a Single relationship Have you been treated for an STI in the last 3 months?","Prep Init Form, Have you had sex whilst indoxicated with alcohol or drugs?","Prep Init Form, Have you or your partner used emergency contraception in the last 6 months?","Prep Init Form, Single or Stable relationship, Have you used PEP in the last 6 months?");

     }
     else
     {
          conditions.disable.push("Prep Init Form, Have you had sexual partner(s) in the last 6 months?","Prep Init Form, Do you use condoms every time you have vaginal or anal sex?","Prep Init Form, In a Single relationship Have you been treated for an STI in the last 3 months?","Prep Init Form, Have you had sex whilst indoxicated with alcohol or drugs?","Prep Init Form, Have you or your partner used emergency contraception in the last 6 months?","Prep Init Form, Single or Stable relationship, Have you used PEP in the last 6 months?");
     }
          return conditions;
  },
  "Prep Init Form, Have you had sexual partner(s) in the last 6 months?": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['Prep Init Form, Have you had sexual partner(s) in the last 6 months?'];
     if (conditionConcept =="Yes") {
          conditions.enable.push("Prep Init Form, If Yes, How many?");

     }
     else
     {
          conditions.disable.push("Prep Init Form, If Yes, How many?");
     }
          return conditions;
  },
"Prep Init Form, Do you use condoms every time you have vaginal or anal sex?": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['Prep Init Form, Do you use condoms every time you have vaginal or anal sex?'];
     if (conditionConcept =="Yes") {
          conditions.enable.push("Prep Init Form, Have you had a condom burst in the last 3 month?");

     }
     else
     {
          conditions.disable.push("Prep Init Form, Have you had a condom burst in the last 3 month?");
     }
          return conditions;
  },
  "Prep Init Form, Have you had a condom burst in the last 3 month?": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['Prep Init Form, Have you had a condom burst in the last 3 month?'];
     if (conditionConcept =="Yes") {
          conditions.enable.push("Prep Init Form, If Yes for condorm burst, How many times?");

     }
     else
     {
          conditions.disable.push("Prep Init Form, If Yes for condorm burst, How many times?");
     }
          return conditions;
  },
  "Prep Init Form, In a Single relationship Have you been treated for an STI in the last 3 months?": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['Prep Init Form, In a Single relationship Have you been treated for an STI in the last 3 months?'];
     if (conditionConcept =="Yes") {
          conditions.enable.push("Prep Init Form, Females","Prep Init Form, Males");

     }
     else
     {
          conditions.disable.push("Prep Init Form, Females","Prep Init Form, Males");
     }
          return conditions;
  },
  "Prep Init Form, Females": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['Prep Init Form, Females'];
     if (conditionConcept.indexOf("Other") >=0) {
          conditions.enable.push("Prep Init Form, If other for Females");

     }
     else
     {
          conditions.disable.push("Prep Init Form, If other for Females");
     }
          return conditions;
  },
  "Prep Init Form, Males": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['Prep Init Form, Males'];
     if (conditionConcept.indexOf("Other") >=0) {
          conditions.enable.push("Prep Init Form, If other for Males");

     }
     else
     {
          conditions.disable.push("Prep Init Form, If other for Males");
     }
          return conditions;
  },
 "Prep Init Form, Have you or your partner used emergency contraception in the last 6 months?": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['Prep Init Form, Have you or your partner used emergency contraception in the last 6 months?'];
     if (conditionConcept =="Yes") {
          conditions.enable.push("Prep Init Form, If Yes for emergency contraception, How many times?");

     }
     else
     {
          conditions.disable.push("Prep Init Form, If Yes for emergency contraception, How many times?");
     }
          return conditions;
  },
   "Prep Init Form, Single or Stable relationship, Have you used PEP in the last 6 months?": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['Prep Init Form, Single or Stable relationship, Have you used PEP in the last 6 months?'];
     if (conditionConcept =="Yes") {
          conditions.enable.push("Prep Init Form, Single or Stable relationship, What was the reason for taking PEP?");

     }
     else
     {
          conditions.disable.push("Prep Init Form, Single or Stable relationship, What was the reason for taking PEP?");
     }
          return conditions;
  },
  "Prep Init Form, Single or Stable relationship, What was the reason for taking PEP?": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['Prep Init Form, Single or Stable relationship, What was the reason for taking PEP?'];
     if (conditionConcept.indexOf("Other") >=0) {
          conditions.enable.push("Prep Init Form, Single or Stable relationship, If Other, Specify");

     }
     else
     {
          conditions.disable.push("Prep Init Form, Single or Stable relationship, If Other, Specify");
     }
          return conditions;
  },
  "Prep Init Form, Any signs of primary infection?": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['Prep Init Form, Any signs of primary infection?'];
     if (conditionConcept =="Yes") {
          conditions.enable.push("Prep Init Form, If Yes for Any signs of primary infection?");

     }
     else
     {
          conditions.disable.push("Prep Init Form, If Yes for Any signs of primary infection?");
     }
          return conditions;
  },
  "Prep Init Form, If Yes for Any signs of primary infection?": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['Prep Init Form, If Yes for Any signs of primary infection?'];
     if (conditionConcept.indexOf("Other") >=0) {
          conditions.enable.push("Prep Init Form, If yes for other primary infection");

     }
     else
     {
          conditions.disable.push("Prep Init Form, If yes for other primary infection");
     }
          return conditions;
  },
  "Prep Init Form, Are you ready to start Prep?": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['Prep Init Form, Are you ready to start Prep?'];
     if (conditionConcept =="No") {
          conditions.enable.push("Prep Init Form, If yes for ready to start Prep?, Specify Reason");

     }
     else
     {
          conditions.disable.push("Prep Init Form, If yes for ready to start Prep?, Specify Reason");
     }
          return conditions;
  },
  "Prep Init Form, If yes for ready to start Prep?, Specify Reason": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['Prep Init Form, If yes for ready to start Prep?, Specify Reason'];
     if (conditionConcept.indexOf("Other") >=0) {
          conditions.enable.push("Prep Init Form, If Other for specify reason for ready to start PrEP");

     }
     else
     {
          conditions.disable.push("Prep Init Form, If Other for specify reason for ready to start PrEP");
     }
          return conditions;
  },
  "Prep Init Form, Is the client Eligible to take PrEP?": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['Prep Init Form, Is the client Eligible to take PrEP?'];
     if (conditionConcept =="Yes") {
          conditions.enable.push("Prep Init Form, Is the client Eligible to take PrEP?, Males","Prep Init Form, Is the client Eligible to take PrEP?, Females");

     }
     else
     {
          conditions.disable.push("Prep Init Form, Is the client Eligible to take PrEP?, Males","Prep Init Form, Is the client Eligible to take PrEP?, Females");
     }
          return conditions;
  },
   "Prep Init Form, Is the client Eligible to take PrEP?, Males": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['Prep Init Form, Is the client Eligible to take PrEP?, Males'];
     if (conditionConcept =="Other") {
          conditions.enable.push("Prep Init Form, Is the client Eligible to take PrEP?, Males Other");

     }
     else
     {
          conditions.disable.push("Prep Init Form, Is the client Eligible to take PrEP?, Males Other");
     }
          return conditions;
  },
  "Prep Init Form, Is the client Eligible to take PrEP?, Females": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['Prep Init Form, Is the client Eligible to take PrEP?, Females'];
     if (conditionConcept =="Other") {
          conditions.enable.push("Prep Init Form, Is the client Eligible to take PrEP?, Females Other");

     }
     else
     {
          conditions.disable.push("Prep Init Form, Is the client Eligible to take PrEP?, Females Other");
     }
          return conditions;
  },
  "Prep Cont Form, Do you have any heath related problems today?": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['Prep Cont Form, Do you have any heath related problems today?'];
     if (conditionConcept =="Yes") {
          conditions.enable.push("Prep Cont Form, If Yes for health related problems today");

     }
     else
     {
          conditions.disable.push("Prep Cont Form, If Yes for health related problems today");
     }
          return conditions;
  },
  "Prep Cont Form, Are you using any family planning method?": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['Prep Cont Form, Are you using any family planning method?'];
     if (conditionConcept =="Yes") {
          conditions.enable.push("Prep Cont Form, If yes for are you using any family planning method?");

     }
     else
     {
          conditions.disable.push("Prep Cont Form, If yes for are you using any family planning method?");
     }
          return conditions;
  },
  "Prep Cont Form, If yes for are you using any family planning method?": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['Prep Cont Form, If yes for are you using any family planning method?'];
     if (conditionConcept.indexOf("Other") >=0) {
          conditions.enable.push("Prep Cont Form, If Other for using any family planning method");

     }
     else
     {
          conditions.disable.push("Prep Cont Form, If Other for using any family planning method");
     }
          return conditions;
  },
  "Prep Cont Form, Are you using any other medications?": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['Prep Cont Form, Are you using any other medications?'];
     if (conditionConcept =="Yes") {
          conditions.enable.push("Prep Cont Form, If Yes for Are you using any other medications?");

     }
     else
     {
          conditions.disable.push("Prep Cont Form, If Yes for Are you using any other medications?");
     }
          return conditions;
  },
  "Prep Cont Form, If Yes for Are you using any other medications?": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['Prep Cont Form, If Yes for Are you using any other medications?'];
     if (conditionConcept.indexOf("Other") >=0) {
          conditions.enable.push("Prep Cont Form, If other for using any other medications");

     }
     else
     {
          conditions.disable.push("Prep Cont Form, If other for using any other medications");
     }
          return conditions;
  },
  "Prep Cont Form, Do you know your partner's HIV status?": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues["Prep Cont Form, Do you know your partner's HIV status?"];
     if (conditionConcept =="Yes") {
          conditions.enable.push("Prep Cont Form, If Yes for Do you know your partner's HIV status?");

     }
     else
     {
          conditions.disable.push("Prep Cont Form, If Yes for Do you know your partner's HIV status?");
     }
          return conditions;
  },
  "Prep Cont Form, If Yes for Do you know your partner's HIV status?": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues["Prep Cont Form, If Yes for Do you know your partner's HIV status?"];
     if (conditionConcept =="Positive") {
          conditions.enable.push("Prep Cont Form, Is your partner on ART?");

     }
     else
     {
          conditions.disable.push("Prep Cont Form, Is your partner on ART?");
     }
          return conditions;
  },
  "Prep Cont Form, Is your partner on ART?": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['Prep Cont Form, Is your partner on ART?'];
     if (conditionConcept =="Yes") {
          conditions.enable.push("Prep Cont Form, Do you know your partner's viral load?");

     }
     else
     {
          conditions.disable.push("Prep Cont Form, Do you know your partner's viral load?");
     }
          return conditions;
  },
  "Prep Cont Form, Do you know your partner's viral load?": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues["Prep Cont Form, Do you know your partner's viral load?"];
     if (conditionConcept =="Yes") {
          conditions.enable.push("Prep Cont Form, If Yes for Do you know your partner's viral load");

     }
     else
     {
          conditions.disable.push("Prep Cont Form, If Yes for Do you know your partner's viral load");
     }
          return conditions;
  },
  "Prep Cont Form, Are you using condoms every time you are having sex?": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['Prep Cont Form, Are you using condoms every time you are having sex?'];
     if (conditionConcept =="Yes") {
          conditions.enable.push("Prep Cont Form, Have you had a condom burst since the last visit?");

     }
     else
     {
          conditions.disable.push("Prep Cont Form, Have you had a condom burst since the last visit?");
     }
          return conditions;
  },
  "Prep Cont Form, Have you had a condom burst since the last visit?": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['Prep Cont Form, Have you had a condom burst since the last visit?'];
     if (conditionConcept =="Yes") {
          conditions.enable.push("Prep Cont Form, If yes for condom burst since the last visit?");

     }
     else
     {
          conditions.disable.push("Prep Cont Form, If yes for condom burst since the last visit?");
     }
          return conditions;
  },
  "Prep Cont Form, Have you been treated for an STI since the last visit?": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['Prep Cont Form, Have you been treated for an STI since the last visit?'];
     if (conditionConcept =="Yes") {
          conditions.enable.push("Prep Cont Form, Treated for STI since last visit Females","Prep Cont Form, Treated for STI since last visit Males");

     }
     else
     {
          conditions.disable.push("Prep Cont Form, Treated for STI since last visit Females","Prep Cont Form, Treated for STI since last visit Males");
     }
          return conditions;
  },
  "Prep Cont Form, Treated for STI since last visit Females": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['Prep Cont Form, Treated for STI since last visit Females'];
     if (conditionConcept.indexOf("Other") >=0) {
          conditions.enable.push("Prep Cont Form, If other for Treated for STI since last visit Females");

     }
     else
     {
          conditions.disable.push("Prep Cont Form, If other for Treated for STI since last visit Females");
     }
          return conditions;
  },
  "Prep Cont Form, Treated for STI since last visit Males": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['Prep Cont Form, Treated for STI since last visit Males'];
     if (conditionConcept.indexOf("Other") >=0) {
          conditions.enable.push("Prep Cont Form, If other for Treated for STI since last visit Males");

     }
     else
     {
          conditions.disable.push("Prep Cont Form, If other for Treated for STI since last visit Males");
     }
          return conditions;
  },
  "Prep Cont Form, Have you used emergency contraception since the last visit?": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['Prep Cont Form, Have you used emergency contraception since the last visit?'];
     if (conditionConcept =="Yes") {
          conditions.enable.push("Prep Cont Form, If Yes for used emergency contraception since the last visit?");

     }
     else
     {
          conditions.disable.push("Prep Cont Form, If Yes for used emergency contraception since the last visit?");
     }
          return conditions;
  },
  "Prep Cont Form, Does the client have any sings of primary infection?": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['Prep Cont Form, Does the client have any sings of primary infection?'];
     if (conditionConcept =="Yes") {
          conditions.enable.push("Prep Cont Form, If Yes for client have any sings of primary infection?");

     }
     else
     {
          conditions.disable.push("Prep Cont Form, If Yes for client have any sings of primary infection?");
     }
          return conditions;
  },
  "Prep Cont Form, If Yes for client have any sings of primary infection?": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['Prep Cont Form, If Yes for client have any sings of primary infection?'];
     if (conditionConcept.indexOf("Other") >=0) {
          conditions.enable.push("Prep Cont Form, If Other for yes for client have any sings of primary infection?");

     }
     else
     {
          conditions.disable.push("Prep Cont Form, If Other for yes for client have any sings of primary infection?");
     }
          return conditions;
  },
  "Prep Cont Form, Are you ready to continue PrEP?": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['Prep Cont Form, Are you ready to continue PrEP?'];
     if (conditionConcept =="No") {
          conditions.enable.push("Prep Cont Form, If No for Are you ready to continue PrEP?");

     }
     else
     {
          conditions.disable.push("Prep Cont Form, If No for Are you ready to continue PrEP?");
     }
          return conditions;
  },
  "Prep Cont Form, If No for Are you ready to continue PrEP?": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['Prep Cont Form, If No for Are you ready to continue PrEP?'];
     if (conditionConcept.indexOf("Other") >=0) {
          conditions.enable.push("Prep Cont Form, If Other for No for Are you ready to continue PrEP?");

     }
     else
     {
          conditions.disable.push("Prep Cont Form, If Other for No for Are you ready to continue PrEP?");
     }
          return conditions;
  },
  "Prep Cont Form, Is the client eligible to continue PrEP?": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['Prep Cont Form, Is the client eligible to continue PrEP?'];
     if (conditionConcept =="Yes") {
          conditions.enable.push("Prep Cont Form, If Yes for the client eligible to continue PrEP? Males","Prep Cont Form, If Yes for the client eligible to continue PrEP? Females");

     }
     else
     {
          conditions.disable.push("Prep Cont Form, If Yes for the client eligible to continue PrEP? Males","Prep Cont Form, If Yes for the client eligible to continue PrEP? Females");
     }
          return conditions;
  },
  "Prep Cont Form, Has the client defaulted treatment for more than 28 days?": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['Prep Cont Form, Has the client defaulted treatment for more than 28 days?'];
     if (conditionConcept =="Yes") {
          conditions.enable.push("Prep Cont Form, Date of Reinitiation");

     }
     else
     {
          conditions.disable.push("Prep Cont Form, Date of Reinitiation");
     }
          return conditions;
  },
  "Prep Cont Form, If Yes for the client eligible to continue PrEP? Males": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['Prep Cont Form, If Yes for the client eligible to continue PrEP? Males'];
     if (conditionConcept =="Other") {
          conditions.enable.push("Prep Cont Form, If Other for client eligible to continue PrEP? Males");

     }
     else
     {
          conditions.disable.push("Prep Cont Form, If Other for client eligible to continue PrEP? Males");
     }
          return conditions;
  },
  "Prep Cont Form, If Yes for the client eligible to continue PrEP? Females": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['Prep Cont Form, If Yes for the client eligible to continue PrEP? Females'];
     if (conditionConcept =="Other") {
          conditions.enable.push("Prep Cont Form, If Other for client eligible to continue PrEP? Females");

     }
     else
     {
          conditions.disable.push("Prep Cont Form, If Other for client eligible to continue PrEP? Females");
     }
          return conditions;
  },

  "Prep Init Form, Site Type": function(formName, formFieldValues) {
     var conditions = {show: [], hide: []};
     var conditionConcept = formFieldValues['Prep Init Form, Site Type'];
     if (conditionConcept =="Outreach") {
          conditions.show.push("Prep Init Form, District");

     }
     else
     {
          conditions.hide.push("Prep Init Form, District");
     }
          return conditions;
  },
  "Prep Cont Form, Site Type": function(formName, formFieldValues) {
     var conditions = {show: [], hide: []};
     var conditionConcept = formFieldValues['Prep Cont Form, Site Type'];
     if (conditionConcept =="Outreach") {
          conditions.show.push("Prep Cont Form, District");

     }
     else
     {
          conditions.hide.push("Prep Cont Form, District");
     }
          return conditions;
  },
    "Viac Form, Site Type": function(formName, formFieldValues) {
     var conditions = {show: [], hide: []};
     var conditionConcept = formFieldValues['Viac Form, Site Type'];
     if (conditionConcept =="Outreach") {
          conditions.show.push("Viac Form, District");
     }
     else
     {
          conditions.hide.push("Viac Form, District");
     }
      return conditions;
   },

    "Viac Form, TYPE OF VISIT": function (formName, formFieldValues) {
      var conditions = {enable: [], disable: []};
      var conditionConcept = formFieldValues['Viac Form, TYPE OF VISIT'];
      if (conditionConcept == "Viac Form, Repeat") {

          conditions.disable.push("Viac Form, Review after Specify details");
          conditions.disable.push("Viac Form, Treatment Specify treatment");
          conditions.enable.push("Viac Form, Repeat Specify period");
      }
      else if (conditionConcept == "Viac Form, Treatment")
      {
          conditions.enable.push("Viac Form, Treatment Specify treatment");
          conditions.disable.push("Viac Form, Review after Specify details");
          conditions.disable.push("Viac Form, Repeat Specify period");
      }
      else if (conditionConcept == "Viac Form, Review after")
      {
        conditions.enable.push("Viac Form, Review after Specify details");
        conditions.disable.push("Viac Form, Treatment Specify treatment");
        conditions.disable.push("Viac Form, Repeat Specify period");
      }
      else
      {
          conditions.disable.push("Viac Form, Repeat Specify period","Viac Form, Treatment Specify treatment","Viac Form, Review after Specify details");
      }
      return conditions;
    },
    "Viac Form, PRESENTING COMPLAINTS": function(formName, formFieldValues) {
       var conditions = {enable: [], disable: []};
       var conditionConcept = formFieldValues['Viac Form, PRESENTING COMPLAINTS'];
       if (conditionConcept =="Yes") {
            conditions.enable.push("Viac Form, PRESENTING COMPLAINTS Specify details");

       }
       else
       {
            conditions.disable.push("Viac Form, PRESENTING COMPLAINTS Specify details");
       }
            return conditions;
       },
      "Viac Form, PRESENTING COMPLAINTS Specify details": function(formName, formFieldValues) {
         var conditions = {enable: [], disable: []};
         var conditionConcept = formFieldValues['Viac Form, PRESENTING COMPLAINTS Specify details'];
         if (conditionConcept.indexOf("Other") >=0) {
              conditions.enable.push("Viac Form, PRESENTING COMPLAINTS If Other Specify details");

         }
         else
         {
              conditions.disable.push("Viac Form, PRESENTING COMPLAINTS If Other Specify details");
         }
              return conditions;
      },
    "Viac Form, EVER TREATED FOR STIS": function(formName, formFieldValues) {
     var conditions = {enable: [], disable: []};
     var conditionConcept = formFieldValues['Viac Form, EVER TREATED FOR STIS'];
     if (conditionConcept =="Yes") {
          conditions.enable.push("Viac Form, EVER TREATED FOR STIS Specify details");

     }
     else
     {
          conditions.disable.push("Viac Form, EVER TREATED FOR STIS Specify details");
     }
          return conditions;
     },
     "Viac Form, EVER TREATED FOR STIS Specify details": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Viac Form, EVER TREATED FOR STIS Specify details'];
        if (conditionConcept.indexOf("Other") >=0) {
             conditions.enable.push("Viac Form, EVER TREATED FOR STIS If Other Specify details");

        }
        else
        {
             conditions.disable.push("Viac Form, EVER TREATED FOR STIS If Other Specify details");
        }
             return conditions;
      },
      "Viac Form, Have you ever used COC": function(formName, formFieldValues) {
       var conditions = {enable: [], disable: []};
       var conditionConcept = formFieldValues['Viac Form, Have you ever used COC'];
       if (conditionConcept == "Yes") {
            conditions.enable.push("Viac Form, COC For how many years?");
       }
       else
       {
            conditions.disable.push("Viac Form, COC For how many years?");
       }
            return conditions;
       },
       "Viac Form, History of smoking": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Viac Form, History of smoking'];
        if (conditionConcept == "Yes") {
             conditions.enable.push("Viac Form, Smoking For how many years");
        }
        else
        {
             conditions.disable.push("Viac Form, Smoking For how many years");
        }
             return conditions;
        },
        "Viac Form, Current Medication for Chronic conditions" : function (formName, formFieldValues) {
          var conditions = {enable: [], disable: []};
          var statusProphylaxieType = formFieldValues['Viac Form, Current Medication for Chronic conditions'];

        if (statusProphylaxieType == "Yes") {

                conditions.enable.push("Viac Form, Chronic conditions Specify details");
            }
        else {

                conditions.disable.push("Viac Form, Chronic conditions Specify details");
             }
             return conditions;
       },
       "Viac Form, Chronic conditions Specify details": function(formName, formFieldValues) {
          var conditions = {enable: [], disable: []};
          var conditionConcept = formFieldValues['Viac Form, Chronic conditions Specify details'];
          if (conditionConcept.indexOf("Other") >=0) {
               conditions.enable.push("Viac Form, Chronic conditions If Other Specify details");

          }
          else
          {
               conditions.disable.push("Viac Form, Chronic conditions If Other Specify details");
          }
               return conditions;
        },
      "Viac Form, PRIOR CA CERVIX SCREENING IN LIFETIME": function(formName, formFieldValues) {
         var conditions = {enable: [], disable: []};
         var conditionConcept = formFieldValues['Viac Form, PRIOR CA CERVIX SCREENING IN LIFETIME'];
         if (conditionConcept =="Yes") {
              conditions.enable.push("Viac Form, When were you last screened?","Viac Form, Method used in your last screen");
         }
         else
         {
              conditions.disable.push("Viac Form, When were you last screened?","Viac Form, Method used in your last screen");
         }
              return conditions;
         },
         "Viac Form, SCREENING METHOD USED On This Visit": function(formName, formFieldValues) {
            var conditions = {enable: [], disable: []};
            var conditionConcept = formFieldValues['Viac Form, SCREENING METHOD USED On This Visit'];
            if (conditionConcept =="Viac Form, HPV DNA") {
                 conditions.enable.push("Viac Form, Specimen collected by");
            }
            else
            {
                 conditions.disable.push("Viac Form, Specimen collected by");
            }
                 return conditions;
          },
          "Viac Form, RESULT": function(formName, formFieldValues) {
             var conditions = {enable: [], disable: []};
             var conditionConcept = formFieldValues['Viac Form, RESULT'];
             if (conditionConcept =="Positive") {
                  conditions.enable.push("Viac Form, Intervention");
             }
             else
             {
                  conditions.disable.push("Viac Form, Intervention");
             }
                  return conditions;
           },
           "Viac Form, OTHER PATHOLOGICAL LESIONS SEEN": function(formName, formFieldValues) {
              var conditions = {enable: [], disable: []};
              var conditionConcept = formFieldValues['Viac Form, OTHER PATHOLOGICAL LESIONS SEEN'];
              if (conditionConcept.indexOf("Other") >=0) {
                   conditions.enable.push("Viac Form, PATHOLOGICAL LESIONS SEEN If Other Specify details");

              }
              else
              {
                   conditions.disable.push("Viac Form, PATHOLOGICAL LESIONS SEEN If Other Specify details");
              }
                   return conditions;
            },
           "Viac Form, TREATMENT GIVEN": function(formName, formFieldValues) {
              var conditions = {enable: [], disable: []};
              var conditionConcept = formFieldValues['Viac Form, TREATMENT GIVEN'];
              if (conditionConcept =="Yes") {
                   conditions.enable.push("Viac Form, TREATMENT GIVEN Specify details");
              }
              else
              {
                   conditions.disable.push("Viac Form, TREATMENT GIVEN Specify details");
              }
                   return conditions;
            },
            "Viac Form, Client Referred": function(formName, formFieldValues) {
               var conditions = {enable: [], disable: []};
               var conditionConcept = formFieldValues['Viac Form, Client Referred'];
               if (conditionConcept =="Yes") {
                    conditions.enable.push("Viac Form, Referred to");
                    conditions.enable.push("Viac Form, referred for Public Sector");
                    conditions.enable.push("Viac Form, referred for PVT sector");
                    conditions.enable.push("Viac Form, referred for Other NSC");
               }
               else
               {
                 conditions.disable.push("Viac Form, Referred to");
                 conditions.disable.push("Viac Form, referred for Public Sector");
                 conditions.disable.push("Viac Form, referred for PVT sector");
                 conditions.disable.push("Viac Form, referred for Other NSC");
               }
                    return conditions;
             },
             "Viac Form, referred for Public Sector": function(formName, formFieldValues) {
                var conditions = {enable: [], disable: []};
                var conditionConcept = formFieldValues['Viac Form, referred for Public Sector'];
                if (conditionConcept.indexOf("Other") >=0) {
                     conditions.enable.push("Viac Form, Referred for If Other Specify details");
                }
                else
                {
                     conditions.disable.push("Viac Form, Referred for If Other Specify details");
                }
                     return conditions;
              },
              "Viac Form, referred for PVT sector": function(formName, formFieldValues) {
                var conditions = {enable: [], disable: []};
                var conditionConcept = formFieldValues['Viac Form, referred for PVT sector'];
                if (conditionConcept.indexOf("Other") >=0) {
                     conditions.enable.push("Viac Form, Referred for If Other Specify details PVT Sector");
                }
                else
                {
                     conditions.disable.push("Viac Form, Referred for If Other Specify details PVT Sector");
                }
                     return conditions;
              },
              "Viac Form, referred for Other NSC": function(formName, formFieldValues) {
                var conditions = {enable: [], disable: []};
                var conditionConcept = formFieldValues['Viac Form, referred for Other NSC'];
                if (conditionConcept.indexOf("Other") >=0) {
                     conditions.enable.push("Viac Form, Referred for If Other Specify details Other NSC");
                }
                else
                {
                     conditions.disable.push("Viac Form, Referred for If Other Specify details Other NSC");
                }
                     return conditions;
              },
              "Viac Form, Complications/ Adverse events during procedure": function(formName, formFieldValues) {
                 var conditions = {enable: [], disable: []};
                 var conditionConcept = formFieldValues['Viac Form, Complications/ Adverse events during procedure'];
                 if (conditionConcept =="Yes") {
                      conditions.enable.push("Viac Form, Adverse events during procedure Specify details");
                 }
                 else
                 {
                      conditions.disable.push("Viac Form, Adverse events during procedure Specify details");
                 }
                      return conditions;
               },
               "Viac Form, Adverse events during procedure Specify details": function(formName, formFieldValues) {
                  var conditions = {enable: [], disable: []};
                  var conditionConcept = formFieldValues['Viac Form, Adverse events during procedure Specify details'];
                  if (conditionConcept.indexOf("Other") >=0) {
                       conditions.enable.push("Viac Form, Complications/ Adverse events during procedure , If Other Specify details");
                  }
                  else
                  {
                       conditions.disable.push("Viac Form, Complications/ Adverse events during procedure , If Other Specify details");
                  }
                       return conditions;
                },
                "Viac Form, Next appointment": function (formName, formFieldValues) {
                  var conditions = {enable: [], disable: []};
                  var conditionConcept = formFieldValues['Viac Form, Next appointment'];
                  if (conditionConcept == "Viac Form, REPEAT Screening")
                  {
                      conditions.disable.push("Viac Form, Answer REVIEW");
                      conditions.enable.push("Viac Form, Answer REPEAT Screening");
                  }
                  else if (conditionConcept == "Viac Form, REVIEW")
                  {
                      conditions.enable.push("Viac Form, Answer REVIEW");
                      conditions.disable.push("Viac Form, Answer REPEAT Screening");
                  }
                  else
                  {
                      conditions.disable.push("Viac Form, Answer REVIEW","Viac Form, Answer REPEAT Screening");
                  }
                  return conditions;
                },
                "Viac Form, Answer REPEAT Screening": function(formName, formFieldValues) {
                   var conditions = {enable: [], disable: []};
                   var conditionConcept = formFieldValues['Viac Form, Answer REPEAT Screening'];
                   if (conditionConcept=="Other") {
                        conditions.enable.push("Viac Form, Repeat Screening If Other Specify details");
                   }
                   else
                   {
                        conditions.disable.push("Viac Form, Repeat Screening If Other Specify details");
                   }
                        return conditions;
                 },
                 "Viac Form, Answer REVIEW": function(formName, formFieldValues) {
                    var conditions = {enable: [], disable: []};
                    var conditionConcept = formFieldValues['Viac Form, Answer REVIEW'];
                    if (conditionConcept=="Other") {
                         conditions.enable.push("Viac Form, REVIEW If Other Specify details");
                    }
                    else
                    {
                         conditions.disable.push("Viac Form, REVIEW If Other Specify details");
                    }
                         return conditions;
                  },
                 "PHTC, Index testing offered": function (formName, formFieldValues) {
                    var conditions = {show: [], hide: []};
                    var conditionConcept = formFieldValues['PHTC, Index testing offered'];

                    if (conditionConcept == "No") {
                        conditions.show.push("PHTC, Reasons not Offered");
                    }
                    else {
                         conditions.hide.push("PHTC, Reasons not Offered");
                    }
                    return conditions;
                    },
                 "PHTC, Index testing accepted": function (formName, formFieldValues) {
                    var conditions = {show: [], hide: []};
                    var conditionConcept = formFieldValues['PHTC, Index testing accepted'];

                    if (conditionConcept == "No") {
                        conditions.show.push("PHTC, Reasons not Accepted");
                    }
                    else {
                        conditions.hide.push("PHTC, Reasons not Accepted");
                    }
                    return conditions;
                    },
                 "PHTC, Site Type": function(formName, formFieldValues) {
                         var conditions = {show: [], hide: []};
                         var conditionConcept = formFieldValues['PHTC, Site Type'];
                         if (conditionConcept =="Outreach") {
                              conditions.show.push("PHTC, District");

                         }
                         else
                         {
                              conditions.hide.push("PHTC, District");
                         }
                              return conditions;
                      },
                "AIVC, Site Type": function(formName, formFieldValues) {
                         var conditions = {show: [], hide: []};
                         var conditionConcept = formFieldValues['AIVC, Site Type'];
                         if (conditionConcept =="Outreach") {
                              conditions.show.push("AIVC, District");

                         }
                         else
                         {
                              conditions.hide.push("AIVC, District");
                         }
                              return conditions;
                      },
            "FPS Continuation, Method Administered" : function (formName, formFieldValues) {
                      var conditions = {enable: [], disable: []};
                      var obj = formFieldValues['FPS Continuation, Method Administered'];
                      if (obj ==='FPS FORM,Projesterone only pill (POP)') {
                          conditions.enable.push("FP Cont Form, State POP Cycles");
                            }
                      else  {
                          conditions.disable.push("FP Cont Form, State POP Cycles");
                            }
                       if (obj ==='FPS FORM,Combined oral contaceptive (COC)') {
                          conditions.enable.push("FP Cont Form, State COC Cycles");
                            }
                      else  {
                          conditions.disable.push("FP Cont Form, State COC Cycles");
                            }
                          return conditions;
                     },

        "FP Initial Form, State Procedure": function (formName, formFieldValues) {
        var conditions = {show: [], hide: []};
        var conditionConcept = formFieldValues['FP Initial Form, State Procedure'];

        if (conditionConcept == "Insertion") {
            conditions.show.push("FP Init Form, Insertion Method");
            conditions.hide.push("FP Init Form, Removal Method");
            conditions.hide.push("FP Init Form, Insert/Remove Insertion Method");
            conditions.hide.push("FP Init Form, State reason for removal");
            conditions.hide.push("FP Init Form, Insert/Remove Removal Method");
            conditions.hide.push("FP Init Form, InsertRemove state reason for removal");

        }
        else if (conditionConcept == "Removal") {
            conditions.show.push("FP Init Form, Removal Method");
            conditions.show.push("FP Init Form, State reason for removal");
            conditions.hide.push("FP Init Form, Insertion Method");
            conditions.hide.push("FP Init Form, Insert/Remove Insertion Method");
            conditions.hide.push("FP Init Form, Insert/Remove Removal Method");
            conditions.hide.push("FP Init Form, InsertRemove state reason for removal");

        }
        else if (conditionConcept == "Insertion/Removal") {
            conditions.show.push("FP Init Form, Insert/Remove Insertion Method");
            conditions.show.push("FP Init Form, Insert/Remove Removal Method");
            conditions.show.push("FP Init Form, InsertRemove state reason for removal");
            conditions.hide.push("FP Init Form, Removal Method");
            conditions.hide.push("FP Init Form, Insertion Method");
            conditions.hide.push("FP Init Form, State reason for removal");

        }
        else {
            conditions.hide.push("FP Init Form, Insertion Method",
                                 "FP Init Form, Removal Method",
                                 "FP Init Form, Insert/Remove Insertion Method",
                                 "FP Init Form, Insert/Remove Removal Method",
                                 "FP Init Form, InsertRemove state reason for removal",
                                 "FP Init Form, State reason for removal");
        }
        return conditions;
    },
        "FP Cont Form, State reason for removal": function(formName, formFieldValues) {
         var conditions = {enable: [], disable: [], show: [], hide: []};
         var conditionConcept = formFieldValues['FP Cont Form, State reason for removal'];
         if (conditionConcept == "FPS FORM,Health concerns" || conditionConcept == "FPS FORM,Complications")
         {
              conditions.show.push("FP Cont Form, Insert/Remove State HealthConcernComplication");

         }
         else
         {
              conditions.hide.push("FP Cont Form, Insert/Remove State HealthConcernComplication");
             }
              return conditions;
      },
      "FP Cont Form, Insert/Remove State HealthConcernComplication": function(formName, formFieldValues) {
         var conditions = {show: [], hide: []};
         var conditionConcept = formFieldValues['FP Cont Form, Insert/Remove State HealthConcernComplication'];
         if (conditionConcept == "Side effects") {
              conditions.show.push("FP Cont Form, Insert/Remove Side effect Specify details");

         }
         else
         {
              conditions.hide.push("FP Cont Form, Insert/Remove Side effect Specify details");
         }
          return conditions;
},
    "PrEP ST Form, Are you in a Sero-discordant relationship?": function(formName, formFieldValues) {
     var conditions = {show: [], hide: []};
     var conditionConcept = formFieldValues['PrEP ST Form, Are you in a Sero-discordant relationship?'];
     if (conditionConcept =="Yes") {
          conditions.show.push("PrEP ST Form, If Yes, then Specify3");

     }
     else
     {
          conditions.hide.push("PrEP ST Form, If Yes, then Specify3");
     }
          return conditions;
  },
    "PrEP ST Form, Is the client eligible for PrEP": function(formName, formFieldValues) {
     var conditions = {show: [], hide: []};
     var conditionConcept = formFieldValues['PrEP ST Form, Is the client eligible for PrEP'];
     if (conditionConcept =="Yes") {
          conditions.show.push("PrEP ST Form, If Yes, then Specify4");
          conditions.show.push("PrEP ST Form, Has the client been referred for PrEP");

     }
     else
     {
          conditions.hide.push("PrEP ST Form, If Yes, then Specify4");
          conditions.hide.push("PrEP ST Form, Has the client been referred for PrEP");
     }
          return conditions;
  },
    "PrEP ST Form, Has the client been referred for PrEP": function(formName, formFieldValues) {
     var conditions = {show: [], hide: []};
     var conditionConcept = formFieldValues['PrEP ST Form, Has the client been referred for PrEP'];
     if (conditionConcept =="No") {
          conditions.show.push("PrEP ST Form, Reason(s) for not referring the client");

     }
     else
     {
          conditions.hide.push("PrEP ST Form, Reason(s) for not referring the client");
     }
          return conditions;
  },
    "PrEP ST Form, Does the client have a sex partner with one or more HIV risk factors": function(formName, formFieldValues) {
     var conditions = {show: [], hide: []};
     var conditionConcept = formFieldValues['PrEP ST Form, Does the client have a sex partner with one or more HIV risk factors'];
     if (conditionConcept =="Yes") {
          conditions.show.push("PrEP ST Form, If Yes, then Specify2");

     }
     else
     {
          conditions.hide.push("PrEP ST Form, If Yes, then Specify2");
     }
          return conditions;
  },
    "PrEP ST Form, Is the sexually active in a high prevalence / KP population in the last 6 months?": function(formName, formFieldValues) {
     var conditions = {show: [], hide: []};
     var conditionConcept = formFieldValues['PrEP ST Form, Is the sexually active in a high prevalence / KP population in the last 6 months?'];
     if (conditionConcept =="Yes") {
          conditions.show.push("PrEP ST Form, If Yes, then Specify1");

     }
     else
     {
          conditions.hide.push("PrEP ST Form, If Yes, then Specify1");
     }
          return conditions;
  },
    "PrEP ST Form, Has the client had vaginal or anal intercourse without condoms with more than 1 partner in the last 6 months?": function(formName, formFieldValues) {
     var conditions = {show: [], hide: []};
     var conditionConcept = formFieldValues['PrEP ST Form, Has the client had vaginal or anal intercourse without condoms with more than 1 partner in the last 6 months?'];
     if (conditionConcept =="Yes") {
          conditions.show.push("PrEP ST Form, How many sexual partners did you have vaginal or anal sex with?");
          conditions.show.push("PrEP ST Form, In the past 6 months, did you use condoms consistently during sex?");

     }
     else
     {
          conditions.hide.push("PrEP ST Form, How many sexual partners did you have vaginal or anal sex with?");
          conditions.hide.push("PrEP ST Form, In the past 6 months, did you use condoms consistently during sex?");
     }
          return conditions;
  },
    "PrEP ST Form, Is the Client HIV negative": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['PrEP ST Form, Is the Client HIV negative'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("PrEP ST Form, Date tested");

        } else {
            conditions.disable.push("PrEP ST Form, Date tested");
        }
        return conditions;
    },
    "PrEP ST Form, Is the client sexually active": function(formName, formFieldValues) {
        var conditions = {show: [], hide: []};
        var conditionConcept = formFieldValues['PrEP ST Form, Is the client sexually active'];
        if (conditionConcept == "Yes") {
            conditions.show.push("PrEP ST Form, Is the sexually active in a high prevalence / KP population in the last 6 months?");
            conditions.show.push("PrEP ST Form, Has the client had vaginal or anal intercourse without condoms with more than 1 partner in the last 6 months?");
            conditions.show.push("PrEP ST Form, Does the client have a sex partner with one or more HIV risk factors");
            conditions.show.push("PrEP ST Form, In the last 6 months has the client been treated for an STI by lab testing, self-reports, syndromic STI treatment");
            conditions.show.push("PrEP ST Form, In the last 6 months have you taken post-exposure prophylaxis (PEP) following a potential exposure to HIV?");
            conditions.show.push("PrEP ST Form, In the last 6 months have you used emergency contraception?");
            conditions.show.push("PrEP ST Form, In the last 6 months have you had sex while under the influence of alcohol?");
            conditions.show.push("PrEP ST Form, Are you in a Sero-discordant relationship?");
            conditions.show.push("PrEP ST Form, Do you have a partners of unknown status who refuse testing?");

        } else {
            conditions.hide.push("PrEP ST Form, Is the sexually active in a high prevalence / KP population in the last 6 months?");
            conditions.hide.push("PrEP ST Form, Has the client had vaginal or anal intercourse without condoms with more than 1 partner in the last 6 months?");
            conditions.hide.push("PrEP ST Form, Does the client have a sex partner with one or more HIV risk factors");
            conditions.hide.push("PrEP ST Form, In the last 6 months has the client been treated for an STI by lab testing, self-reports, syndromic STI treatment");
            conditions.hide.push("PrEP ST Form, In the last 6 months have you taken post-exposure prophylaxis (PEP) following a potential exposure to HIV?");
            conditions.hide.push("PrEP ST Form, In the last 6 months have you used emergency contraception?");
            conditions.hide.push("PrEP ST Form, In the last 6 months have you had sex while under the influence of alcohol?");
            conditions.hide.push("PrEP ST Form, Are you in a Sero-discordant relationship?");
            conditions.hide.push("PrEP ST Form, Do you have a partners of unknown status who refuse testing?");
        }
        return conditions;
    },
    "FP Init Form, State reason for removal": function(formName, formFieldValues) {
         var conditions = {enable: [], disable: [], show: [], hide: []};
         var conditionConcept = formFieldValues['FP Init Form, State reason for removal'];
         if (conditionConcept == "FPS FORM,Health concerns" || conditionConcept == "FPS FORM,Complications")
         {
              conditions.show.push("FP Init Form, Removal Method State HealthConcernComplication");

         }
         else
         {
              conditions.hide.push("FP Init Form, Removal Method State HealthConcernComplication");
             }
              return conditions;
      },
      "FP Init Form, Removal Method State HealthConcernComplication": function(formName, formFieldValues) {
         var conditions = {show: [], hide: []};
         var conditionConcept = formFieldValues['FP Init Form, Removal Method State HealthConcernComplication'];
         if (conditionConcept == "Side effects") {
              conditions.show.push("FP Init Form, Removal Method Side effect Specify details");

         }
         else
         {
              conditions.hide.push("FP Init Form, Removal Method Side effect Specify details");
         }
          return conditions;
},

    "FP Init Form, InsertRemove state reason for removal": function(formName, formFieldValues) {
         var conditions = {enable: [], disable: [], show: [], hide: []};
         var conditionConcept = formFieldValues['FP Init Form, InsertRemove state reason for removal'];
         if (conditionConcept == "FPS FORM,Health concerns" || conditionConcept == "FPS FORM,Complications")
         {
              conditions.show.push("FP Init Form, Insert/Remove State HealthConcernComplication");

         }
         else
         {
              conditions.hide.push("FP Init Form, Insert/Remove State HealthConcernComplication");
             }
              return conditions;
      },
      "FP Init Form, Insert/Remove State HealthConcernComplication": function(formName, formFieldValues) {
         var conditions = {show: [], hide: []};
         var conditionConcept = formFieldValues['FP Init Form, Insert/Remove State HealthConcernComplication'];
         if (conditionConcept == "Side effects") {
              conditions.show.push("FP Init Form, Insert/Remove Side effect Specify details");

         }
         else
         {
              conditions.hide.push("FP Init Form, Insert/Remove Side effect Specify details");
         }
          return conditions;
    },
    "AIVC, Have you ever been screened for cervical cancer?": function(formName, formFieldValues) {
         var conditions = {show: [], hide: []};
         var conditionConcept = formFieldValues['AIVC, Have you ever been screened for cervical cancer?'];
         if (conditionConcept == "Yes") {
              conditions.show.push("AIVC, When were you last screened?");
              conditions.show.push("AIVC, What screening test was used?");
              conditions.show.push("AIVC, What was the the result?");
              conditions.show.push("AIVC, When is your next date of screening?");

         }
         else
         {
              conditions.hide.push("AIVC, When were you last screened?");
              conditions.hide.push("AIVC, What screening test was used?");
              conditions.hide.push("AIVC, What was the the result?");
              conditions.hide.push("AIVC, When is your next date of screening?");

         }
          return conditions;
    },
    "AIVC, HPV Pos-VIAC Pos Did u have any intervention done?": function(formName, formFieldValues) {
         var conditions = {show: [], hide: []};
         var conditionConcept = formFieldValues['AIVC, HPV Pos-VIAC Pos Did u have any intervention done?'];
         if (conditionConcept == "Yes") {
              conditions.show.push("AIVC, HPV Pos-VIAC Pos If Yes");
         }
         else
         {
              conditions.hide.push("AIVC, HPV Pos-VIAC Pos If Yes");
         }
          return conditions;
    },
    "AIVC, VIAC Positive Did u have any intervention done?": function(formName, formFieldValues) {
         var conditions = {show: [], hide: []};
         var conditionConcept = formFieldValues['AIVC, VIAC Positive Did u have any intervention done?'];
         if (conditionConcept == "Yes") {
              conditions.show.push("AIVC, VIAC Positive If Yes");
         }
         else
         {
              conditions.hide.push("AIVC, VIAC Positive If Yes");
         }
          return conditions;
    },
    "AIVC, VIA Positive Did u have any intervention done?": function(formName, formFieldValues) {
         var conditions = {show: [], hide: []};
         var conditionConcept = formFieldValues['AIVC, VIA Positive Did u have any intervention done?'];
         if (conditionConcept == "Yes") {
              conditions.show.push("AIVC, VIA Positive If Yes");
         }
         else
         {
              conditions.hide.push("AIVC, VIA Positive If Yes");
         }
          return conditions;
    },
    "AIVC, Papsmear Pos Did u have any intervention done?": function(formName, formFieldValues) {
         var conditions = {show: [], hide: []};
         var conditionConcept = formFieldValues['AIVC, Papsmear Pos Did u have any intervention done?'];
         if (conditionConcept == "Yes") {
              conditions.show.push("AIVC, Papsmear Pos If Yes");
         }
         else
         {
              conditions.hide.push("AIVC, Papsmear Pos If Yes");
         }
          return conditions;
    },
    "AIVC, HPV Pos-VIAC Pos If Yes": function (formName, formFieldValues) {
        var conditions = {show: [], hide: []};
        var conditionConcept = formFieldValues['AIVC, HPV Pos-VIAC Pos If Yes'];

        if (conditionConcept == "AIVC, HPV Pos-VIAC Pos Cryotherapy") {
              conditions.show.push("AIVC, HPV Pos-VIAC Pos Cryotherapy Date");
              conditions.hide.push("AIVC, HPV Pos-VIAC Pos Thermocoagulation Date");
              conditions.hide.push("AIVC, HPV Pos-VIAC Pos LEEP Date");
              conditions.hide.push("AIVC, HPV Pos-VIAC Pos Referred to Gyne Date");
              conditions.hide.push("AIVC, HPV Pos-VIAC Pos Other (Specify details) Text");
              conditions.hide.push("AIVC, HPV Pos-VIAC Pos Other (Specify date) Date");
        }
        else if (conditionConcept == "AIVC, HPV Pos-VIAC Pos Thermocoagulation") {
              conditions.hide.push("AIVC, HPV Pos-VIAC Pos Cryotherapy Date");
              conditions.show.push("AIVC, HPV Pos-VIAC Pos Thermocoagulation Date");
              conditions.hide.push("AIVC, HPV Pos-VIAC Pos LEEP Date");
              conditions.hide.push("AIVC, HPV Pos-VIAC Pos Referred to Gyne Date");
              conditions.hide.push("AIVC, HPV Pos-VIAC Pos Other (Specify details) Text");
              conditions.hide.push("AIVC, HPV Pos-VIAC Pos Other (Specify date) Date");

        }
        else if (conditionConcept == "AIVC, HPV Pos-VIAC Pos LEEP") {
              conditions.hide.push("AIVC, HPV Pos-VIAC Pos Cryotherapy Date");
              conditions.hide.push("AIVC, HPV Pos-VIAC Pos Thermocoagulation Date");
              conditions.show.push("AIVC, HPV Pos-VIAC Pos LEEP Date");
              conditions.hide.push("AIVC, HPV Pos-VIAC Pos Referred to Gyne Date");
              conditions.hide.push("AIVC, HPV Pos-VIAC Pos Other (Specify details) Text");
              conditions.hide.push("AIVC, HPV Pos-VIAC Pos Other (Specify date) Date");

        }
        else if (conditionConcept == "AIVC, HPV Pos-VIAC Pos Referred to Gyne") {
              conditions.hide.push("AIVC, HPV Pos-VIAC Pos Cryotherapy Date");
              conditions.hide.push("AIVC, HPV Pos-VIAC Pos Thermocoagulation Date");
              conditions.hide.push("AIVC, HPV Pos-VIAC Pos LEEP Date");
              conditions.show.push("AIVC, HPV Pos-VIAC Pos Referred to Gyne Date");
              conditions.hide.push("AIVC, HPV Pos-VIAC Pos Other (Specify details) Text");
              conditions.hide.push("AIVC, HPV Pos-VIAC Pos Other (Specify date) Date");

        }
        else if (conditionConcept == "AIVC, HPV Pos-VIAC Pos Other (Specify details)") {
              conditions.hide.push("AIVC, HPV Pos-VIAC Pos Cryotherapy Date");
              conditions.hide.push("AIVC, HPV Pos-VIAC Pos Thermocoagulation Date");
              conditions.hide.push("AIVC, HPV Pos-VIAC Pos LEEP Date");
              conditions.hide.push("AIVC, HPV Pos-VIAC Pos Referred to Gyne Date");
              conditions.show.push("AIVC, HPV Pos-VIAC Pos Other (Specify details) Text");
              conditions.hide.push("AIVC, HPV Pos-VIAC Pos Other (Specify date) Date");

        }
        else if (conditionConcept == "AIVC, HPV Pos-VIAC Pos Other (Specify date)") {
              conditions.hide.push("AIVC, HPV Pos-VIAC Pos Cryotherapy Date");
              conditions.hide.push("AIVC, HPV Pos-VIAC Pos Thermocoagulation Date");
              conditions.hide.push("AIVC, HPV Pos-VIAC Pos LEEP Date");
              conditions.hide.push("AIVC, HPV Pos-VIAC Pos Referred to Gyne Date");
              conditions.hide.push("AIVC, HPV Pos-VIAC Pos Other (Specify details) Text");
              conditions.show.push("AIVC, HPV Pos-VIAC Pos Other (Specify date) Date");

        }
        else {
            conditions.hide.push("AIVC, HPV Pos-VIAC Pos Cryotherapy Date",
                                 "AIVC, HPV Pos-VIAC Pos Thermocoagulation Date",
                                 "AIVC, HPV Pos-VIAC Pos Thermocoagulation Date",
                                 "AIVC, HPV Pos-VIAC Pos LEEP Date",
                                 "AIVC, HPV Pos-VIAC Pos Referred to Gyne Date",
                                 "AIVC, HPV Pos-VIAC Pos Other (Specify details) Text",
                                 "AIVC, HPV Pos-VIAC Pos Other (Specify date) Date");
        }
        return conditions;
    },
    "AIVC, VIAC Positive If Yes": function (formName, formFieldValues) {
        var conditions = {show: [], hide: []};
        var conditionConcept = formFieldValues['AIVC, VIAC Positive If Yes'];

        if (conditionConcept == "AIVC, VIAC Positive Cryotherapy") {
              conditions.show.push("AIVC, VIAC Positive Cryotherapy Date");
              conditions.hide.push("AIVC, VIAC Positive Thermocoagulation Date");
              conditions.hide.push("AIVC, VIAC Positive LEEP Date");
              conditions.hide.push("AIVC, VIAC Positive Referred to Gyne Date");
              conditions.hide.push("AIVC, VIAC Positive Other (Specify details) Text");
              conditions.hide.push("AIVC, VIAC Positive Other (Specify date) Date");
        }
        else if (conditionConcept == "AIVC, VIAC Positive Thermocoagulation") {
              conditions.hide.push("AIVC, VIAC Positive Cryotherapy Date");
              conditions.show.push("AIVC, VIAC Positive Thermocoagulation Date");
              conditions.hide.push("AIVC, VIAC Positive LEEP Date");
              conditions.hide.push("AIVC, VIAC Positive Referred to Gyne Date");
              conditions.hide.push("AIVC, VIAC Positive Other (Specify details) Text");
              conditions.hide.push("AIVC, VIAC Positive Other (Specify date) Date");

        }
        else if (conditionConcept == "AIVC, VIAC Positive LEEP") {
              conditions.hide.push("AIVC, VIAC Positive Cryotherapy Date");
              conditions.hide.push("AIVC, VIAC Positive Thermocoagulation Date");
              conditions.show.push("AIVC, VIAC Positive LEEP Date");
              conditions.hide.push("AIVC, VIAC Positive Referred to Gyne Date");
              conditions.hide.push("AIVC, VIAC Positive Other (Specify details) Text");
              conditions.hide.push("AIVC, VIAC Positive Other (Specify date) Date");

        }
        else if (conditionConcept == "AIVC, VIAC Positive Referred to Gyne") {
              conditions.hide.push("AIVC, VIAC Positive Cryotherapy Date");
              conditions.hide.push("AIVC, VIAC Positive Thermocoagulation Date");
              conditions.hide.push("AIVC, VIAC Positive LEEP Date");
              conditions.show.push("AIVC, VIAC Positive Referred to Gyne Date");
              conditions.hide.push("AIVC, VIAC Positive Other (Specify details) Text");
              conditions.hide.push("AIVC, VIAC Positive Other (Specify date) Date");

        }
        else if (conditionConcept == "AIVC, VIAC Positive Other (Specify details)") {
              conditions.hide.push("AIVC, VIAC Positive Cryotherapy Date");
              conditions.hide.push("AIVC, VIAC Positive Thermocoagulation Date");
              conditions.hide.push("AIVC, VIAC Positive LEEP Date");
              conditions.hide.push("AIVC, VIAC Positive Referred to Gyne Date");
              conditions.show.push("AIVC, VIAC Positive Other (Specify details) Text");
              conditions.hide.push("AIVC, VIAC Positive Other (Specify date) Date");

        }
        else if (conditionConcept == "AIVC, VIAC Positive Other (Specify date)") {
              conditions.hide.push("AIVC, VIAC Positive Cryotherapy Date");
              conditions.hide.push("AIVC, VIAC Positive Thermocoagulation Date");
              conditions.hide.push("AIVC, VIAC Positive LEEP Date");
              conditions.hide.push("AIVC, VIAC Positive Referred to Gyne Date");
              conditions.hide.push("AIVC, VIAC Positive Other (Specify details) Text");
              conditions.show.push("AIVC, VIAC Positive Other (Specify date) Date");

        }
        else {
            conditions.hide.push("AIVC, VIAC Positive Cryotherapy Date",
                                 "AIVC, VIAC Positive Thermocoagulation Date",
                                 "AIVC, VIAC Positive Thermocoagulation Date",
                                 "AIVC, VIAC Positive LEEP Date",
                                 "AIVC, VIAC Positive Referred to Gyne Date",
                                 "AIVC, VIAC Positive Other (Specify details) Text",
                                 "AIVC, VIAC Positive Other (Specify date) Date");
        }
        return conditions;
    },
   "AIVC, VIA Positive If Yes": function (formName, formFieldValues) {
        var conditions = {show: [], hide: []};
        var conditionConcept = formFieldValues['AIVC, VIA Positive If Yes'];

        if (conditionConcept == "AIVC, VIA Positive Cryotherapy") {
              conditions.show.push("AIVC, VIA Positive Cryotherapy Date");
              conditions.hide.push("AIVC, VIA Positive Thermocoagulation Date");
              conditions.hide.push("AIVC, VIA Positive LEEP Date");
              conditions.hide.push("AIVC, VIA Positive Referred to Gyne Date");
              conditions.hide.push("AIVC, VIA Positive Other (Specify details) Text");
              conditions.hide.push("AIVC, VIA Positive Other (Specify date) Date");
        }
        else if (conditionConcept == "AIVC, VIA Positive Thermocoagulation") {
              conditions.hide.push("AIVC, VIA Positive Cryotherapy Date");
              conditions.show.push("AIVC, VIA Positive Thermocoagulation Date");
              conditions.hide.push("AIVC, VIA Positive LEEP Date");
              conditions.hide.push("AIVC, VIA Positive Referred to Gyne Date");
              conditions.hide.push("AIVC, VIA Positive Other (Specify details) Text");
              conditions.hide.push("AIVC, VIA Positive Other (Specify date) Date");

        }
        else if (conditionConcept == "AIVC, VIA Positive LEEP") {
              conditions.hide.push("AIVC, VIA Positive Cryotherapy Date");
              conditions.hide.push("AIVC, VIA Positive Thermocoagulation Date");
              conditions.show.push("AIVC, VIA Positive LEEP Date");
              conditions.hide.push("AIVC, VIA Positive Referred to Gyne Date");
              conditions.hide.push("AIVC, VIA Positive Other (Specify details) Text");
              conditions.hide.push("AIVC, VIA Positive Other (Specify date) Date");

        }
        else if (conditionConcept == "AIVC, VIA Positive Referred to Gyne") {
              conditions.hide.push("AIVC, VIA Positive Cryotherapy Date");
              conditions.hide.push("AIVC, VIA Positive Thermocoagulation Date");
              conditions.hide.push("AIVC, VIA Positive LEEP Date");
              conditions.show.push("AIVC, VIA Positive Referred to Gyne Date");
              conditions.hide.push("AIVC, VIA Positive Other (Specify details) Text");
              conditions.hide.push("AIVC, VIA Positive Other (Specify date) Date");

        }
        else if (conditionConcept == "AIVC, VIA Positive Other (Specify details)") {
              conditions.hide.push("AIVC, VIA Positive Cryotherapy Date");
              conditions.hide.push("AIVC, VIA Positive Thermocoagulation Date");
              conditions.hide.push("AIVC, VIA Positive LEEP Date");
              conditions.hide.push("AIVC, VIA Positive Referred to Gyne Date");
              conditions.show.push("AIVC, VIA Positive Other (Specify details) Text");
              conditions.hide.push("AIVC, VIA Positive Other (Specify date) Date");

        }
        else if (conditionConcept == "AIVC, VIA Positive Other (Specify date)") {
              conditions.hide.push("AIVC, VIA Positive Cryotherapy Date");
              conditions.hide.push("AIVC, VIA Positive Thermocoagulation Date");
              conditions.hide.push("AIVC, VIA Positive LEEP Date");
              conditions.hide.push("AIVC, VIA Positive Referred to Gyne Date");
              conditions.hide.push("AIVC, VIA Positive Other (Specify details) Text");
              conditions.show.push("AIVC, VIA Positive Other (Specify date) Date");

        }
        else {
            conditions.hide.push("AIVC, VIA Positive Cryotherapy Date",
                                 "AIVC, VIA Positive Thermocoagulation Date",
                                 "AIVC, VIA Positive Thermocoagulation Date",
                                 "AIVC, VIA Positive LEEP Date",
                                 "AIVC, VIA Positive Referred to Gyne Date",
                                 "AIVC, VIA Positive Other (Specify details) Text",
                                 "AIVC, VIA Positive Other (Specify date) Date");
        }
        return conditions;
    },
   "AIVC, Papsmear Pos If Yes": function (formName, formFieldValues) {
        var conditions = {show: [], hide: []};
        var conditionConcept = formFieldValues['AIVC, Papsmear Pos If Yes'];

        if (conditionConcept == "AIVC, Papsmear Pos Cryotherapy") {
              conditions.show.push("AIVC, Papsmear Pos Cryotherapy Date");
              conditions.hide.push("AIVC, Papsmear Pos Thermocoagulation Date");
              conditions.hide.push("AIVC, Papsmear Pos LEEP Date");
              conditions.hide.push("AIVC, Papsmear Pos Referred to Gyne Date");
              conditions.hide.push("AIVC, Papsmear Pos Other (Specify details) Text");
              conditions.hide.push("AIVC, Papsmear Pos Other (Specify date) Date");
        }
        else if (conditionConcept == "AIVC, Papsmear Pos Thermocoagulation") {
              conditions.hide.push("AIVC, Papsmear Pos Cryotherapy Date");
              conditions.show.push("AIVC, Papsmear Pos Thermocoagulation Date");
              conditions.hide.push("AIVC, Papsmear Pos LEEP Date");
              conditions.hide.push("AIVC, Papsmear Pos Referred to Gyne Date");
              conditions.hide.push("AIVC, Papsmear Pos Other (Specify details) Text");
              conditions.hide.push("AIVC, Papsmear Pos Other (Specify date) Date");

        }
        else if (conditionConcept == "AIVC, Papsmear Pos LEEP") {
              conditions.hide.push("AIVC, Papsmear Pos Cryotherapy Date");
              conditions.hide.push("AIVC, Papsmear Pos Thermocoagulation Date");
              conditions.show.push("AIVC, Papsmear Pos LEEP Date");
              conditions.hide.push("AIVC, Papsmear Pos Referred to Gyne Date");
              conditions.hide.push("AIVC, Papsmear Pos Other (Specify details) Text");
              conditions.hide.push("AIVC, Papsmear Pos Other (Specify date) Date");

        }
        else if (conditionConcept == "AIVC, Papsmear Pos Referred to Gyne") {
              conditions.hide.push("AIVC, Papsmear Pos Cryotherapy Date");
              conditions.hide.push("AIVC, Papsmear Pos Thermocoagulation Date");
              conditions.hide.push("AIVC, Papsmear Pos LEEP Date");
              conditions.show.push("AIVC, Papsmear Pos Referred to Gyne Date");
              conditions.hide.push("AIVC, Papsmear Pos Other (Specify details) Text");
              conditions.hide.push("AIVC, Papsmear Pos Other (Specify date) Date");

        }
        else if (conditionConcept == "AIVC, Papsmear Pos Other (Specify details)") {
              conditions.hide.push("AIVC, Papsmear Pos Cryotherapy Date");
              conditions.hide.push("AIVC, Papsmear Pos Thermocoagulation Date");
              conditions.hide.push("AIVC, Papsmear Pos LEEP Date");
              conditions.hide.push("AIVC, Papsmear Pos Referred to Gyne Date");
              conditions.show.push("AIVC, Papsmear Pos Other (Specify details) Text");
              conditions.hide.push("AIVC, Papsmear Pos Other (Specify date) Date");

        }
        else if (conditionConcept == "AIVC, Papsmear Pos Other (Specify date)") {
              conditions.hide.push("AIVC, Papsmear Pos Cryotherapy Date");
              conditions.hide.push("AIVC, Papsmear Pos Thermocoagulation Date");
              conditions.hide.push("AIVC, Papsmear Pos LEEP Date");
              conditions.hide.push("AIVC, Papsmear Pos Referred to Gyne Date");
              conditions.hide.push("AIVC, Papsmear Pos Other (Specify details) Text");
              conditions.show.push("AIVC, Papsmear Pos Other (Specify date) Date");

        }
        else {
            conditions.hide.push("AIVC, Papsmear Pos Cryotherapy Date",
                                 "AIVC, Papsmear Pos Thermocoagulation Date",
                                 "AIVC, Papsmear Pos Thermocoagulation Date",
                                 "AIVC, Papsmear Pos LEEP Date",
                                 "AIVC, Papsmear Pos Referred to Gyne Date",
                                 "AIVC, Papsmear Pos Other (Specify details) Text",
                                 "AIVC, Papsmear Pos Other (Specify date) Date");
        }
        return conditions;
    },
    "AIVC, What was the the result?": function (formName, formFieldValues) {
        var conditions = {show: [], hide: []};
        var conditionConcept = formFieldValues['AIVC, What was the the result?'];

        if (conditionConcept == "AIVC, HPV Pos-VIAC Pos") {
              conditions.show.push("AIVC, HPV Pos-VIAC Pos Did u have any intervention done?");
              conditions.hide.push("AIVC, VIAC Positive Did u have any intervention done?");
              conditions.hide.push("AIVC, VIA Positive Did u have any intervention done?");
              conditions.hide.push("AIVC, Papsmear Pos Did u have any intervention done?");
              conditions.hide.push("AIVC, HPV DNA Neg Date");
              conditions.hide.push("AIVC, Papsmear Neg Date");
              conditions.hide.push("AIVC, VIA Neg Date");
              conditions.hide.push("AIVC, VIAC Neg Date");
        }
        else if (conditionConcept == "AIVC, VIAC Positive") {
              conditions.hide.push("AIVC, HPV Pos-VIAC Pos Did u have any intervention done?");
              conditions.show.push("AIVC, VIAC Positive Did u have any intervention done?");
              conditions.hide.push("AIVC, VIA Positive Did u have any intervention done?");
              conditions.hide.push("AIVC, Papsmear Pos Did u have any intervention done?");
              conditions.hide.push("AIVC, HPV DNA Neg Date");
              conditions.hide.push("AIVC, Papsmear Neg Date");
              conditions.hide.push("AIVC, VIA Neg Date");
              conditions.hide.push("AIVC, VIAC Neg Date");

        }
        else if (conditionConcept == "AIVC, VIA Positive") {
              conditions.hide.push("AIVC, HPV Pos-VIAC Pos Did u have any intervention done?");
              conditions.hide.push("AIVC, VIAC Positive Did u have any intervention done?");
              conditions.show.push("AIVC, VIA Positive Did u have any intervention done?");
              conditions.hide.push("AIVC, Papsmear Pos Did u have any intervention done?");
              conditions.hide.push("AIVC, HPV DNA Neg Date");
              conditions.hide.push("AIVC, Papsmear Neg Date");
              conditions.hide.push("AIVC, VIA Neg Date");
              conditions.hide.push("AIVC, VIAC Neg Date");
        }
        else if (conditionConcept == "AIVC, Papsmear Pos") {
              conditions.hide.push("AIVC, HPV Pos-VIAC Pos Did u have any intervention done?");
              conditions.hide.push("AIVC, VIAC Positive Did u have any intervention done?");
              conditions.hide.push("AIVC, VIA Positive Did u have any intervention done?");
              conditions.show.push("AIVC, Papsmear Pos Did u have any intervention done?");
              conditions.hide.push("AIVC, HPV DNA Neg Date");
              conditions.hide.push("AIVC, Papsmear Neg Date");
              conditions.hide.push("AIVC, VIA Neg Date");
              conditions.hide.push("AIVC, VIAC Neg Date");
        }
        else if (conditionConcept == "AIVC, HPV DNA Neg") {
              conditions.hide.push("AIVC, HPV Pos-VIAC Pos Did u have any intervention done?");
              conditions.hide.push("AIVC, VIAC Positive Did u have any intervention done?");
              conditions.hide.push("AIVC, VIA Positive Did u have any intervention done?");
              conditions.hide.push("AIVC, Papsmear Pos Did u have any intervention done?");
              conditions.show.push("AIVC, HPV DNA Neg Date");
              conditions.hide.push("AIVC, Papsmear Neg Date");
              conditions.hide.push("AIVC, VIA Neg Date");
              conditions.hide.push("AIVC, VIAC Neg Date");
        }
        else if (conditionConcept == "AIVC, Papsmear Neg") {
              conditions.hide.push("AIVC, HPV Pos-VIAC Pos Did u have any intervention done?");
              conditions.hide.push("AIVC, VIAC Positive Did u have any intervention done?");
              conditions.hide.push("AIVC, VIA Positive Did u have any intervention done?");
              conditions.hide.push("AIVC, Papsmear Pos Did u have any intervention done?");
              conditions.hide.push("AIVC, HPV DNA Neg Date");
              conditions.show.push("AIVC, Papsmear Neg Date");
              conditions.hide.push("AIVC, VIA Neg Date");
              conditions.hide.push("AIVC, VIAC Neg Date");
        }
        else if (conditionConcept == "AIVC, VIA Neg") {
              conditions.hide.push("AIVC, HPV Pos-VIAC Pos Did u have any intervention done?");
              conditions.hide.push("AIVC, VIAC Positive Did u have any intervention done?");
              conditions.hide.push("AIVC, VIA Positive Did u have any intervention done?");
              conditions.hide.push("AIVC, Papsmear Pos Did u have any intervention done?");
              conditions.hide.push("AIVC, HPV DNA Neg Date");
              conditions.hide.push("AIVC, Papsmear Neg Date");
              conditions.show.push("AIVC, VIA Neg Date");
              conditions.hide.push("AIVC, VIAC Neg Date");
        }
        else if (conditionConcept == "AIVC, VIAC Neg") {
              conditions.hide.push("AIVC, HPV Pos-VIAC Pos Did u have any intervention done?");
              conditions.hide.push("AIVC, VIAC Positive Did u have any intervention done?");
              conditions.hide.push("AIVC, VIA Positive Did u have any intervention done?");
              conditions.hide.push("AIVC, Papsmear Pos Did u have any intervention done?");
              conditions.hide.push("AIVC, HPV DNA Neg Date");
              conditions.hide.push("AIVC, Papsmear Neg Date");
              conditions.hide.push("AIVC, VIA Neg Date");
              conditions.show.push("AIVC, VIAC Neg Date");
        }
        else {
            conditions.hide.push("AIVC, HPV Pos-VIAC Pos Did u have any intervention done?",
                                 "AIVC, VIAC Positive Did u have any intervention done?",
                                 "AIVC, VIA Positive Did u have any intervention done?",
                                 "AIVC, Papsmear Pos Did u have any intervention done?",
                                 "AIVC, HPV DNA Neg Date",
                                 "AIVC, Papsmear Neg Date",
                                 "AIVC, VIA Neg Date",
                                 "AIVC, VIAC Neg Date");
        }
        return conditions;
    },

    "RUUV, Have you ever been screened for cervical cancer?": function(formName, formFieldValues) {
         var conditions = {show: [], hide: []};
         var conditionConcept = formFieldValues['RUUV, Have you ever been screened for cervical cancer?'];
         if (conditionConcept == "Yes") {
              conditions.show.push("RUUV, When were you last screened?");
              conditions.show.push("RUUV, What screening test was used?");
              conditions.show.push("RUUV, What was the the result?");
              conditions.show.push("RUUV, When is your next date of screening?");

         }
         else
         {
              conditions.hide.push("RUUV, When were you last screened?");
              conditions.hide.push("RUUV, What screening test was used?");
              conditions.hide.push("RUUV, What was the the result?");
              conditions.hide.push("RUUV, When is your next date of screening?");

         }
          return conditions;
    },
    "RUUV, HPV Pos-VIAC Pos Did u have any intervention done?": function(formName, formFieldValues) {
         var conditions = {show: [], hide: []};
         var conditionConcept = formFieldValues['RUUV, HPV Pos-VIAC Pos Did u have any intervention done?'];
         if (conditionConcept == "Yes") {
              conditions.show.push("RUUV, HPV Pos-VIAC Pos If Yes");
         }
         else
         {
              conditions.hide.push("RUUV, HPV Pos-VIAC Pos If Yes");
         }
          return conditions;
    },
    "RUUV, VIAC Positive Did u have any intervention done?": function(formName, formFieldValues) {
         var conditions = {show: [], hide: []};
         var conditionConcept = formFieldValues['RUUV, VIAC Positive Did u have any intervention done?'];
         if (conditionConcept == "Yes") {
              conditions.show.push("RUUV, VIAC Positive If Yes");
         }
         else
         {
              conditions.hide.push("RUUV, VIAC Positive If Yes");
         }
          return conditions;
    },
    "RUUV, VIA Positive Did u have any intervention done?": function(formName, formFieldValues) {
         var conditions = {show: [], hide: []};
         var conditionConcept = formFieldValues['RUUV, VIA Positive Did u have any intervention done?'];
         if (conditionConcept == "Yes") {
              conditions.show.push("RUUV, VIA Positive If Yes");
         }
         else
         {
              conditions.hide.push("RUUV, VIA Positive If Yes");
         }
          return conditions;
    },
    "RUUV, Papsmear Pos Did u have any intervention done?": function(formName, formFieldValues) {
         var conditions = {show: [], hide: []};
         var conditionConcept = formFieldValues['RUUV, Papsmear Pos Did u have any intervention done?'];
         if (conditionConcept == "Yes") {
              conditions.show.push("RUUV, Papsmear Pos If Yes");
         }
         else
         {
              conditions.hide.push("RUUV, Papsmear Pos If Yes");
         }
          return conditions;
    },
    "RUUV, HPV Pos-VIAC Pos If Yes": function (formName, formFieldValues) {
        var conditions = {show: [], hide: []};
        var conditionConcept = formFieldValues['RUUV, HPV Pos-VIAC Pos If Yes'];

        if (conditionConcept == "RUUV, HPV Pos-VIAC Pos Cryotherapy") {
              conditions.show.push("RUUV, HPV Pos-VIAC Pos Cryotherapy Date");
              conditions.hide.push("RUUV, HPV Pos-VIAC Pos Thermocoagulation Date");
              conditions.hide.push("RUUV, HPV Pos-VIAC Pos LEEP Date");
              conditions.hide.push("RUUV, HPV Pos-VIAC Pos Referred to Gyne Date");
              conditions.hide.push("RUUV, HPV Pos-VIAC Pos Other (Specify details) Text");
              conditions.hide.push("RUUV, HPV Pos-VIAC Pos Other (Specify date) Date");
        }
        else if (conditionConcept == "RUUV, HPV Pos-VIAC Pos Thermocoagulation") {
              conditions.hide.push("RUUV, HPV Pos-VIAC Pos Cryotherapy Date");
              conditions.show.push("RUUV, HPV Pos-VIAC Pos Thermocoagulation Date");
              conditions.hide.push("RUUV, HPV Pos-VIAC Pos LEEP Date");
              conditions.hide.push("RUUV, HPV Pos-VIAC Pos Referred to Gyne Date");
              conditions.hide.push("RUUV, HPV Pos-VIAC Pos Other (Specify details) Text");
              conditions.hide.push("RUUV, HPV Pos-VIAC Pos Other (Specify date) Date");

        }
        else if (conditionConcept == "RUUV, HPV Pos-VIAC Pos LEEP") {
              conditions.hide.push("RUUV, HPV Pos-VIAC Pos Cryotherapy Date");
              conditions.hide.push("RUUV, HPV Pos-VIAC Pos Thermocoagulation Date");
              conditions.show.push("RUUV, HPV Pos-VIAC Pos LEEP Date");
              conditions.hide.push("RUUV, HPV Pos-VIAC Pos Referred to Gyne Date");
              conditions.hide.push("RUUV, HPV Pos-VIAC Pos Other (Specify details) Text");
              conditions.hide.push("RUUV, HPV Pos-VIAC Pos Other (Specify date) Date");

        }
        else if (conditionConcept == "RUUV, HPV Pos-VIAC Pos Referred to Gyne") {
              conditions.hide.push("RUUV, HPV Pos-VIAC Pos Cryotherapy Date");
              conditions.hide.push("RUUV, HPV Pos-VIAC Pos Thermocoagulation Date");
              conditions.hide.push("RUUV, HPV Pos-VIAC Pos LEEP Date");
              conditions.show.push("RUUV, HPV Pos-VIAC Pos Referred to Gyne Date");
              conditions.hide.push("RUUV, HPV Pos-VIAC Pos Other (Specify details) Text");
              conditions.hide.push("RUUV, HPV Pos-VIAC Pos Other (Specify date) Date");

        }
        else if (conditionConcept == "RUUV, HPV Pos-VIAC Pos Other (Specify details)") {
              conditions.hide.push("RUUV, HPV Pos-VIAC Pos Cryotherapy Date");
              conditions.hide.push("RUUV, HPV Pos-VIAC Pos Thermocoagulation Date");
              conditions.hide.push("RUUV, HPV Pos-VIAC Pos LEEP Date");
              conditions.hide.push("RUUV, HPV Pos-VIAC Pos Referred to Gyne Date");
              conditions.show.push("RUUV, HPV Pos-VIAC Pos Other (Specify details) Text");
              conditions.hide.push("RUUV, HPV Pos-VIAC Pos Other (Specify date) Date");

        }
        else if (conditionConcept == "RUUV, HPV Pos-VIAC Pos Other (Specify date)") {
              conditions.hide.push("RUUV, HPV Pos-VIAC Pos Cryotherapy Date");
              conditions.hide.push("RUUV, HPV Pos-VIAC Pos Thermocoagulation Date");
              conditions.hide.push("RUUV, HPV Pos-VIAC Pos LEEP Date");
              conditions.hide.push("RUUV, HPV Pos-VIAC Pos Referred to Gyne Date");
              conditions.hide.push("RUUV, HPV Pos-VIAC Pos Other (Specify details) Text");
              conditions.show.push("RUUV, HPV Pos-VIAC Pos Other (Specify date) Date");

        }
        else {
            conditions.hide.push("RUUV, HPV Pos-VIAC Pos Cryotherapy Date",
                                 "RUUV, HPV Pos-VIAC Pos Thermocoagulation Date",
                                 "RUUV, HPV Pos-VIAC Pos Thermocoagulation Date",
                                 "RUUV, HPV Pos-VIAC Pos LEEP Date",
                                 "RUUV, HPV Pos-VIAC Pos Referred to Gyne Date",
                                 "RUUV, HPV Pos-VIAC Pos Other (Specify details) Text",
                                 "RUUV, HPV Pos-VIAC Pos Other (Specify date) Date");
        }
        return conditions;
    },
    "RUUV, VIAC Positive If Yes": function (formName, formFieldValues) {
        var conditions = {show: [], hide: []};
        var conditionConcept = formFieldValues['RUUV, VIAC Positive If Yes'];

        if (conditionConcept == "RUUV, VIAC Positive Cryotherapy") {
              conditions.show.push("RUUV, VIAC Positive Cryotherapy Date");
              conditions.hide.push("RUUV, VIAC Positive Thermocoagulation Date");
              conditions.hide.push("RUUV, VIAC Positive LEEP Date");
              conditions.hide.push("RUUV, VIAC Positive Referred to Gyne Date");
              conditions.hide.push("RUUV, VIAC Positive Other (Specify details) Text");
              conditions.hide.push("RUUV, VIAC Positive Other (Specify date) Date");
        }
        else if (conditionConcept == "RUUV, VIAC Positive Thermocoagulation") {
              conditions.hide.push("RUUV, VIAC Positive Cryotherapy Date");
              conditions.show.push("RUUV, VIAC Positive Thermocoagulation Date");
              conditions.hide.push("RUUV, VIAC Positive LEEP Date");
              conditions.hide.push("RUUV, VIAC Positive Referred to Gyne Date");
              conditions.hide.push("RUUV, VIAC Positive Other (Specify details) Text");
              conditions.hide.push("RUUV, VIAC Positive Other (Specify date) Date");

        }
        else if (conditionConcept == "RUUV, VIAC Positive LEEP") {
              conditions.hide.push("RUUV, VIAC Positive Cryotherapy Date");
              conditions.hide.push("RUUV, VIAC Positive Thermocoagulation Date");
              conditions.show.push("RUUV, VIAC Positive LEEP Date");
              conditions.hide.push("RUUV, VIAC Positive Referred to Gyne Date");
              conditions.hide.push("RUUV, VIAC Positive Other (Specify details) Text");
              conditions.hide.push("RUUV, VIAC Positive Other (Specify date) Date");

        }
        else if (conditionConcept == "RUUV, VIAC Positive Referred to Gyne") {
              conditions.hide.push("RUUV, VIAC Positive Cryotherapy Date");
              conditions.hide.push("RUUV, VIAC Positive Thermocoagulation Date");
              conditions.hide.push("RUUV, VIAC Positive LEEP Date");
              conditions.show.push("RUUV, VIAC Positive Referred to Gyne Date");
              conditions.hide.push("RUUV, VIAC Positive Other (Specify details) Text");
              conditions.hide.push("RUUV, VIAC Positive Other (Specify date) Date");

        }
        else if (conditionConcept == "RUUV, VIAC Positive Other (Specify details)") {
              conditions.hide.push("RUUV, VIAC Positive Cryotherapy Date");
              conditions.hide.push("RUUV, VIAC Positive Thermocoagulation Date");
              conditions.hide.push("RUUV, VIAC Positive LEEP Date");
              conditions.hide.push("RUUV, VIAC Positive Referred to Gyne Date");
              conditions.show.push("RUUV, VIAC Positive Other (Specify details) Text");
              conditions.hide.push("RUUV, VIAC Positive Other (Specify date) Date");

        }
        else if (conditionConcept == "RUUV, VIAC Positive Other (Specify date)") {
              conditions.hide.push("RUUV, VIAC Positive Cryotherapy Date");
              conditions.hide.push("RUUV, VIAC Positive Thermocoagulation Date");
              conditions.hide.push("RUUV, VIAC Positive LEEP Date");
              conditions.hide.push("RUUV, VIAC Positive Referred to Gyne Date");
              conditions.hide.push("RUUV, VIAC Positive Other (Specify details) Text");
              conditions.show.push("RUUV, VIAC Positive Other (Specify date) Date");

        }
        else {
            conditions.hide.push("RUUV, VIAC Positive Cryotherapy Date",
                                 "RUUV, VIAC Positive Thermocoagulation Date",
                                 "RUUV, VIAC Positive Thermocoagulation Date",
                                 "RUUV, VIAC Positive LEEP Date",
                                 "RUUV, VIAC Positive Referred to Gyne Date",
                                 "RUUV, VIAC Positive Other (Specify details) Text",
                                 "RUUV, VIAC Positive Other (Specify date) Date");
        }
        return conditions;
    },
   "RUUV, VIA Positive If Yes": function (formName, formFieldValues) {
        var conditions = {show: [], hide: []};
        var conditionConcept = formFieldValues['RUUV, VIA Positive If Yes'];

        if (conditionConcept == "RUUV, VIA Positive Cryotherapy") {
              conditions.show.push("RUUV, VIA Positive Cryotherapy Date");
              conditions.hide.push("RUUV, VIA Positive Thermocoagulation Date");
              conditions.hide.push("RUUV, VIA Positive LEEP Date");
              conditions.hide.push("RUUV, VIA Positive Referred to Gyne Date");
              conditions.hide.push("RUUV, VIA Positive Other (Specify details) Text");
              conditions.hide.push("RUUV, VIA Positive Other (Specify date) Date");
        }
        else if (conditionConcept == "RUUV, VIA Positive Thermocoagulation") {
              conditions.hide.push("RUUV, VIA Positive Cryotherapy Date");
              conditions.show.push("RUUV, VIA Positive Thermocoagulation Date");
              conditions.hide.push("RUUV, VIA Positive LEEP Date");
              conditions.hide.push("RUUV, VIA Positive Referred to Gyne Date");
              conditions.hide.push("RUUV, VIA Positive Other (Specify details) Text");
              conditions.hide.push("RUUV, VIA Positive Other (Specify date) Date");

        }
        else if (conditionConcept == "RUUV, VIA Positive LEEP") {
              conditions.hide.push("RUUV, VIA Positive Cryotherapy Date");
              conditions.hide.push("RUUV, VIA Positive Thermocoagulation Date");
              conditions.show.push("RUUV, VIA Positive LEEP Date");
              conditions.hide.push("RUUV, VIA Positive Referred to Gyne Date");
              conditions.hide.push("RUUV, VIA Positive Other (Specify details) Text");
              conditions.hide.push("RUUV, VIA Positive Other (Specify date) Date");

        }
        else if (conditionConcept == "RUUV, VIA Positive Referred to Gyne") {
              conditions.hide.push("RUUV, VIA Positive Cryotherapy Date");
              conditions.hide.push("RUUV, VIA Positive Thermocoagulation Date");
              conditions.hide.push("RUUV, VIA Positive LEEP Date");
              conditions.show.push("RUUV, VIA Positive Referred to Gyne Date");
              conditions.hide.push("RUUV, VIA Positive Other (Specify details) Text");
              conditions.hide.push("RUUV, VIA Positive Other (Specify date) Date");

        }
        else if (conditionConcept == "RUUV, VIA Positive Other (Specify details)") {
              conditions.hide.push("RUUV, VIA Positive Cryotherapy Date");
              conditions.hide.push("RUUV, VIA Positive Thermocoagulation Date");
              conditions.hide.push("RUUV, VIA Positive LEEP Date");
              conditions.hide.push("RUUV, VIA Positive Referred to Gyne Date");
              conditions.show.push("RUUV, VIA Positive Other (Specify details) Text");
              conditions.hide.push("RUUV, VIA Positive Other (Specify date) Date");

        }
        else if (conditionConcept == "RUUV, VIA Positive Other (Specify date)") {
              conditions.hide.push("RUUV, VIA Positive Cryotherapy Date");
              conditions.hide.push("RUUV, VIA Positive Thermocoagulation Date");
              conditions.hide.push("RUUV, VIA Positive LEEP Date");
              conditions.hide.push("RUUV, VIA Positive Referred to Gyne Date");
              conditions.hide.push("RUUV, VIA Positive Other (Specify details) Text");
              conditions.show.push("RUUV, VIA Positive Other (Specify date) Date");

        }
        else {
            conditions.hide.push("RUUV, VIA Positive Cryotherapy Date",
                                 "RUUV, VIA Positive Thermocoagulation Date",
                                 "RUUV, VIA Positive Thermocoagulation Date",
                                 "RUUV, VIA Positive LEEP Date",
                                 "RUUV, VIA Positive Referred to Gyne Date",
                                 "RUUV, VIA Positive Other (Specify details) Text",
                                 "RUUV, VIA Positive Other (Specify date) Date");
        }
        return conditions;
    },
   "RUUV, Papsmear Pos If Yes": function (formName, formFieldValues) {
        var conditions = {show: [], hide: []};
        var conditionConcept = formFieldValues['RUUV, Papsmear Pos If Yes'];

        if (conditionConcept == "RUUV, Papsmear Pos Cryotherapy") {
              conditions.show.push("RUUV, Papsmear Pos Cryotherapy Date");
              conditions.hide.push("RUUV, Papsmear Pos Thermocoagulation Date");
              conditions.hide.push("RUUV, Papsmear Pos LEEP Date");
              conditions.hide.push("RUUV, Papsmear Pos Referred to Gyne Date");
              conditions.hide.push("RUUV, Papsmear Pos Other (Specify details) Text");
              conditions.hide.push("RUUV, Papsmear Pos Other (Specify date) Date");
        }
        else if (conditionConcept == "RUUV, Papsmear Pos Thermocoagulation") {
              conditions.hide.push("RUUV, Papsmear Pos Cryotherapy Date");
              conditions.show.push("RUUV, Papsmear Pos Thermocoagulation Date");
              conditions.hide.push("RUUV, Papsmear Pos LEEP Date");
              conditions.hide.push("RUUV, Papsmear Pos Referred to Gyne Date");
              conditions.hide.push("RUUV, Papsmear Pos Other (Specify details) Text");
              conditions.hide.push("RUUV, Papsmear Pos Other (Specify date) Date");

        }
        else if (conditionConcept == "RUUV, Papsmear Pos LEEP") {
              conditions.hide.push("RUUV, Papsmear Pos Cryotherapy Date");
              conditions.hide.push("RUUV, Papsmear Pos Thermocoagulation Date");
              conditions.show.push("RUUV, Papsmear Pos LEEP Date");
              conditions.hide.push("RUUV, Papsmear Pos Referred to Gyne Date");
              conditions.hide.push("RUUV, Papsmear Pos Other (Specify details) Text");
              conditions.hide.push("RUUV, Papsmear Pos Other (Specify date) Date");

        }
        else if (conditionConcept == "RUUV, Papsmear Pos Referred to Gyne") {
              conditions.hide.push("RUUV, Papsmear Pos Cryotherapy Date");
              conditions.hide.push("RUUV, Papsmear Pos Thermocoagulation Date");
              conditions.hide.push("RUUV, Papsmear Pos LEEP Date");
              conditions.show.push("RUUV, Papsmear Pos Referred to Gyne Date");
              conditions.hide.push("RUUV, Papsmear Pos Other (Specify details) Text");
              conditions.hide.push("RUUV, Papsmear Pos Other (Specify date) Date");

        }
        else if (conditionConcept == "RUUV, Papsmear Pos Other (Specify details)") {
              conditions.hide.push("RUUV, Papsmear Pos Cryotherapy Date");
              conditions.hide.push("RUUV, Papsmear Pos Thermocoagulation Date");
              conditions.hide.push("RUUV, Papsmear Pos LEEP Date");
              conditions.hide.push("RUUV, Papsmear Pos Referred to Gyne Date");
              conditions.show.push("RUUV, Papsmear Pos Other (Specify details) Text");
              conditions.hide.push("RUUV, Papsmear Pos Other (Specify date) Date");

        }
        else if (conditionConcept == "RUUV, Papsmear Pos Other (Specify date)") {
              conditions.hide.push("RUUV, Papsmear Pos Cryotherapy Date");
              conditions.hide.push("RUUV, Papsmear Pos Thermocoagulation Date");
              conditions.hide.push("RUUV, Papsmear Pos LEEP Date");
              conditions.hide.push("RUUV, Papsmear Pos Referred to Gyne Date");
              conditions.hide.push("RUUV, Papsmear Pos Other (Specify details) Text");
              conditions.show.push("RUUV, Papsmear Pos Other (Specify date) Date");

        }
        else {
            conditions.hide.push("RUUV, Papsmear Pos Cryotherapy Date",
                                 "RUUV, Papsmear Pos Thermocoagulation Date",
                                 "RUUV, Papsmear Pos Thermocoagulation Date",
                                 "RUUV, Papsmear Pos LEEP Date",
                                 "RUUV, Papsmear Pos Referred to Gyne Date",
                                 "RUUV, Papsmear Pos Other (Specify details) Text",
                                 "RUUV, Papsmear Pos Other (Specify date) Date");
        }
        return conditions;
    },
    "RUUV, What was the the result?": function (formName, formFieldValues) {
        var conditions = {show: [], hide: []};
        var conditionConcept = formFieldValues['RUUV, What was the the result?'];

        if (conditionConcept == "RUUV, HPV Pos-VIAC Pos") {
              conditions.show.push("RUUV, HPV Pos-VIAC Pos Did u have any intervention done?");
              conditions.hide.push("RUUV, VIAC Positive Did u have any intervention done?");
              conditions.hide.push("RUUV, VIA Positive Did u have any intervention done?");
              conditions.hide.push("RUUV, Papsmear Pos Did u have any intervention done?");
              conditions.hide.push("RUUV, HPV DNA Neg Date");
              conditions.hide.push("RUUV, Papsmear Neg Date");
              conditions.hide.push("RUUV, VIA Neg Date");
              conditions.hide.push("RUUV, VIAC Neg Date");
        }
        else if (conditionConcept == "RUUV, VIAC Positive") {
              conditions.hide.push("RUUV, HPV Pos-VIAC Pos Did u have any intervention done?");
              conditions.show.push("RUUV, VIAC Positive Did u have any intervention done?");
              conditions.hide.push("RUUV, VIA Positive Did u have any intervention done?");
              conditions.hide.push("RUUV, Papsmear Pos Did u have any intervention done?");
              conditions.hide.push("RUUV, HPV DNA Neg Date");
              conditions.hide.push("RUUV, Papsmear Neg Date");
              conditions.hide.push("RUUV, VIA Neg Date");
              conditions.hide.push("RUUV, VIAC Neg Date");

        }
        else if (conditionConcept == "RUUV, VIA Positive") {
              conditions.hide.push("RUUV, HPV Pos-VIAC Pos Did u have any intervention done?");
              conditions.hide.push("RUUV, VIAC Positive Did u have any intervention done?");
              conditions.show.push("RUUV, VIA Positive Did u have any intervention done?");
              conditions.hide.push("RUUV, Papsmear Pos Did u have any intervention done?");
              conditions.hide.push("RUUV, HPV DNA Neg Date");
              conditions.hide.push("RUUV, Papsmear Neg Date");
              conditions.hide.push("RUUV, VIA Neg Date");
              conditions.hide.push("RUUV, VIAC Neg Date");
        }
        else if (conditionConcept == "RUUV, Papsmear Pos") {
              conditions.hide.push("RUUV, HPV Pos-VIAC Pos Did u have any intervention done?");
              conditions.hide.push("RUUV, VIAC Positive Did u have any intervention done?");
              conditions.hide.push("RUUV, VIA Positive Did u have any intervention done?");
              conditions.show.push("RUUV, Papsmear Pos Did u have any intervention done?");
              conditions.hide.push("RUUV, HPV DNA Neg Date");
              conditions.hide.push("RUUV, Papsmear Neg Date");
              conditions.hide.push("RUUV, VIA Neg Date");
              conditions.hide.push("RUUV, VIAC Neg Date");
        }
        else if (conditionConcept == "RUUV, HPV DNA Neg") {
              conditions.hide.push("RUUV, HPV Pos-VIAC Pos Did u have any intervention done?");
              conditions.hide.push("RUUV, VIAC Positive Did u have any intervention done?");
              conditions.hide.push("RUUV, VIA Positive Did u have any intervention done?");
              conditions.hide.push("RUUV, Papsmear Pos Did u have any intervention done?");
              conditions.show.push("RUUV, HPV DNA Neg Date");
              conditions.hide.push("RUUV, Papsmear Neg Date");
              conditions.hide.push("RUUV, VIA Neg Date");
              conditions.hide.push("RUUV, VIAC Neg Date");
        }
        else if (conditionConcept == "RUUV, Papsmear Neg") {
              conditions.hide.push("RUUV, HPV Pos-VIAC Pos Did u have any intervention done?");
              conditions.hide.push("RUUV, VIAC Positive Did u have any intervention done?");
              conditions.hide.push("RUUV, VIA Positive Did u have any intervention done?");
              conditions.hide.push("RUUV, Papsmear Pos Did u have any intervention done?");
              conditions.hide.push("RUUV, HPV DNA Neg Date");
              conditions.show.push("RUUV, Papsmear Neg Date");
              conditions.hide.push("RUUV, VIA Neg Date");
              conditions.hide.push("RUUV, VIAC Neg Date");
        }
        else if (conditionConcept == "RUUV, VIA Neg") {
              conditions.hide.push("RUUV, HPV Pos-VIAC Pos Did u have any intervention done?");
              conditions.hide.push("RUUV, VIAC Positive Did u have any intervention done?");
              conditions.hide.push("RUUV, VIA Positive Did u have any intervention done?");
              conditions.hide.push("RUUV, Papsmear Pos Did u have any intervention done?");
              conditions.hide.push("RUUV, HPV DNA Neg Date");
              conditions.hide.push("RUUV, Papsmear Neg Date");
              conditions.show.push("RUUV, VIA Neg Date");
              conditions.hide.push("RUUV, VIAC Neg Date");
        }
        else if (conditionConcept == "RUUV, VIAC Neg") {
              conditions.hide.push("RUUV, HPV Pos-VIAC Pos Did u have any intervention done?");
              conditions.hide.push("RUUV, VIAC Positive Did u have any intervention done?");
              conditions.hide.push("RUUV, VIA Positive Did u have any intervention done?");
              conditions.hide.push("RUUV, Papsmear Pos Did u have any intervention done?");
              conditions.hide.push("RUUV, HPV DNA Neg Date");
              conditions.hide.push("RUUV, Papsmear Neg Date");
              conditions.hide.push("RUUV, VIA Neg Date");
              conditions.show.push("RUUV, VIAC Neg Date");
        }
        else {
            conditions.hide.push("RUUV, HPV Pos-VIAC Pos Did u have any intervention done?",
                                 "RUUV, VIAC Positive Did u have any intervention done?",
                                 "RUUV, VIA Positive Did u have any intervention done?",
                                 "RUUV, Papsmear Pos Did u have any intervention done?",
                                 "RUUV, HPV DNA Neg Date",
                                 "RUUV, Papsmear Neg Date",
                                 "RUUV, VIA Neg Date",
                                 "RUUV, VIAC Neg Date");
        }
        return conditions;
    },
    "AP, Have you ever been screened for cervical cancer?": function(formName, formFieldValues) {
         var conditions = {show: [], hide: []};
         var conditionConcept = formFieldValues['AP, Have you ever been screened for cervical cancer?'];
         if (conditionConcept == "Yes") {
              conditions.show.push("AP, When were you last screened?");
              conditions.show.push("AP, What screening test was used?");
              conditions.show.push("AP, What was the the result?");
              conditions.show.push("AP, When is your next date of screening?");

         }
         else
         {
              conditions.hide.push("AP, When were you last screened?");
              conditions.hide.push("AP, What screening test was used?");
              conditions.hide.push("AP, What was the the result?");
              conditions.hide.push("AP, When is your next date of screening?");

         }
          return conditions;
    },
    "AP, HPV Pos-VIAC Pos Did u have any intervention done?": function(formName, formFieldValues) {
         var conditions = {show: [], hide: []};
         var conditionConcept = formFieldValues['AP, HPV Pos-VIAC Pos Did u have any intervention done?'];
         if (conditionConcept == "Yes") {
              conditions.show.push("AP, HPV Pos-VIAC Pos If Yes");
         }
         else
         {
              conditions.hide.push("AP, HPV Pos-VIAC Pos If Yes");
         }
          return conditions;
    },
    "AP, VIAC Positive Did u have any intervention done?": function(formName, formFieldValues) {
         var conditions = {show: [], hide: []};
         var conditionConcept = formFieldValues['AP, VIAC Positive Did u have any intervention done?'];
         if (conditionConcept == "Yes") {
              conditions.show.push("AP, VIAC Positive If Yes");
         }
         else
         {
              conditions.hide.push("AP, VIAC Positive If Yes");
         }
          return conditions;
    },
    "AP, VIA Positive Did u have any intervention done?": function(formName, formFieldValues) {
         var conditions = {show: [], hide: []};
         var conditionConcept = formFieldValues['AP, VIA Positive Did u have any intervention done?'];
         if (conditionConcept == "Yes") {
              conditions.show.push("AP, VIA Positive If Yes");
         }
         else
         {
              conditions.hide.push("AP, VIA Positive If Yes");
         }
          return conditions;
    },
    "AP, Papsmear Pos Did u have any intervention done?": function(formName, formFieldValues) {
         var conditions = {show: [], hide: []};
         var conditionConcept = formFieldValues['AP, Papsmear Pos Did u have any intervention done?'];
         if (conditionConcept == "Yes") {
              conditions.show.push("AP, Papsmear Pos If Yes");
         }
         else
         {
              conditions.hide.push("AP, Papsmear Pos If Yes");
         }
          return conditions;
    },
    "AP, HPV Pos-VIAC Pos If Yes": function (formName, formFieldValues) {
        var conditions = {show: [], hide: []};
        var conditionConcept = formFieldValues['AP, HPV Pos-VIAC Pos If Yes'];

        if (conditionConcept == "AP, HPV Pos-VIAC Pos Cryotherapy") {
              conditions.show.push("AP, HPV Pos-VIAC Pos Cryotherapy Date");
              conditions.hide.push("AP, HPV Pos-VIAC Pos Thermocoagulation Date");
              conditions.hide.push("AP, HPV Pos-VIAC Pos LEEP Date");
              conditions.hide.push("AP, HPV Pos-VIAC Pos Referred to Gyne Date");
              conditions.hide.push("AP, HPV Pos-VIAC Pos Other (Specify details) Text");
              conditions.hide.push("AP, HPV Pos-VIAC Pos Other (Specify date) Date");
        }
        else if (conditionConcept == "AP, HPV Pos-VIAC Pos Thermocoagulation") {
              conditions.hide.push("AP, HPV Pos-VIAC Pos Cryotherapy Date");
              conditions.show.push("AP, HPV Pos-VIAC Pos Thermocoagulation Date");
              conditions.hide.push("AP, HPV Pos-VIAC Pos LEEP Date");
              conditions.hide.push("AP, HPV Pos-VIAC Pos Referred to Gyne Date");
              conditions.hide.push("AP, HPV Pos-VIAC Pos Other (Specify details) Text");
              conditions.hide.push("AP, HPV Pos-VIAC Pos Other (Specify date) Date");

        }
        else if (conditionConcept == "AP, HPV Pos-VIAC Pos LEEP") {
              conditions.hide.push("AP, HPV Pos-VIAC Pos Cryotherapy Date");
              conditions.hide.push("AP, HPV Pos-VIAC Pos Thermocoagulation Date");
              conditions.show.push("AP, HPV Pos-VIAC Pos LEEP Date");
              conditions.hide.push("AP, HPV Pos-VIAC Pos Referred to Gyne Date");
              conditions.hide.push("AP, HPV Pos-VIAC Pos Other (Specify details) Text");
              conditions.hide.push("AP, HPV Pos-VIAC Pos Other (Specify date) Date");

        }
        else if (conditionConcept == "AP, HPV Pos-VIAC Pos Referred to Gyne") {
              conditions.hide.push("AP, HPV Pos-VIAC Pos Cryotherapy Date");
              conditions.hide.push("AP, HPV Pos-VIAC Pos Thermocoagulation Date");
              conditions.hide.push("AP, HPV Pos-VIAC Pos LEEP Date");
              conditions.show.push("AP, HPV Pos-VIAC Pos Referred to Gyne Date");
              conditions.hide.push("AP, HPV Pos-VIAC Pos Other (Specify details) Text");
              conditions.hide.push("AP, HPV Pos-VIAC Pos Other (Specify date) Date");

        }
        else if (conditionConcept == "AP, HPV Pos-VIAC Pos Other (Specify details)") {
              conditions.hide.push("AP, HPV Pos-VIAC Pos Cryotherapy Date");
              conditions.hide.push("AP, HPV Pos-VIAC Pos Thermocoagulation Date");
              conditions.hide.push("AP, HPV Pos-VIAC Pos LEEP Date");
              conditions.hide.push("AP, HPV Pos-VIAC Pos Referred to Gyne Date");
              conditions.show.push("AP, HPV Pos-VIAC Pos Other (Specify details) Text");
              conditions.hide.push("AP, HPV Pos-VIAC Pos Other (Specify date) Date");

        }
        else if (conditionConcept == "AP, HPV Pos-VIAC Pos Other (Specify date)") {
              conditions.hide.push("AP, HPV Pos-VIAC Pos Cryotherapy Date");
              conditions.hide.push("AP, HPV Pos-VIAC Pos Thermocoagulation Date");
              conditions.hide.push("AP, HPV Pos-VIAC Pos LEEP Date");
              conditions.hide.push("AP, HPV Pos-VIAC Pos Referred to Gyne Date");
              conditions.hide.push("AP, HPV Pos-VIAC Pos Other (Specify details) Text");
              conditions.show.push("AP, HPV Pos-VIAC Pos Other (Specify date) Date");

        }
        else {
            conditions.hide.push("AP, HPV Pos-VIAC Pos Cryotherapy Date",
                                 "AP, HPV Pos-VIAC Pos Thermocoagulation Date",
                                 "AP, HPV Pos-VIAC Pos Thermocoagulation Date",
                                 "AP, HPV Pos-VIAC Pos LEEP Date",
                                 "AP, HPV Pos-VIAC Pos Referred to Gyne Date",
                                 "AP, HPV Pos-VIAC Pos Other (Specify details) Text",
                                 "AP, HPV Pos-VIAC Pos Other (Specify date) Date");
        }
        return conditions;
    },
    "AP, VIAC Positive If Yes": function (formName, formFieldValues) {
        var conditions = {show: [], hide: []};
        var conditionConcept = formFieldValues['AP, VIAC Positive If Yes'];

        if (conditionConcept == "AP, VIAC Positive Cryotherapy") {
              conditions.show.push("AP, VIAC Positive Cryotherapy Date");
              conditions.hide.push("AP, VIAC Positive Thermocoagulation Date");
              conditions.hide.push("AP, VIAC Positive LEEP Date");
              conditions.hide.push("AP, VIAC Positive Referred to Gyne Date");
              conditions.hide.push("AP, VIAC Positive Other (Specify details) Text");
              conditions.hide.push("AP, VIAC Positive Other (Specify date) Date");
        }
        else if (conditionConcept == "AP, VIAC Positive Thermocoagulation") {
              conditions.hide.push("AP, VIAC Positive Cryotherapy Date");
              conditions.show.push("AP, VIAC Positive Thermocoagulation Date");
              conditions.hide.push("AP, VIAC Positive LEEP Date");
              conditions.hide.push("AP, VIAC Positive Referred to Gyne Date");
              conditions.hide.push("AP, VIAC Positive Other (Specify details) Text");
              conditions.hide.push("AP, VIAC Positive Other (Specify date) Date");

        }
        else if (conditionConcept == "AP, VIAC Positive LEEP") {
              conditions.hide.push("AP, VIAC Positive Cryotherapy Date");
              conditions.hide.push("AP, VIAC Positive Thermocoagulation Date");
              conditions.show.push("AP, VIAC Positive LEEP Date");
              conditions.hide.push("AP, VIAC Positive Referred to Gyne Date");
              conditions.hide.push("AP, VIAC Positive Other (Specify details) Text");
              conditions.hide.push("AP, VIAC Positive Other (Specify date) Date");

        }
        else if (conditionConcept == "AP, VIAC Positive Referred to Gyne") {
              conditions.hide.push("AP, VIAC Positive Cryotherapy Date");
              conditions.hide.push("AP, VIAC Positive Thermocoagulation Date");
              conditions.hide.push("AP, VIAC Positive LEEP Date");
              conditions.show.push("AP, VIAC Positive Referred to Gyne Date");
              conditions.hide.push("AP, VIAC Positive Other (Specify details) Text");
              conditions.hide.push("AP, VIAC Positive Other (Specify date) Date");

        }
        else if (conditionConcept == "AP, VIAC Positive Other (Specify details)") {
              conditions.hide.push("AP, VIAC Positive Cryotherapy Date");
              conditions.hide.push("AP, VIAC Positive Thermocoagulation Date");
              conditions.hide.push("AP, VIAC Positive LEEP Date");
              conditions.hide.push("AP, VIAC Positive Referred to Gyne Date");
              conditions.show.push("AP, VIAC Positive Other (Specify details) Text");
              conditions.hide.push("AP, VIAC Positive Other (Specify date) Date");

        }
        else if (conditionConcept == "AP, VIAC Positive Other (Specify date)") {
              conditions.hide.push("AP, VIAC Positive Cryotherapy Date");
              conditions.hide.push("AP, VIAC Positive Thermocoagulation Date");
              conditions.hide.push("AP, VIAC Positive LEEP Date");
              conditions.hide.push("AP, VIAC Positive Referred to Gyne Date");
              conditions.hide.push("AP, VIAC Positive Other (Specify details) Text");
              conditions.show.push("AP, VIAC Positive Other (Specify date) Date");

        }
        else {
            conditions.hide.push("AP, VIAC Positive Cryotherapy Date",
                                 "AP, VIAC Positive Thermocoagulation Date",
                                 "AP, VIAC Positive Thermocoagulation Date",
                                 "AP, VIAC Positive LEEP Date",
                                 "AP, VIAC Positive Referred to Gyne Date",
                                 "AP, VIAC Positive Other (Specify details) Text",
                                 "AP, VIAC Positive Other (Specify date) Date");
        }
        return conditions;
    },
   "AP, VIA Positive If Yes": function (formName, formFieldValues) {
        var conditions = {show: [], hide: []};
        var conditionConcept = formFieldValues['AP, VIA Positive If Yes'];

        if (conditionConcept == "AP, VIA Positive Cryotherapy") {
              conditions.show.push("AP, VIA Positive Cryotherapy Date");
              conditions.hide.push("AP, VIA Positive Thermocoagulation Date");
              conditions.hide.push("AP, VIA Positive LEEP Date");
              conditions.hide.push("AP, VIA Positive Referred to Gyne Date");
              conditions.hide.push("AP, VIA Positive Other (Specify details) Text");
              conditions.hide.push("AP, VIA Positive Other (Specify date) Date");
        }
        else if (conditionConcept == "AP, VIA Positive Thermocoagulation") {
              conditions.hide.push("AP, VIA Positive Cryotherapy Date");
              conditions.show.push("AP, VIA Positive Thermocoagulation Date");
              conditions.hide.push("AP, VIA Positive LEEP Date");
              conditions.hide.push("AP, VIA Positive Referred to Gyne Date");
              conditions.hide.push("AP, VIA Positive Other (Specify details) Text");
              conditions.hide.push("AP, VIA Positive Other (Specify date) Date");

        }
        else if (conditionConcept == "AP, VIA Positive LEEP") {
              conditions.hide.push("AP, VIA Positive Cryotherapy Date");
              conditions.hide.push("AP, VIA Positive Thermocoagulation Date");
              conditions.show.push("AP, VIA Positive LEEP Date");
              conditions.hide.push("AP, VIA Positive Referred to Gyne Date");
              conditions.hide.push("AP, VIA Positive Other (Specify details) Text");
              conditions.hide.push("AP, VIA Positive Other (Specify date) Date");

        }
        else if (conditionConcept == "AP, VIA Positive Referred to Gyne") {
              conditions.hide.push("AP, VIA Positive Cryotherapy Date");
              conditions.hide.push("AP, VIA Positive Thermocoagulation Date");
              conditions.hide.push("AP, VIA Positive LEEP Date");
              conditions.show.push("AP, VIA Positive Referred to Gyne Date");
              conditions.hide.push("AP, VIA Positive Other (Specify details) Text");
              conditions.hide.push("AP, VIA Positive Other (Specify date) Date");

        }
        else if (conditionConcept == "AP, VIA Positive Other (Specify details)") {
              conditions.hide.push("AP, VIA Positive Cryotherapy Date");
              conditions.hide.push("AP, VIA Positive Thermocoagulation Date");
              conditions.hide.push("AP, VIA Positive LEEP Date");
              conditions.hide.push("AP, VIA Positive Referred to Gyne Date");
              conditions.show.push("AP, VIA Positive Other (Specify details) Text");
              conditions.hide.push("AP, VIA Positive Other (Specify date) Date");

        }
        else if (conditionConcept == "AP, VIA Positive Other (Specify date)") {
              conditions.hide.push("AP, VIA Positive Cryotherapy Date");
              conditions.hide.push("AP, VIA Positive Thermocoagulation Date");
              conditions.hide.push("AP, VIA Positive LEEP Date");
              conditions.hide.push("AP, VIA Positive Referred to Gyne Date");
              conditions.hide.push("AP, VIA Positive Other (Specify details) Text");
              conditions.show.push("AP, VIA Positive Other (Specify date) Date");

        }
        else {
            conditions.hide.push("AP, VIA Positive Cryotherapy Date",
                                 "AP, VIA Positive Thermocoagulation Date",
                                 "AP, VIA Positive Thermocoagulation Date",
                                 "AP, VIA Positive LEEP Date",
                                 "AP, VIA Positive Referred to Gyne Date",
                                 "AP, VIA Positive Other (Specify details) Text",
                                 "AP, VIA Positive Other (Specify date) Date");
        }
        return conditions;
    },
   "AP, Papsmear Pos If Yes": function (formName, formFieldValues) {
        var conditions = {show: [], hide: []};
        var conditionConcept = formFieldValues['AP, Papsmear Pos If Yes'];

        if (conditionConcept == "AP, Papsmear Pos Cryotherapy") {
              conditions.show.push("AP, Papsmear Pos Cryotherapy Date");
              conditions.hide.push("AP, Papsmear Pos Thermocoagulation Date");
              conditions.hide.push("AP, Papsmear Pos LEEP Date");
              conditions.hide.push("AP, Papsmear Pos Referred to Gyne Date");
              conditions.hide.push("AP, Papsmear Pos Other (Specify details) Text");
              conditions.hide.push("AP, Papsmear Pos Other (Specify date) Date");
        }
        else if (conditionConcept == "AP, Papsmear Pos Thermocoagulation") {
              conditions.hide.push("AP, Papsmear Pos Cryotherapy Date");
              conditions.show.push("AP, Papsmear Pos Thermocoagulation Date");
              conditions.hide.push("AP, Papsmear Pos LEEP Date");
              conditions.hide.push("AP, Papsmear Pos Referred to Gyne Date");
              conditions.hide.push("AP, Papsmear Pos Other (Specify details) Text");
              conditions.hide.push("AP, Papsmear Pos Other (Specify date) Date");

        }
        else if (conditionConcept == "AP, Papsmear Pos LEEP") {
              conditions.hide.push("AP, Papsmear Pos Cryotherapy Date");
              conditions.hide.push("AP, Papsmear Pos Thermocoagulation Date");
              conditions.show.push("AP, Papsmear Pos LEEP Date");
              conditions.hide.push("AP, Papsmear Pos Referred to Gyne Date");
              conditions.hide.push("AP, Papsmear Pos Other (Specify details) Text");
              conditions.hide.push("AP, Papsmear Pos Other (Specify date) Date");

        }
        else if (conditionConcept == "AP, Papsmear Pos Referred to Gyne") {
              conditions.hide.push("AP, Papsmear Pos Cryotherapy Date");
              conditions.hide.push("AP, Papsmear Pos Thermocoagulation Date");
              conditions.hide.push("AP, Papsmear Pos LEEP Date");
              conditions.show.push("AP, Papsmear Pos Referred to Gyne Date");
              conditions.hide.push("AP, Papsmear Pos Other (Specify details) Text");
              conditions.hide.push("AP, Papsmear Pos Other (Specify date) Date");

        }
        else if (conditionConcept == "AP, Papsmear Pos Other (Specify details)") {
              conditions.hide.push("AP, Papsmear Pos Cryotherapy Date");
              conditions.hide.push("AP, Papsmear Pos Thermocoagulation Date");
              conditions.hide.push("AP, Papsmear Pos LEEP Date");
              conditions.hide.push("AP, Papsmear Pos Referred to Gyne Date");
              conditions.show.push("AP, Papsmear Pos Other (Specify details) Text");
              conditions.hide.push("AP, Papsmear Pos Other (Specify date) Date");

        }
        else if (conditionConcept == "AP, Papsmear Pos Other (Specify date)") {
              conditions.hide.push("AP, Papsmear Pos Cryotherapy Date");
              conditions.hide.push("AP, Papsmear Pos Thermocoagulation Date");
              conditions.hide.push("AP, Papsmear Pos LEEP Date");
              conditions.hide.push("AP, Papsmear Pos Referred to Gyne Date");
              conditions.hide.push("AP, Papsmear Pos Other (Specify details) Text");
              conditions.show.push("AP, Papsmear Pos Other (Specify date) Date");

        }
        else {
            conditions.hide.push("AP, Papsmear Pos Cryotherapy Date",
                                 "AP, Papsmear Pos Thermocoagulation Date",
                                 "AP, Papsmear Pos Thermocoagulation Date",
                                 "AP, Papsmear Pos LEEP Date",
                                 "AP, Papsmear Pos Referred to Gyne Date",
                                 "AP, Papsmear Pos Other (Specify details) Text",
                                 "AP, Papsmear Pos Other (Specify date) Date");
        }
        return conditions;
    },
    "AP, What was the the result?": function (formName, formFieldValues) {
        var conditions = {show: [], hide: []};
        var conditionConcept = formFieldValues['AP, What was the the result?'];

        if (conditionConcept == "AP, HPV Pos-VIAC Pos") {
              conditions.show.push("AP, HPV Pos-VIAC Pos Did u have any intervention done?");
              conditions.hide.push("AP, VIAC Positive Did u have any intervention done?");
              conditions.hide.push("AP, VIA Positive Did u have any intervention done?");
              conditions.hide.push("AP, Papsmear Pos Did u have any intervention done?");
              conditions.hide.push("AP, HPV DNA Neg Date");
              conditions.hide.push("AP, Papsmear Neg Date");
              conditions.hide.push("AP, VIA Neg Date");
              conditions.hide.push("AP, VIAC Neg Date");
        }
        else if (conditionConcept == "AP, VIAC Positive") {
              conditions.hide.push("AP, HPV Pos-VIAC Pos Did u have any intervention done?");
              conditions.show.push("AP, VIAC Positive Did u have any intervention done?");
              conditions.hide.push("AP, VIA Positive Did u have any intervention done?");
              conditions.hide.push("AP, Papsmear Pos Did u have any intervention done?");
              conditions.hide.push("AP, HPV DNA Neg Date");
              conditions.hide.push("AP, Papsmear Neg Date");
              conditions.hide.push("AP, VIA Neg Date");
              conditions.hide.push("AP, VIAC Neg Date");

        }
        else if (conditionConcept == "AP, VIA Positive") {
              conditions.hide.push("AP, HPV Pos-VIAC Pos Did u have any intervention done?");
              conditions.hide.push("AP, VIAC Positive Did u have any intervention done?");
              conditions.show.push("AP, VIA Positive Did u have any intervention done?");
              conditions.hide.push("AP, Papsmear Pos Did u have any intervention done?");
              conditions.hide.push("AP, HPV DNA Neg Date");
              conditions.hide.push("AP, Papsmear Neg Date");
              conditions.hide.push("AP, VIA Neg Date");
              conditions.hide.push("AP, VIAC Neg Date");
        }
        else if (conditionConcept == "AP, Papsmear Pos") {
              conditions.hide.push("AP, HPV Pos-VIAC Pos Did u have any intervention done?");
              conditions.hide.push("AP, VIAC Positive Did u have any intervention done?");
              conditions.hide.push("AP, VIA Positive Did u have any intervention done?");
              conditions.show.push("AP, Papsmear Pos Did u have any intervention done?");
              conditions.hide.push("AP, HPV DNA Neg Date");
              conditions.hide.push("AP, Papsmear Neg Date");
              conditions.hide.push("AP, VIA Neg Date");
              conditions.hide.push("AP, VIAC Neg Date");
        }
        else if (conditionConcept == "AP, HPV DNA Neg") {
              conditions.hide.push("AP, HPV Pos-VIAC Pos Did u have any intervention done?");
              conditions.hide.push("AP, VIAC Positive Did u have any intervention done?");
              conditions.hide.push("AP, VIA Positive Did u have any intervention done?");
              conditions.hide.push("AP, Papsmear Pos Did u have any intervention done?");
              conditions.show.push("AP, HPV DNA Neg Date");
              conditions.hide.push("AP, Papsmear Neg Date");
              conditions.hide.push("AP, VIA Neg Date");
              conditions.hide.push("AP, VIAC Neg Date");
        }
        else if (conditionConcept == "AP, Papsmear Neg") {
              conditions.hide.push("AP, HPV Pos-VIAC Pos Did u have any intervention done?");
              conditions.hide.push("AP, VIAC Positive Did u have any intervention done?");
              conditions.hide.push("AP, VIA Positive Did u have any intervention done?");
              conditions.hide.push("AP, Papsmear Pos Did u have any intervention done?");
              conditions.hide.push("AP, HPV DNA Neg Date");
              conditions.show.push("AP, Papsmear Neg Date");
              conditions.hide.push("AP, VIA Neg Date");
              conditions.hide.push("AP, VIAC Neg Date");
        }
        else if (conditionConcept == "AP, VIA Neg") {
              conditions.hide.push("AP, HPV Pos-VIAC Pos Did u have any intervention done?");
              conditions.hide.push("AP, VIAC Positive Did u have any intervention done?");
              conditions.hide.push("AP, VIA Positive Did u have any intervention done?");
              conditions.hide.push("AP, Papsmear Pos Did u have any intervention done?");
              conditions.hide.push("AP, HPV DNA Neg Date");
              conditions.hide.push("AP, Papsmear Neg Date");
              conditions.show.push("AP, VIA Neg Date");
              conditions.hide.push("AP, VIAC Neg Date");
        }
        else if (conditionConcept == "AP, VIAC Neg") {
              conditions.hide.push("AP, HPV Pos-VIAC Pos Did u have any intervention done?");
              conditions.hide.push("AP, VIAC Positive Did u have any intervention done?");
              conditions.hide.push("AP, VIA Positive Did u have any intervention done?");
              conditions.hide.push("AP, Papsmear Pos Did u have any intervention done?");
              conditions.hide.push("AP, HPV DNA Neg Date");
              conditions.hide.push("AP, Papsmear Neg Date");
              conditions.hide.push("AP, VIA Neg Date");
              conditions.show.push("AP, VIAC Neg Date");
        }
        else {
            conditions.hide.push("AP, HPV Pos-VIAC Pos Did u have any intervention done?",
                                 "AP, VIAC Positive Did u have any intervention done?",
                                 "AP, VIA Positive Did u have any intervention done?",
                                 "AP, Papsmear Pos Did u have any intervention done?",
                                 "AP, HPV DNA Neg Date",
                                 "AP, Papsmear Neg Date",
                                 "AP, VIA Neg Date",
                                 "AP, VIAC Neg Date");
        }
        return conditions;
    },
  'STI Symptoms, Male, Have you been treated for any of the following?' : function (formName, formFieldValues) {
            var conditions = {show: [], hide: []};
            var obj = formFieldValues['STI Symptoms, Male, Have you been treated for any of the following?'];

                     if (obj.indexOf('Syphilis')>=0 ) {
                              conditions.show.push("STI Symptoms, Male, Syphilis Date");
                              } else {
                                conditions.hide.push("STI Symptoms, Male, Syphilis Date");
                              }
                      if (obj.indexOf('Acute scrotal swelling')>=0 ) {
                              conditions.show.push("STI Symptoms, Male, Acute scrotal swelling Date");
                              } else {
                                conditions.hide.push("STI Symptoms, Male, Acute scrotal swelling Date");
                              }
                      if (obj.indexOf('Balanitis')>=0 ) {
                              conditions.show.push("STI Symptoms, Male, Balanitis Date");
                              } else {
                                conditions.hide.push("STI Symptoms, Male, Balanitis Date");
                              }
                     if (obj.indexOf('Genital herpes')>=0 ) {
                              conditions.show.push("STI Symptoms, Male, Genital herpes Date");
                              } else {
                                conditions.hide.push("STI Symptoms, Male, Genital herpes Date");
                              }
                     if (obj.indexOf('Genital ulcer disease')>=0 ) {
                              conditions.show.push("STI Symptoms, Male, Genital ulcer disease Date");
                              } else {
                                conditions.hide.push("STI Symptoms, Male, Genital ulcer disease Date");
                              }
                     if (obj.indexOf('Genital warts')>=0 ) {
                              conditions.show.push("STI Symptoms, Male, Genital Warts Date");
                              } else {
                                conditions.hide.push("STI Symptoms, Male, Genital Warts Date");
                              }
                     if (obj.indexOf('Inguinal Bubo')>=0 ) {
                              conditions.show.push("STI Symptoms, Male, Inguinal Bubo Date");
                              } else {
                                conditions.hide.push("STI Symptoms, Male, Inguinal Bubo Date");
                              }
                     if (obj.indexOf('Pubic Lice')>=0 ) {
                              conditions.show.push("STI Symptoms, Male, Pubic Lice Date");
                              } else {
                                conditions.hide.push("STI Symptoms, Male, Pubic Lice Date");
                              }
                     if (obj.indexOf('Scabies')>=0 ) {
                              conditions.show.push("STI Symptoms, Male, Scabies Date");
                              } else {
                                conditions.hide.push("STI Symptoms, Male, Scabies Date");
                              }
                     if (obj.indexOf('Urethral Discharge Syndrome')>=0 ) {
                              conditions.show.push("STI Symptoms, Male, Urethral Discharge Syndrome Date");
                              } else {
                                conditions.hide.push("STI Symptoms, Male, Urethral Discharge Syndrome Date");
                              }


       return conditions;
        },
  'STI Symptoms, Male, Family Medical History' : function (formName, formFieldValues) {
            var conditions = {show: [], hide: []};
            var obj = formFieldValues['STI Symptoms, Male, Family Medical History'];

                     if (obj.indexOf('Other (specify)')>=0 ) {
                              conditions.show.push("STI Symptoms, Male, Other, Specify");
                              } else {
                                conditions.hide.push("STI Symptoms, Male, Other, Specify");
                              }
        return conditions;
        },
    "STI Symptoms, Male, Client's HIV status": function(formName, formFieldValues) {
         var conditions = {enable: [], disable: []};
         var conditionConcept = formFieldValues["STI Symptoms, Male, Client's HIV status"];
         if (conditionConcept == "Positive") {
              conditions.enable.push("STI Symptoms, Male, Registered for ART");
         }
         else
         {
              conditions.disable.push("STI Symptoms, Male, Registered for ART");
         }
          return conditions;
    },
    "STI Symptoms, Male, Registered for ART": function(formName, formFieldValues) {
         var conditions = {enable: [], disable: []};
         var conditionConcept = formFieldValues['STI Symptoms, Male, Registered for ART'];
         if (conditionConcept == "Yes") {
              conditions.enable.push("STI Symptoms, Male, If Yes");
         }
         else
         {
              conditions.disable.push("STI Symptoms, Male, If Yes");
         }
          return conditions;
    },
    "STI Symptoms, Female, Client's HIV status": function(formName, formFieldValues) {
         var conditions = {enable: [], disable: []};
         var conditionConcept = formFieldValues['STI Symptoms, Female, Client\'s HIV status'];
         if (conditionConcept == "Positive") {
              conditions.enable.push("STI Symptoms, Female, Registered for ART");
         }
         else
         {
              conditions.disable.push("STI Symptoms, Female, Registered for ART");
         }
          return conditions;
    },
    "STI Symptoms, Female, Registered for ART": function(formName, formFieldValues) {
         var conditions = {enable: [], disable: []};
         var conditionConcept = formFieldValues['STI Symptoms, Female, Registered for ART'];
         if (conditionConcept == "Yes") {
              conditions.enable.push("STI Symptoms, Female, If Yes");
         }
         else
         {
              conditions.disable.push("STI Symptoms, Female, If Yes");
         }
          return conditions;
    },
  'STI Symptoms, Female, Family Medical History' : function (formName, formFieldValues) {
            var conditions = {show: [], hide: []};
            var obj = formFieldValues['STI Symptoms, Female, Family Medical History'];

                     if (obj.indexOf('Other (specify)')>=0 ) {
                              conditions.show.push("STI Symptoms, Female, Other, Specify");
                              } else {
                                conditions.hide.push("STI Symptoms, Female, Other, Specify");
                              }
        return conditions;
        },
  'STI Symptoms, Female, Have you been treated for any of the following?' : function (formName, formFieldValues) {
            var conditions = {show: [], hide: []};
            var obj = formFieldValues['STI Symptoms, Female, Have you been treated for any of the following?'];

                     if (obj.indexOf('Syphilis')>=0 ) {
                              conditions.show.push("STI Symptoms, Female, Syphilis Date");
                              } else {
                                conditions.hide.push("STI Symptoms, Female, Syphilis Date");
                              }
                      if (obj.indexOf('Genital herpes')>=0 ) {
                              conditions.show.push("STI Symptoms, Female, Genital herpes Date");
                              } else {
                                conditions.hide.push("STI Symptoms, Female, Genital herpes Date");
                              }
                      if (obj.indexOf('Genital ulcer disease')>=0 ) {
                              conditions.show.push("STI Symptoms, Female, Genital ulcer disease Date");
                              } else {
                                conditions.hide.push("STI Symptoms, Female, Genital ulcer disease Date");
                              }
                     if (obj.indexOf('Genital warts')>=0 ) {
                              conditions.show.push("STI Symptoms, Female, Genital Warts Date");
                              } else {
                                conditions.hide.push("STI Symptoms, Female, Genital Warts Date");
                              }
                     if (obj.indexOf('Inguinal Bubo')>=0 ) {
                              conditions.show.push("STI Symptoms, Female, Inguinal Bubo Date");
                              } else {
                                conditions.hide.push("STI Symptoms, Female, Inguinal Bubo Date");
                              }
                     if (obj.indexOf('Pelvic Inflammatory disease')>=0 ) {
                              conditions.show.push("STI Symptoms, Female, Pelvic Inflammatory Disease Date");
                              } else {
                                conditions.hide.push("STI Symptoms, Female, Pelvic Inflammatory Disease Date");
                              }
                     if (obj.indexOf('Pubic Lice')>=0 ) {
                              conditions.show.push("STI Symptoms, Female, Pubic Lice Date");
                              } else {
                                conditions.hide.push("STI Symptoms, Female, Pubic Lice Date");
                              }
                     if (obj.indexOf('Scabies')>=0 ) {
                              conditions.show.push("STI Symptoms, Female, Scabies Date");
                              } else {
                                conditions.hide.push("STI Symptoms, Female, Scabies Date");
                              }
                     if (obj.indexOf('Vaginal discharge syndrome')>=0 ) {
                              conditions.show.push("STI Symptoms, Female, Vaginal Discharge Syndrome Date");
                              } else {
                                conditions.hide.push("STI Symptoms, Female, Vaginal Discharge Syndrome Date");
                              }

       return conditions;
        },

  "FP Counselling Only, Site Type": function(formName, formFieldValues) {
     var conditions = {show: [], hide: []};
     var conditionConcept = formFieldValues['FP Counselling Only, Site Type'];
     if (conditionConcept =="Outreach") {
          conditions.show.push("FP Counselling Only, District");

     }
     else
     {
          conditions.hide.push("FP Counselling Only, District");
     }
          return conditions;
    },

   "FP Continuation, Site Type": function(formName, formFieldValues) {
     var conditions = {show: [], hide: []};
     var conditionConcept = formFieldValues['FP Continuation, Site Type'];
     if (conditionConcept =="Outreach") {
          conditions.show.push("FP Continuation, District");

     }
     else
     {
          conditions.hide.push("FP Continuation, District");
     }
          return conditions;
  },
  'EAC Form, What could be the possible cause of treatment failure?' : function (formName, formFieldValues) {
            var conditions = {show: [], hide: []};
            var obj = formFieldValues['EAC Form, What could be the possible cause of treatment failure?'];

                     if (obj.indexOf('Drug to drug interaction')>=0 ) {
                              conditions.show.push("EAC Form, Specify drug");
                              } else {
                                conditions.hide.push("EAC Form, Specify drug");
                              }
        return conditions;
        },
   "EAC Form, Have been having unprotected sex?": function(formName, formFieldValues) {
         var conditions = {show: [], hide: []};
         var conditionConcept = formFieldValues['EAC Form, Have been having unprotected sex?'];
         if (conditionConcept == "Yes") {
              conditions.show.push("EAC Form, If Yes, Specify2");
         }
         else
         {
              conditions.hide.push("EAC Form, If Yes, Specify2");
         }
          return conditions;
    },
   "EAC Form, Are you using any other medications or traditional herbs?": function(formName, formFieldValues) {
         var conditions = {show: [], hide: []};
         var conditionConcept = formFieldValues['EAC Form, Are you using any other medications or traditional herbs?'];
         if (conditionConcept == "Yes") {
              conditions.show.push("EAC Form, If Yes, Specify1");
         }
         else
         {
              conditions.hide.push("EAC Form, If Yes, Specify1");
         }
          return conditions;
    },
  'EAC Form, If Yes, Specify1' : function (formName, formFieldValues) {
            var conditions = {show: [], hide: []};
            var obj = formFieldValues['EAC Form, If Yes, Specify1'];

                     if (obj.indexOf('Other (specify)')>=0 ) {
                              conditions.show.push("EAC Form, If Others, Specify");
                              } else {
                                conditions.hide.push("EAC Form, If Others, Specify");
                              }
        return conditions;
        },
   "EAC Form, Have you been taking your drugs daily?": function(formName, formFieldValues) {
         var conditions = {enable: [], disable: []};
         var conditionConcept = formFieldValues['EAC Form, Have you been taking your drugs daily?'];
         if (conditionConcept == "Yes") {
              conditions.enable.push("EAC Form, What time are you taking the drugs?");
              conditions.enable.push("EAC Form, Have you been taking drugs at the same time daily?");
         }
         else
         {
              conditions.disable.push("EAC Form, What time are you taking the drugs?");
              conditions.disable.push("EAC Form, Have you been taking drugs at the same time daily?");
         }
          return conditions;
    },
   "EAC Form, Have you been taking drugs at the same time daily?": function(formName, formFieldValues) {
         var conditions = {enable: [], disable: []};
         var conditionConcept = formFieldValues['EAC Form, Have you been taking drugs at the same time daily?'];
         if (conditionConcept == "No") {
              conditions.enable.push("EAC Form, What challenges are you facing to maintain the same time?");
         }
         else
         {
              conditions.disable.push("EAC Form, What challenges are you facing to maintain the same time?");
         }
          return conditions;
    },

    "Viac Form, HIV STATUS": function(formName, formFieldValues) {
var conditions = {enable: [], disable: [], show: [], hide: []};
var conditionConcept = formFieldValues['Viac Form, HIV STATUS'];
if (conditionConcept == "Positive") {
conditions.show.push("Viac Form,Is the client on treatment?");
}
else
{
conditions.hide.push("Viac Form,Is the client on treatment?");

}
return conditions;
},

'Viac Form,Is the client on treatment?': function (formName, formFieldValues) {
        var conditions = {
              hide: [],
              show: [],
              enable: [],
              disable: []
              };
        var conditionConcept = formFieldValues['Viac Form,Is the client on treatment?'];
        if (conditionConcept == "Yes") {
     
              conditions.show.push("Viac Form,Which line of treatment?");
              conditions.show.push("Viac Form,Combination of drugs");
              conditions.show.push("Viac Form,Which line of treatment?");
              conditions.show.push("Viac Form,Date of initiation");
              conditions.show.push("Viac Form,Latest viral load result");
              conditions.hide.push("Viac Form,Reason for not on treatment");

            }
       else if (conditionConcept == "No") {

            conditions.hide.push("Viac Form,Which line of treatment?");
            conditions.hide.push("Viac Form,Combination of drugs");
            conditions.hide.push("Viac Form,Which line of treatment?");
            conditions.hide.push("Viac Form,Date of initiation");
            conditions.hide.push("Viac Form,Latest viral load result");
            conditions.show.push("Viac Form,Reason for not on treatment");
              }
       else {
conditions.hide.push("Viac Form,Which line of treatment?");
conditions.hide.push("Viac Form,Combination of drugs");
conditions.hide.push("Viac Form,Which line of treatment?");
conditions.hide.push("Viac Form,Date of initiation");
conditions.hide.push("Viac Form,Latest viral load result");
conditions.hide.push("Viac Form,Reason for not on treatment");

          }
        return conditions;
        },

"Viac Form,Combination of drugs": function(formName, formFieldValues) {
       var conditions = {show: [], hide: []};
       var conditionConcept = formFieldValues['Viac Form,Combination of drugs'];
       if (conditionConcept == "Viac Form,Others") {
            conditions.show.push("Viac Form,if others then specify");

       }
       else
       {
            conditions.hide.push("Viac Form,if others then specify");
       }
            return conditions;
    },
"Provider HIV test counselling, Was recency testing done?": function (formName, formFieldValues) {
        var conditions = {
              hide: [],
              show: [],
              enable: [],
              disable: []
              };
        var conditionConcept = formFieldValues["Provider HIV test counselling, Was recency testing done?"];
        if (conditionConcept == "Yes") {
     
            conditions.show.push("Provider HIV test counselling, What was the result?");
            conditions.show.push("Provider HIV test counselling, Date of recency testing result");
            conditions.show.push("Provider HIV test counselling, What was the testing modality used?");
            conditions.hide.push("Provider HIV test counselling, Why was it not done?");

            }
       else if (conditionConcept == "No") {

            conditions.hide.push("Provider HIV test counselling, What was the result?");
            conditions.hide.push("Provider HIV test counselling, Date of recency testing result");
            conditions.hide.push("Provider HIV test counselling, What was the testing modality used?");
            conditions.show.push("Provider HIV test counselling, Why was it not done?");
              }
       else {
            conditions.hide.push("Provider HIV test counselling, What was the result?");
            conditions.hide.push("Provider HIV test counselling, Date of recency testing result");
            conditions.hide.push("Provider HIV test counselling, What was the testing modality used?");
            conditions.hide.push("Provider HIV test counselling, Why was it not done?");

          }
        return conditions;
        },


"Prep Init Form, Was client initiated on PrEP?": function (formName, formFieldValues) {
        var conditions = {
              hide: [],
              show: [],
              enable: [],
              disable: []
              };
        var conditionConcept = formFieldValues["Prep Init Form, Was client initiated on PrEP?"];
        if (conditionConcept == "Yes") {
     
            conditions.show.push("Prep Init Form, Date client initiated on PrEP");
            conditions.show.push("Prep Init Form, Duration of medication");
            conditions.show.push("Prep Init Form, Duration client intends to take prep?");

            }
       else if (conditionConcept == "No") {

            conditions.hide.push("Prep Init Form, Date client initiated on PrEP");
            conditions.hide.push("Prep Init Form, Duration of medication");
            conditions.hide.push("Prep Init Form, Duration client intends to take prep?");
              }
       else {
            conditions.hide.push("Prep Init Form, Date client initiated on PrEP");
            conditions.hide.push("Prep Init Form, Duration of medication");
            conditions.hide.push("Prep Init Form, Duration client intends to take prep?");

          }
        return conditions;
        },

"PrEP ST Form, Client offered PrEP?": function (formName, formFieldValues) {
        var conditions = {
              hide: [],
              show: [],
              enable: [],
              disable: []
              };
        var conditionConcept = formFieldValues["PrEP ST Form, Client offered PrEP?"];
        if (conditionConcept == "Yes") {
     
            conditions.show.push("PrEP ST Form, Client accepted PrEP?");

            }
       else if (conditionConcept == "No") {

            conditions.hide.push("PrEP ST Form, Client accepted PrEP?");

              }
       else {
            conditions.hide.push("PrEP ST Form, Client accepted PrEP?");
          }
        return conditions;
        },

"AIVC, Client initiated on ART": function (formName, formFieldValues) {
        var conditions = {
              hide: [],
              show: [],
              enable: [],
              disable: []
              };
        var conditionConcept = formFieldValues["AIVC, Client initiated on ART"];
        if (conditionConcept == "Yes") {
     
            conditions.show.push("AIVC, Date client initiated on ART");
            conditions.show.push("AIVC, Duration of medication");
            conditions.show.push("AIVC, Next date of medication resupply");

            }
       else if (conditionConcept == "No") {

            conditions.hide.push("AIVC, Date client initiated on ART");
            conditions.hide.push("AIVC, Duration of medication");
            conditions.hide.push("AIVC, Next date of medication resupply");
              }
       else {
             conditions.hide.push("AIVC, Date client initiated on ART");
            conditions.hide.push("AIVC, Duration of medication");
            conditions.hide.push("AIVC, Next date of medication resupply");

          }
        return conditions;
        },

"NCD Form, Clients screened for hypertension": function (formName, formFieldValues) {
        var conditions = {
              hide: [],
              show: [],
              enable: [],
              disable: []
              };
        var conditionConcept = formFieldValues["NCD Form, Clients screened for hypertension"];
        if (conditionConcept == "Yes") {
     

            conditions.show.push("NCD Form, Clients diagnosed with hypertension");
            conditions.show.push("NCD Form, Is hypertension condition controlled");
            conditions.show.push("NCD Form, Hypertension management");

            }
       else if (conditionConcept == "No") {


            conditions.hide.push("NCD Form, Clients diagnosed with hypertension");
            conditions.hide.push("NCD Form, Is hypertension condition controlled");
            conditions.hide.push("NCD Form, Hypertension management");

              }
       else {
            conditions.hide.push("NCD Form, Clients diagnosed with hypertension");
            conditions.hide.push("NCD Form, Is hypertension condition controlled");
            conditions.hide.push("NCD Form, Hypertension management");

          }
        return conditions;
        },

"NCD Form, Clients screened for Type 2 diabetes": function (formName, formFieldValues) {
        var conditions = {
              hide: [],
              show: [],
              enable: [],
              disable: []
              };
        var conditionConcept = formFieldValues["NCD Form, Clients screened for Type 2 diabetes"];
        if (conditionConcept == "Yes") {
     
            conditions.show.push("NCD Form, Clients diagnosed with Type 2 diabetes");
            conditions.show.push("NCD Form, Is Diabetes condition controlled");
            conditions.show.push("NCD Form, Diabetes management – gestational");
            conditions.show.push("NCD Form, Diabetes management – non-gestational");

            }
       else if (conditionConcept == "No") {


            conditions.hide.push("NCD Form, Clients diagnosed with Type 2 diabetes");
            conditions.hide.push("NCD Form, Is Diabetes condition controlled");
            conditions.hide.push("NCD Form, Diabetes management – gestational");
            conditions.hide.push("NCD Form, Diabetes management – non-gestational");

              }
       else {
             conditions.hide.push("NCD Form, Clients diagnosed with Type 2 diabetes");
            conditions.hide.push("NCD Form, Is Diabetes condition controlled");
            conditions.hide.push("NCD Form, Diabetes management – gestational");
            conditions.hide.push("NCD Form, Diabetes management – non-gestational");

          }
        return conditions;
        },

"AP, Activity status": function (formName, formFieldValues) {
    var conditions = {
        hide: [],
        show: [],
    };
    var conditionConcept = formFieldValues["AP, Activity status"];
    if (conditionConcept == "Deceased") {
        conditions.show.push("AP, Cause of death");
        conditions.show.push("AP, Specify Other Infections and Parasitic Disease");
        conditions.show.push("AP, Specify Other Natural Causes");
        conditions.show.push("AP, Specify other Disease or conditions leading to Death");
        conditions.show.push("AP, Date of death");
        conditions.show.push("AP, Program stop date");
        conditions.hide.push("AP, Period initiated on ART before LTFU");
        conditions.hide.push("AP, Date client reported as LTFU");
        conditions.hide.push("AP, Transfer out date");
        conditions.hide.push("AP, Type of transfer out");
        conditions.hide.push("AP, Date client opted out");
        conditions.hide.push("AP, Transfer in Date");
        conditions.hide.push("AP, Date of Reinitiation");
    }
     else if (conditionConcept == "Lost to follow up") {



        conditions.show.push("AP, Period initiated on ART before LTFU");
        conditions.show.push("AP, Date client reported as LTFU");
        conditions.show.push("AP, Program stop date");
        conditions.hide.push("AP, Cause of death");
        conditions.hide.push("AP, Specify Other Infections and Parasitic Disease");
        conditions.hide.push("AP, Specify Other Natural Causes");
        conditions.hide.push("AP, Specify other Disease or conditions leading to Death");
        conditions.hide.push("AP, Date of death");
        conditions.hide.push("AP, Transfer out date");
        conditions.hide.push("AP, Type of transfer out");
        conditions.hide.push("AP, Date client opted out");
        conditions.hide.push("AP, Transfer in Date");
        conditions.hide.push("AP, Date of Reinitiation");




    }



    else if (conditionConcept == "Transfer Out") {



        conditions.show.push("AP, Transfer out date");
        conditions.show.push("AP, Type of transfer out");
        conditions.show.push("AP, Program stop date");
        conditions.hide.push("AP, Cause of death");
        conditions.hide.push("AP, Specify Other Infections and Parasitic Disease");
        conditions.hide.push("AP, Specify Other Natural Causes");
        conditions.hide.push("AP, Specify other Disease or conditions leading to Death");
        conditions.hide.push("AP, Date of death");
        conditions.hide.push("AP, Period initiated on ART before LTFU");
        conditions.hide.push("AP, Date client reported as LTFU");
        conditions.hide.push("AP, Date client opted out");
        conditions.hide.push("AP, Transfer in Date");
        conditions.hide.push("AP, Date of Reinitiation");
    }
     else if (conditionConcept == "Opted out") {
        conditions.show.push("AP, Date client opted out");
        conditions.show.push("AP, Program stop date");
        conditions.hide.push("AP, Cause of death");
        conditions.hide.push("AP, Specify Other Infections and Parasitic Disease");
        conditions.hide.push("AP, Specify Other Natural Causes");
        conditions.hide.push("AP, Specify other Disease or conditions leading to Death");
        conditions.hide.push("AP, Date of death");
        conditions.hide.push("AP, Period initiated on ART before LTFU");
        conditions.hide.push("AP, Date client reported as LTFU");
        conditions.hide.push("AP, Transfer out date");
        conditions.hide.push("AP, Type of transfer out");
        conditions.hide.push("AP, Transfer in Date");
        conditions.hide.push("AP, Date of Reinitiation");



    }



     else if (conditionConcept == "Transfer in") {
        conditions.show.push("AP, Transfer in Date");
        conditions.hide.push("AP, Cause of death");
        conditions.hide.push("AP, Specify Other Infections and Parasitic Disease");
        conditions.hide.push("AP, Specify Other Natural Causes");
        conditions.hide.push("AP, Specify other Disease or conditions leading to Death");
        conditions.hide.push("AP, Date of death");
        conditions.hide.push("AP, Period initiated on ART before LTFU");
        conditions.hide.push("AP, Date client reported as LTFU");
        conditions.hide.push("AP, Transfer out date");
        conditions.hide.push("AP, Type of transfer out");
        conditions.hide.push("AP, Date client opted out");
        conditions.hide.push("AP, Program stop date");
        conditions.hide.push("AP, Date of Reinitiation");




    }




    else if (conditionConcept == "Restarted") {
        conditions.show.push("AP, Date of Reinitiation");



        conditions.hide.push("AP, Cause of death");
        conditions.hide.push("AP, Specify Other Infections and Parasitic Disease");
        conditions.hide.push("AP, Specify Other Natural Causes");
        conditions.hide.push("AP, Specify other Disease or conditions leading to Death");
        conditions.hide.push("AP, Date of death");
        conditions.hide.push("AP, Period initiated on ART before LTFU");
        conditions.hide.push("AP, Date client reported as LTFU");
        conditions.hide.push("AP, Transfer out date");
        conditions.hide.push("AP, Type of transfer out");
        conditions.hide.push("AP, Date client opted out");
        conditions.hide.push("AP, Transfer in Date");
        conditions.hide.push("AP, Program stop date");




    }



    else {
        conditions.hide.push("AP, Cause of death");
        conditions.hide.push("AP, Specify Other Infections and Parasitic Disease");
        conditions.hide.push("AP, Specify Other Natural Causes");
        conditions.hide.push("AP, Specify other Disease or conditions leading to Death");
        conditions.hide.push("AP, Date of death");
        conditions.hide.push("AP, Program stop date");
        conditions.hide.push("AP, Period initiated on ART before LTFU");
        conditions.hide.push("AP, Date client reported as LTFU");
        conditions.hide.push("AP, Program stop date");
        conditions.hide.push("AP, Transfer out date");
        conditions.hide.push("AP, Type of transfer out");
        conditions.hide.push("AP, Program stop date");
        conditions.hide.push("AP, Date client opted out");
        conditions.hide.push("AP, Program stop date");
        conditions.hide.push("AP, Transfer in Date");
        conditions.hide.push("AP, Date of Reinitiation");
    }
        return conditions;
},

"TB History Form Template, Type of Visit": function (formName, formFieldValues) {
        var conditions = {
              hide: [],
              show: [],
              enable: [],
              disable: []
              };
        var conditionConcept = formFieldValues["TB History Form Template, Type of Visit"];
        if (conditionConcept == "Results Entry") {
     

                conditions.hide.push("TB History Form Template, Type of client");
                conditions.hide.push("TB History Form Template, Did you received IPT?");
                conditions.hide.push("TB History Form Template, IPT start date");
                conditions.hide.push("TB History Form Template, Did you complete IPT?");
                conditions.hide.push("TB History Form Template, IPT completion date");
                conditions.hide.push("TB History Form Template, Reason for not completing IPT");
                conditions.hide.push("TB History Form Template, HIV Status");
                conditions.hide.push("TB History Form Template, ART Status");
                conditions.hide.push("TB History Form Template, Where is client getting medication");
                conditions.hide.push("TB History Form Template, Are you on ART?");

                conditions.show.push("TB History Form Template, Gene Xpert Results");
                conditions.show.push("TB History Form Template, RIF Resistance");
                conditions.show.push("TB History Form Template, Screening method used today");
                conditions.show.push("TB History Form Template, Smear (Microscopy) results");
                conditions.show.push("TB History Form Template, Specify method used");
                conditions.show.push("TB History Form Template, Xray results");
                conditions.show.push("TB History Form Template, Type of TB case");
                conditions.show.push("TB History Form Template, Date of last TB treatment");
                conditions.show.push("TB History Form Template, Treatment outcome");
                conditions.show.push("TB History Form Template, Course completion outcomes");


            }
       else if (conditionConcept == "TB Screening") {


                conditions.show.push("TB History Form Template, Type of client");
                conditions.show.push("TB History Form Template, Did you received IPT?");
                conditions.show.push("TB History Form Template, IPT start date");
                conditions.show.push("TB History Form Template, Did you complete IPT?");
                conditions.show.push("TB History Form Template, IPT completion date");
                conditions.show.push("TB History Form Template, Reason for not completing IPT");
                conditions.show.push("TB History Form Template, HIV Status");
                conditions.show.push("TB History Form Template, ART Status");
                conditions.show.push("TB History Form Template, Where is client getting medication");
                conditions.show.push("TB History Form Template, Are you on ART?");

                conditions.show.push("TB History Form Template, Gene Xpert Results");
                conditions.show.push("TB History Form Template, RIF Resistance");
                conditions.show.push("TB History Form Template, Screening method used today");
                conditions.show.push("TB History Form Template, Smear (Microscopy) results");
                conditions.show.push("TB History Form Template, Specify method used");
                conditions.show.push("TB History Form Template, Xray results");
                conditions.show.push("TB History Form Template, Type of TB case");
                conditions.show.push("TB History Form Template, Date of last TB treatment");
                conditions.show.push("TB History Form Template, Treatment outcome");
                conditions.show.push("TB History Form Template, Course completion outcomes");


              }
       else {

                conditions.show.push("TB History Form Template, Type of client");
                conditions.show.push("TB History Form Template, Did you received IPT?");
                conditions.show.push("TB History Form Template, IPT start date");
                conditions.show.push("TB History Form Template, Did you complete IPT?");
                conditions.show.push("TB History Form Template, IPT completion date");
                conditions.show.push("TB History Form Template, Reason for not completing IPT");
                conditions.show.push("TB History Form Template, HIV Status");
                conditions.show.push("TB History Form Template, ART Status");
                conditions.show.push("TB History Form Template, Where is client getting medication");
                conditions.show.push("TB History Form Template, Are you on ART?");

                conditions.show.push("TB History Form Template, Gene Xpert Results");
                conditions.show.push("TB History Form Template, RIF Resistance");
                conditions.show.push("TB History Form Template, Screening method used today");
                conditions.show.push("TB History Form Template, Smear (Microscopy) results");
                conditions.show.push("TB History Form Template, Specify method used");
                conditions.show.push("TB History Form Template, Xray results");
                conditions.show.push("TB History Form Template, Type of TB case");
                conditions.show.push("TB History Form Template, Date of last TB treatment");
                conditions.show.push("TB History Form Template, Treatment outcome");
                conditions.show.push("TB History Form Template, Course completion outcomes");

          }
        return conditions;
        },

"TB History Form Template,Did you received IPT?": function (formName, formFieldValues) {
        var conditions = {
              hide: [],
              show: [],
              enable: [],
              disable: []
              };
        var conditionConcept = formFieldValues["TB History Form Template,Did you received IPT?"];
        if (conditionConcept == "Yes") {
     
                conditions.show.push("TB History Form Template, IPT start date");


            }
       else if (conditionConcept == "No") {

                conditions.hide.push("TB History Form Template, IPT start date");


              }
       else {

          }
        return conditions;
        },

"TB History Form Template, Did you complete IPT?": function (formName, formFieldValues) {
        var conditions = {
              hide: [],
              show: [],
              enable: [],
              disable: []
              };
        var conditionConcept = formFieldValues["TB History Form Template, Did you complete IPT?"];
        if (conditionConcept == "Yes") {
     
                conditions.show.push("TB History Form Template, IPT completion date");
                conditions.hide.push("TB History Form Template, Reason for not completing IPT");


            }
       else if (conditionConcept == "No") {

               conditions.hide.push("TB History Form Template, IPT completion date");
                conditions.show.push("TB History Form Template, Reason for not completing IPT");
              }
       else {

          }
        return conditions;
        },

"TB History Form Template, HIV Status": function (formName, formFieldValues) {
        var conditions = {
              hide: [],
              show: [],
              enable: [],
              disable: []
              };
        var conditionConcept = formFieldValues["TB History Form Template, HIV Status"];
        if (conditionConcept == "Positive") {
     
                conditions.show.push("TB History Form Template, ART Status");
                conditions.show.push("TB History Form Template, Where is client getting medication");
                conditions.show.push("TB History Form Template, Are you on ART?");
                conditions.show.push("TB History Form Template, ART initiation date");


            }
       else if (conditionConcept == "Negative") {

               conditions.hide.push("TB History Form Template, ART Status");
                conditions.hide.push("TB History Form Template, Where is client getting medication");
                conditions.hide.push("TB History Form Template, Are you on ART?");
                conditions.hide.push("TB History Form Template, ART initiation date");

              }
       else {

          }
        return conditions;
        },
 "PrEP ST Form, Site Type": function(formName, formFieldValues) {
     var conditions = {show: [], hide: []};
     var conditionConcept = formFieldValues['PrEP ST Form, Site Type'];
     if (conditionConcept =="Outreach") {
          conditions.show.push("PrEP ST Form, District");

     }
     else
     {
          conditions.hide.push("PrEP ST Form, District");
     }
          return conditions;
  },


   "IPV Form, Site Type": function(formName, formFieldValues) {
     var conditions = {show: [], hide: []};
     var conditionConcept = formFieldValues['IPV Form, Site Type'];
     if (conditionConcept =="Outreach") {
          conditions.show.push("IPV Form, District");

     }
     else
     {
          conditions.hide.push("IPV Form, District");
     }
          return conditions;
  },

  "Referrals Form, Site Type": function(formName, formFieldValues) {
     var conditions = {show: [], hide: []};
     var conditionConcept = formFieldValues['Referrals Form, Site Type'];
     if (conditionConcept =="Outreach") {
          conditions.show.push("Referrals Form, District");

     }
     else
     {
          conditions.hide.push("Referrals Form, District");
     }
          return conditions;
  },

  "NCD Form, Site Type": function(formName, formFieldValues) {
     var conditions = {show: [], hide: []};
     var conditionConcept = formFieldValues['NCD Form, Site Type'];
     if (conditionConcept =="Outreach") {
          conditions.show.push("NCD Form, District");

     }
     else
     {
          conditions.hide.push("NCD Form, District");
     }
          return conditions;
  },

  "TB History Form Template, Site Type": function(formName, formFieldValues) {
     var conditions = {show: [], hide: []};
     var conditionConcept = formFieldValues['TB History Form Template, Site Type'];
     if (conditionConcept =="Outreach") {
          conditions.show.push("TB History Form Template, District");

     }
     else
     {
          conditions.hide.push("TB History Form Template, District");
     }
          return conditions;
  }
}
