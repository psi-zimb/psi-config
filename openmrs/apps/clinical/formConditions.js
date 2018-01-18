Bahmni.ConceptSet.FormConditions.rules = {
    "Medications, Have you ever experienced a drug allergy?": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Medications, Have you ever experienced a drug allergy?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Medications, Which drug(s) are you allerged to?")

        }
        else
        {
            conditions.disable.push("Medications, Which drug(s) are you allerged to?")
        }
        return conditions;

    },
    "Medications, Have you had a rash after taking medications?": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Medications, Have you had a rash after taking medications?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Medications, Location of rash","Medications, Rash Morphology")

        }
        else
        {
            conditions.disable.push("Medications, Location of rash","Medications, Rash Morphology")
        }
        return conditions;

    },
    "Medications, Did you feel nauseated after taking medications?": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Medications, Did you feel nauseated after taking medications?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Medications, Nausea from taking the medications?")

        }
        else
        {
            conditions.disable.push("Medications, Nausea from taking the medications?")
        }
        return conditions;

    },
    "Medications, Vomiting from taking the medications?": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Medications, Vomiting from taking the medications?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Medications, Vomiting occurrence","Medications, Were tablets visible in vomitus?")

        }
        else
        {
            conditions.disable.push("Medications, Vomiting occurrence","Medications, Were tablets visible in vomitus?")
        }
        return conditions;

    },
    "Medications, Have you missed any doses since you visited the clinic?": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Medications, Have you missed any doses since you visited the clinic?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Medications, When did you miss a dose?")

        }
        else
        {
            conditions.disable.push("Medications, When did you miss a dose?")
        }
        return conditions;

    },
    "TB Screening, Have you had a cough?": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['TB Screening, Have you had a cough?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("TB Screening, Type of cough","TB Screening, Cough Duration")

        }
        else
        {
            conditions.disable.push("TB Screening, Type of cough","TB Screening, Cough Duration")
        }
        return conditions;

    },
    "TB Screening, Have you had chest pain?": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['TB Screening, Have you had chest pain?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("TB Screening, Location of chest pains?","TB Screening, When does the chest pain occur?",
                "TB Screening, Chest Pain Duration")

        }
        else
        {
            conditions.disable.push("TB Screening, Location of chest pains?","TB Screening, When does the chest pain occur?",
                "TB Screening, Chest Pain Duration")
        }
        return conditions;

    },
    "TB Screening, Location of chest pains?": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['TB Screening, Location of chest pains?'];
        if (conditionConcept=='Other locations') {
            conditions.enable.push("TB Screening, If other location, specify details")

        }
        else
        {
            conditions.disable.push("TB Screening, If other location, specify details")
        }
        return conditions;

    },
    "TB Screening, When does the chest pain occur?": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['TB Screening, When does the chest pain occur?'];
        if (conditionConcept=='Other') {
            conditions.enable.push("TB Screening, If other, specify details")

        }
        else
        {
            conditions.disable.push("TB Screening, If other, specify details")
        }
        return conditions;

    },
    "TB Screening, Have you had shortness of breath?": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['TB Screening, Have you had shortness of breath?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("TB Screening, Shortness of breath Duration","TB Screening, When does the shortness of breath occur?")

        }
        else
        {
            conditions.disable.push("TB Screening, Shortness of breath Duration","TB Screening, When does the shortness of breath occur?")
        }
        return conditions;

    },
    "TB Screening, Did you have fever recently?": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['TB Screening, Did you have fever recently?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("TB Screening, Duration of fever")

        }
        else
        {
            conditions.disable.push("TB Screening, Duration of fever")
        }
        return conditions;

    },
    "TB Screening, Did you have night sweats?": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['TB Screening, Did you have night sweats?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("TB Screening, Duration of night sweats")

        }
        else
        {
            conditions.disable.push("TB Screening, Duration of night sweats")
        }
        return conditions;

    },
    "TB Screening, Do you have weight loss?": function(formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['TB Screening, Do you have weight loss?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("TB Screening, Duration of weight loss")

        }
        else
        {
            conditions.disable.push("TB Screening, Duration of weight loss")
        }
        return conditions;

    },
	"Partner/Self Currently on F/P": function(formName, formFieldValues) {
		var questionThatTriggersRule = "Partner/Self Currently on F/P"
        var selectedResponses = formFieldValues[questionThatTriggersRule];
		var question1AffectedByRule = "If yes, which method are you/partner using? (Multiple responses possible)"
        var conditionTrue = selectedResponses == 'Yes';
    	var ruleActions = {enable: [], disable: []};
        if(conditionTrue) {
            ruleActions.enable.push(question1AffectedByRule)
        } else {
            ruleActions.disable.push(question1AffectedByRule)
        }
        return ruleActions;
	    },
	"If married/having a partner and individual T&C, Reasons for not  bringing partner  (Multiple responses possible)": function(formName, formFieldValues) {
		var questionThatTriggersRule = "If married/having a partner and individual T&C, Reasons for not  bringing partner  (Multiple responses possible)"
        var selectedResponses = formFieldValues[questionThatTriggersRule];
		var question1AffectedByRule = "Other specific (reasons for not bringing partner)"
        var conditionTrue = selectedResponses.indexOf('Other (specify)') >= 0;
    	var ruleActions = {enable: [], disable: []};
        if(conditionTrue) {
            ruleActions.enable.push(question1AffectedByRule)
        } else {
            ruleActions.disable.push(question1AffectedByRule)
        }
        return ruleActions;
	    },
	"Are you currently coughing?": function(formName, formFieldValues) {
		var questionThatTriggersRule = "Are you currently coughing?"
        var selectedResponses = formFieldValues[questionThatTriggersRule];
		var question1AffectedByRule = "For how long are you been coughing (weeks)?"
        var conditionTrue = selectedResponses == 'Yes' || selectedResponses == 'Not Sure';
    	var ruleActions = {enable: [], disable: []};
        if(conditionTrue) {
            ruleActions.enable.push(question1AffectedByRule)
        } else {
            ruleActions.disable.push(question1AffectedByRule)
        }
        return ruleActions;
	    },
	"Why are you worried/ curious about learning your HIV status?  (Multiple responses possible)": function(formName, formFieldValues) {
		var questionThatTriggersRule = "Why are you worried/ curious about learning your HIV status?  (Multiple responses possible)"
        var selectedResponses = formFieldValues[questionThatTriggersRule];
		var question1AffectedByRule = "Other specific (why worried/curious about HIV status)"
        var conditionTrue = selectedResponses.indexOf('Other (specify)') >= 0;
    	var ruleActions = {enable: [], disable: []};
        if(conditionTrue) {
            ruleActions.enable.push(question1AffectedByRule)
        } else {
            ruleActions.disable.push(question1AffectedByRule)
        }
        return ruleActions;
	    },
	"How did you learn about this T&C site?": function(formName, formFieldValues) {
		var questionThatTriggersRule = "How did you learn about this T&C site?"
        var selectedResponses = formFieldValues[questionThatTriggersRule];
		var question1AffectedByRule = "Other specific (how learned about this T&C site)"
    	var ruleActions = {enable: [], disable: []};
        if(selectedResponses == "Other (specify)") {
            ruleActions.enable.push(question1AffectedByRule)
        } else {
            ruleActions.disable.push(question1AffectedByRule)
        }
        return ruleActions;
	    },
	"Ever been tested": function(formName, formFieldValues) {
		var questionThatTriggersRule = "Ever been tested"
        var selectedResponses = formFieldValues[questionThatTriggersRule];
		var question1AffectedByRule = "If yes, where were you last tested?"
		var question2AffectedByRule = "If ever been tested, how many times have you been tested for HIV before?"
		var question3AffectedByRule = "How long ago were you last tested (months)?"
		var question4AffectedByRule = "What were the results the last time you were tested?"
		var question5AffectedByRule = "Has your most recent sex partner been tested in the last 3 months?"
        var conditionTrue = selectedResponses == 'Yes';
    	var ruleActions = {enable: [], disable: []};
        if(conditionTrue) {
            ruleActions.enable.push(question1AffectedByRule)
            ruleActions.enable.push(question2AffectedByRule)
            ruleActions.enable.push(question3AffectedByRule)
            ruleActions.enable.push(question4AffectedByRule)
            ruleActions.enable.push(question5AffectedByRule)
        } else {
            ruleActions.disable.push(question1AffectedByRule)
            ruleActions.disable.push(question2AffectedByRule)
            ruleActions.disable.push(question3AffectedByRule)
            ruleActions.disable.push(question4AffectedByRule)
            ruleActions.disable.push(question5AffectedByRule)
        }
        return ruleActions;
	    },
	"If client advised to return for re-testing indicate timeline (2 weeks, 4 weeks, 3months, 6 months, other)": function(formName, formFieldValues) {
		var questionThatTriggersRule = "If client advised to return for re-testing indicate timeline (2 weeks, 4 weeks, 3months, 6 months, other)"
        var selectedResponses = formFieldValues[questionThatTriggersRule];
		var question1AffectedByRule = "Other specific (timeline advised to return for re-testing)"
        var conditionTrue = selectedResponses == 'Other (specify)';
    	var ruleActions = {enable: [], disable: []};
        if(conditionTrue) {
            ruleActions.enable.push(question1AffectedByRule)
        } else {
            ruleActions.disable.push(question1AffectedByRule)
        }
        return ruleActions;
	    },
	"Disclosure planned to:  (Multiple responses possible)": function(formName, formFieldValues) {
		var questionThatTriggersRule = "Disclosure planned to:  (Multiple responses possible)"
        var selectedResponses = formFieldValues[questionThatTriggersRule];
		var question1AffectedByRule = "Other specific (disclosure planned to)"
        var conditionTrue = selectedResponses.indexOf('Other (specify)') >= 0;
    	var ruleActions = {enable: [], disable: []};
        if(conditionTrue) {
            ruleActions.enable.push(question1AffectedByRule)
        } else {
            ruleActions.disable.push(question1AffectedByRule)
        }
        return ruleActions;
	    },
	"Risk reduction plan  (Multiple responses possible)": function(formName, formFieldValues) {
		var questionThatTriggersRule = "Risk reduction plan  (Multiple responses possible)"
        var selectedResponses = formFieldValues[questionThatTriggersRule];
		var question1AffectedByRule = "Other specific (risk reduction plan)"
        var conditionTrue = selectedResponses.indexOf('Other (specify)') >= 0;
    	var ruleActions = {enable: [], disable: []};
        if(conditionTrue) {
            ruleActions.enable.push(question1AffectedByRule)
        } else {
            ruleActions.disable.push(question1AffectedByRule)
        }
        return ruleActions;
	    },
        "HEENT, Are you hard on hearing?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HEENT, Are you hard on hearing?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("HEENT, Hearing loss location","HEENT, Hearing loss Duration","HEENT, Additional comments about hearing loss")
        } else {
            conditions.disable.push("HEENT, Hearing loss location","HEENT, Hearing loss Duration","HEENT, Additional comments about hearing loss")
        }
        return conditions;
        },
    "HEENT, Do you have ear discharge?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HEENT, Do you have ear discharge?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("HEENT, Ear discharge location","HEENT, Duration of ear discharge")
        } else {
            conditions.disable.push("HEENT, Ear discharge location","HEENT, Duration of ear discharge")
        }
        return conditions;
        },
    "HEENT, Do you have ear pain?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HEENT, Do you have ear pain?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("HEENT, Ear pain location","HEENT, Ear pain duration", "HEENT, Is pain associated with discharge")
        } else {
            conditions.disable.push("HEENT, Ear pain location","HEENT, Ear pain duration", "HEENT, Is pain associated with discharge")
        }
        return conditions;
        },
    "HEENT, Are you suffering from headaches?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HEENT, Are you suffering from headaches?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("HEENT, Headache location","HEENT, Onset of headache","HEENT, Headache Course","HEENT, Headache Severity","HEENT, Headache Frequency","HEENT, Headache association","HEENT, Duration of Headache","HEENT, Parotid enlargement")
        } else {
            conditions.disable.push("HEENT, Headache location","HEENT, Onset of headache","HEENT, Headache Course","HEENT, Headache Severity","HEENT, Headache Frequency","HEENT, Headache association","HEENT, Duration of Headache","HEENT, Parotid enlargement")
        }
        return conditions;
        },
    "HEENT, Headache location": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HEENT, Headache location'];
        if (conditionConcept.indexOf("Other") >=0) {
            conditions.enable.push("HEENT, If other headache location, specify")
        } else {
            conditions.disable.push("HEENT, If other headache location, specify")
        }
        return conditions;
        },
    "HEENT, Do you have problems with your eyes?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HEENT, Do you have problems with your eyes?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("HEENT, Have you experienced loss of vision", "HEENT, Are Sclerae / conjuctivae normal?","HEENT, Are eyelids normal?","HEENT, Coodinated bilateral eye movements?","HEENT, Pterygium present")
            var YesSelected = formFieldValues['HEENT, Have you experienced loss of vision'];
            var NoSelected = formFieldValues['HEENT, Are Sclerae / conjuctivae normal?'];
            var NoEyeLidsSelected = formFieldValues['HEENT, Are eyelids normal?'];
            var YesPteryiumSelected = formFieldValues['HEENT, Pterygium present'];
            if (YesSelected == "Yes"){
                conditions.enable.push("HEENT, If yes on loss of vision, specify")
            } else {
                conditions.disable.push("HEENT, If yes on loss of vision, specify")
            }
            if (NoSelected == "No"){
                conditions.enable.push("HEENT, If no on conjunctive normal, specify where")
            } else {
                conditions.disable.push("HEENT, If no on conjunctive normal, specify where")
            }
            if (NoEyeLidsSelected == "No"){
                conditions.enable.push("HEENT, If no on normal eyelids, specify where")
            } else {
                conditions.disable.push("HEENT, If no on normal eyelids, specify where")
            }
            if (YesPteryiumSelected == "Yes"){
                conditions.enable.push("HEENT, If yes on pterytium, which side")
            } else {
                conditions.disable.push("HEENT, If yes on pterytium, which side")
            }
        } else {
            conditions.disable.push("HEENT, Have you experienced loss of vision", "HEENT, Are Sclerae / conjuctivae normal?","HEENT, Are eyelids normal?","HEENT, Coodinated bilateral eye movements?","HEENT, Pterygium present")
        }
        return conditions;
        },
    "HEENT, Have you experienced loss of vision": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HEENT, Have you experienced loss of vision'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("HEENT, If yes on loss of vision, specify")
        } else {
            conditions.disable.push("HEENT, If yes on loss of vision, specify")
        }
        return conditions;
        },
    "HEENT, Are Sclerae / conjuctivae normal?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HEENT, Are Sclerae / conjuctivae normal?'];
        if (conditionConcept == "No") {
            conditions.enable.push("HEENT, If no on conjunctive normal, specify where")
        } else {
            conditions.disable.push("HEENT, If no on conjunctive normal, specify where")
        }
        return conditions;
        },
        "HEENT, Are eyelids normal?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HEENT, Are eyelids normal?'];
        if (conditionConcept == "No") {
            conditions.enable.push("HEENT, If no on normal eyelids, specify where")
        } else {
            conditions.disable.push("HEENT, If no on normal eyelids, specify where")
        }
        return conditions;
        },
    "HEENT, Pterygium present": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HEENT, Pterygium present'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("HEENT, If yes on pterytium, which side")
        } else {
            conditions.disable.push("HEENT, If yes on pterytium, which side")
        }
        return conditions;
        },

    "HEENT, Do you suffer from frequent nasal Discharge": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HEENT, Do you suffer from frequent nasal Discharge'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("HEENT, Is the discharge associated with headaches?", "HEENT, Is the discharge associated with swelling of the face?", "HEENT, Is the discharge associated with facial pain?")
        } else {
            conditions.disable.push("HEENT, Is the discharge associated with headaches?", "HEENT, Is the discharge associated with swelling of the face?", "HEENT, Is the discharge associated with facial pain?")
        }
        return conditions;
        },

    "HEENT, Have you noticed any changes in or around the mouth and neck?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HEENT, Have you noticed any changes in or around the mouth and neck?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("HEENT, Have you had sores or non healing ulcers in the mouth?", "HEENT, Have you had blisters or swelling on/around the lips?", "HEENT, Have you had non-healing cracks at the corner of your mouth?", "HEENT, Have you had oral thrush?", "HEENT, Have you had painful or bleeding gums?", "HEENT, Have you had painful teeth?", "HEENT, Have you had painful teeth?", "HEENT, Do you have any other oral conditions?")
            var MNYesSelected = formFieldValues['HEENT, Have you had sores or non healing ulcers in the mouth?'];
            var OralYesSelected = formFieldValues['HEENT, Have you had oral thrush?'];
            var OralOtherSelected = formFieldValues['HEENT, Do you have any other oral conditions?'];

            if (MNYesSelected == "Yes"){
                conditions.enable.push("HEENT, If yes on sores, how often?")
            } else {
                conditions.disable.push("HEENT, If yes on sores, how often?")
            }
            if (OralYesSelected == "Yes"){
                conditions.enable.push("HEENT, Is oral thrus associated with difficulty or pain when swallowing?")
            } else {
                conditions.disable.push("HEENT, Is oral thrus associated with difficulty or pain when swallowing?")
            }
            if (OralOtherSelected == "Yes"){
                conditions.enable.push("HEENT, If yes on other oral condition, specify")
            } else {
                conditions.disable.push("HEENT, If yes on other oral condition, specify")
            }

        } else {
            conditions.disable.push("HEENT, Have you had sores or non healing ulcers in the mouth?", "HEENT, Have you had blisters or swelling on/around the lips?", "HEENT, Have you had non-healing cracks at the corner of your mouth?", "HEENT, Have you had oral thrush?", "HEENT, Have you had painful or bleeding gums?", "HEENT, Have you had painful teeth?", "HEENT, Have you had painful teeth?", "HEENT, Do you have any other oral conditions?")
        }
        return conditions;
        },
    "HEENT, Have you had sores or non healing ulcers in the mouth?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HEENT, Have you had sores or non healing ulcers in the mouth?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("HEENT, If yes on sores, how often?")
        } else {
            conditions.disable.push("HEENT, If yes on sores, how often?")
        }
        return conditions;
        },
    "HEENT, Have you had oral thrush?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HEENT, Have you had oral thrush?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("HEENT, Is oral thrus associated with difficulty or pain when swallowing?")
        } else {
            conditions.disable.push("HEENT, Is oral thrus associated with difficulty or pain when swallowing?")
        }
        return conditions;
        },
    "HEENT, Do you have any other oral conditions?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HEENT, Do you have any other oral conditions?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("HEENT, If yes on other oral condition, specify")
        } else {
            conditions.disable.push("HEENT, If yes on other oral condition, specify")
        }
        return conditions;
        },
    "STI Symptoms, Patients gender": function (formName, formFieldValues) {
        var conditions = {show: [], hide: [], enable: [], disable: []};
        var conditionConcept = formFieldValues['STI Symptoms, Patients gender'];
        if (conditionConcept == "Male") {
            conditions.show.push("STI Symptoms, Male Details")
            conditions.enable.push("STI Symptoms, Male, Have you observed a discharge from the penis?","STI Symptoms, Male, Have you noticed non painful or painful ulcers on or around the penis?","STI Symptoms, Male, Have you had rash with any of the symptoms?", "STI Symptoms, Male, Have you noticed warts on the genital area?", "STI Symptoms, Male, Have you had swelling of your penis or foreskin?", "STI Symptoms, Male, Have you been treated for any of the following?")
            conditions.hide.push("STI Symptoms, Female Details")
            var PenisDischarge = formFieldValues['STI Symptoms, Male, Have you observed a discharge from the penis?'];
            var PenisUlcers = formFieldValues['STI Symptoms, Male, Have you noticed non painful or painful ulcers on or around the penis?'];
            var RashSymptoms = formFieldValues['STI Symptoms, Male, Have you had rash with any of the symptoms?'];
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

        }
        else if (conditionConcept == "Female") {
            conditions.show.push("STI Symptoms, Female Details")
            conditions.enable.push("STI Symptoms, Female, Have you observed a vaginal discharge?","STI Symptoms, Female, Have you noticed non painful of painful ulcers on or around the labia?","STI Symptoms, Female, Have you had rash with any of the symptoms?", "STI Symptoms, Female, Have you noticed warts on the genital area?", "STI Symptoms, Female, Have you had swelling of the labia?", "STI Symptoms, Female, Have you been treated for any of the following?")
            conditions.hide.push("STI Symptoms, Male Details")
            var VagDischarge = formFieldValues['STI Symptoms, Female, Have you observed a vaginal discharge?'];
            var LabiaUlcer = formFieldValues['STI Symptoms, Female, Have you noticed non painful of painful ulcers on or around the labia?'];
            var RashSymptoms = formFieldValues['STI Symptoms, Female, Have you had rash with any of the symptoms?'];
            if (VagDischarge == "Yes") {
                conditions.enable.push("STI Symptoms, Female, If yes on vaginal discharge, specify type")
            } else {
                conditions.disable.push("STI Symptoms, Female, If yes on vaginal discharge, specify type")
            }
            if (VagDischarge == "Yes") {
                conditions.enable.push("STI Symptoms, Female, Duration of the labia ulcer")
            } else {
                conditions.disable.push("STI Symptoms, Female, Duration of the labia ulcer")
            }
            if (VagDischarge == "Yes") {
                conditions.enable.push("STI Symptoms, Female, If yes on rash, location of rash")
            } else {
                conditions.disable.push("STI Symptoms, Female, If yes on rash, location of rash")
            }
        }
        else {
            conditions.hide.push("STI Symptoms, Female Details", "STI Symptoms, Male Details")
        }
        return conditions;
        },
    "STI Symptoms, Male, Have you observed a discharge from the penis?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['STI Symptoms, Male, Have you observed a discharge from the penis?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("STI Symptoms, Male, If yes on penis discharge, specify type")
        } else {
            conditions.disable.push("STI Symptoms, Male, If yes on penis discharge, specify type")
        }
        return conditions;
        },
    "STI Symptoms, Male, Have you noticed non painful or painful ulcers on or around the penis?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['STI Symptoms, Male, Have you noticed non painful or painful ulcers on or around the penis?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("STI Symptoms, Male, Duration of the penis ulcer")
        } else {
            conditions.disable.push("STI Symptoms, Male, Duration of the penis ulcer")
        }
        return conditions;
        },
    "STI Symptoms, Male, Have you had rash with any of the symptoms?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['STI Symptoms, Male, Have you had rash with any of the symptoms?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("STI Symptoms, Male, If yes on rash, location of rash")
        } else {
            conditions.disable.push("STI Symptoms, Male, If yes on rash, location of rash")
        }
        return conditions;
        },
    "STI Symptoms, Female, Have you observed a vaginal discharge?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['STI Symptoms, Female, Have you observed a vaginal discharge?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("STI Symptoms, Female, If yes on vaginal discharge, specify type")
        } else {
            conditions.disable.push("STI Symptoms, Female, If yes on vaginal discharge, specify type")
        }
        return conditions;
        },
    "STI Symptoms, Female, If yes on vaginal discharge, specify type": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['STI Symptoms, Female, If yes on vaginal discharge, specify type'];
        if (conditionConcept.indexOf("Other") >=0) {
            conditions.enable.push("STI Symptoms, Female, Other type of vaginal discharge")
        } else {
            conditions.disable.push("STI Symptoms, Female, Other type of vaginal discharge")
        }
        return conditions;
        },
    "STI Symptoms, Female, Have you noticed non painful of painful ulcers on or around the labia?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['STI Symptoms, Female, Have you noticed non painful of painful ulcers on or around the labia?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("STI Symptoms, Female, Duration of the labia ulcer")
        } else {
            conditions.disable.push("STI Symptoms, Female, Duration of the labia ulcer")
        }
        return conditions;
        },
    "STI Symptoms, Female, Have you had rash with any of the symptoms?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['STI Symptoms, Female, Have you had rash with any of the symptoms?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("STI Symptoms, Female, If yes on rash, location of rash")
        } else {
            conditions.disable.push("STI Symptoms, Female, If yes on rash, location of rash")
        }
        return conditions;
        },
    "BJE, Have you experienced joint pain?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['BJE, Have you experienced joint pain?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("BJE, Location of joint pain", "BJE, Joint pain duration", "BJE, Is the pain associated with swelling of the joint?")
        } else {
            conditions.disable.push("BJE, Location of joint pain", "BJE, Joint pain duration", "BJE, Is the pain associated with swelling of the joint?")
        }
        return conditions;
        },
    "BJE, Have you experienced joint swelling?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['BJE, Have you experienced joint swelling?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("BJE, Location of joint swelling", "BJE, Joint swelling duration", "BJE, Is the joint swelling associated with pain?")
        } else {
            conditions.disable.push("BJE, Location of joint swelling", "BJE, Joint swelling duration", "BJE, Is the joint swelling associated with pain?")
        }
        return conditions;
        },
    "BJE, Abnormal joint mobility": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['BJE, Abnormal joint mobility'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("BJE, If yes on abnormal joint mobility, illustrate")
        } else {
            conditions.disable.push("BJE, If yes on abnormal joint mobility, illustrate")
        }
        return conditions;
        },
    "BJE, Have you experienced chronic back pain?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['BJE, Have you experienced chronic back pain?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("BJE, Does the back pain occur with specific movements?", "BJE, Does the back pain occur at night?", "BJE, Duration of back pain", "BJE, Location of back pain")
            var SpecMov = formFieldValues['BJE, Does the back pain occur with specific movements?'];
            if (SpecMov == "Yes"){
                conditions.enable.push("BJE, If yes, indicate the particular movements")
            } else {
                conditions.disable.push("BJE, If yes, indicate the particular movements")
            }
        } else {
            conditions.disable.push("BJE, Does the back pain occur with specific movements?", "BJE, Does the back pain occur at night?", "BJE, Duration of back pain", "BJE, Location of back pain")
        }
        return conditions;
        },
    "BJE, Does the back pain occur with specific movements?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['BJE, Does the back pain occur with specific movements?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("BJE, If yes, indicate the particular movements")
        } else {
            conditions.disable.push("BJE, If yes, indicate the particular movements")
        }
        return conditions;
        },
    "BJE, Have you experienced muscle aches?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['BJE, Have you experienced muscle aches?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("BJE, Duration of muscle aches?", "BJE, Location of muscle aches")
        }
          else {
            conditions.disable.push("BJE, Duration of muscle aches?", "BJE, Location of muscle aches")
        }
        return conditions;
        },
    "BJE, Do you have any muscular atrophy?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['BJE, Do you have any muscular atrophy?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("BJE, If yes on muscular atrophy, illustrate")
        } else {
            conditions.disable.push("BJE, If yes on muscular atrophy, illustrate")
        }
        return conditions;
        },
    "BJE, Are you currently on NRTIs": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['BJE, Are you currently on NRTIs'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("BJE, If yes on currently on NRTIs, indicate drugs")
        } else {
            conditions.disable.push("BJE, If yes on currently on NRTIs, indicate drugs")
        }
        return conditions;
        },
    "BJE, Clubbing of fingers": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['BJE, Clubbing of fingers'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("BJE, If yes on clubbing of fingers, specify additional information")
        } else {
            conditions.disable.push("BJE, If yes on clubbing of fingers, specify additional information")
        }
        return conditions;
        },

    "GU Tract, Type of Patient": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['GU Tract, Type of Patient'];
        if (conditionConcept == "Male") {
            conditions.enable.push("GU Tract, Male, Are you experiencing any problems when voiding?")
            conditions.disable.push("GU Tract, Female Details", "GU Tract, Child Details")
            var MaleVoidProb = formFieldValues['GU Tract, Male, Are you experiencing any problems when voiding?'];
            if (MaleVoidProb == "Yes") {
                conditions.enable.push("GU Tract, Male, Do you experience hesitancy before voiding?", "GU Tract, Male, Do you experience a burning sensation during micturation?");
            } else {
                conditions.disable.push("GU Tract, Male, Do you experience hesitancy before voiding?", "GU Tract, Male, Do you experience a burning sensation during micturation?");
            }

        }

        else if (conditionConcept == "Female") {
            conditions.enable.push("GU Tract, Female, Are you experiencing any problems when voiding?")
            conditions.disable.push("GU Tract, Male Details", "GU Tract, Child Details")
            var FemaleVoidProb = formFieldValues['GU Tract, Female, Are you experiencing any problems when voiding?'];
            if (FemaleVoidProb == "Yes") {
                conditions.enable.push("GU Tract, Female, Do you experience hesitancy before voiding?", "GU Tract, Female, Do you experience a burning sensation during micturation?")
            } else {
                conditions.disable.push("GU Tract, Female, Do you experience hesitancy before voiding?", "GU Tract, Female, Do you experience a burning sensation during micturation?")
            }
        }

        else if (conditionConcept == "Child") {
            conditions.enable.push("GU Tract, Child, Did the child cry during urination?")
            conditions.disable.push("GU Tract, Male Details", "GU Tract, Female Details")
            var ChildCry = formFieldValues['GU Tract, Child, Did the child cry during urination?'];
            if (ChildCry == "Yes") {
                conditions.enable.push("GU Tract, Child, Have you observed blood in the childs urine?")
            } else {
                conditions.disable.push("GU Tract, Child, Have you observed blood in the childs urine?")
            }
        }

        else {
            conditions.disable.push("GU Tract, Male Details", "GU Tract, Female Details", "GU Tract, Child Details")
        }
        return conditions;
        },
    "GU Tract, Male, Are you experiencing any problems when voiding?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['GU Tract, Male, Are you experiencing any problems when voiding?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("GU Tract, Male, Do you experience hesitancy before voiding?", "GU Tract, Male, Do you experience a burning sensation during micturation?", "GU Tract, Male, Do you have a sense of incomplete voiding?", "GU Tract, Male, Do you need to go more frequently?", "GU Tract, Male, Do you have to get up night?", "GU Tract, Male, Do you feel an urgency for urination?", "GU Tract, Male, Have you observed blood in your urine?", "GU Tract, Male, Have you experienced unintentional loss of urine?", "GU Tract, Male, Have you experienced loss of sexual interest?", "GU Tract, Male, Do you have erectile dysfunction?")
            var BurnMic = formFieldValues['GU Tract, Male, Do you experience a burning sensation during micturation?'];
            if (BurnMic == "Yes"){
                conditions.enable.push("GU Tract, Male, Burning sensation details")
            } else {
                conditions.disable.push("GU Tract, Male, Burning sensation details")
            }
        }
          else {
            conditions.disable.push("GU Tract, Male, Do you experience hesitancy before voiding?", "GU Tract, Male, Do you experience a burning sensation during micturation?", "GU Tract, Male, Do you have a sense of incomplete voiding?", "GU Tract, Male, Do you need to go more frequently?", "GU Tract, Male, Do you have to get up night?", "GU Tract, Male, Do you feel an urgency for urination?", "GU Tract, Male, Have you observed blood in your urine?", "GU Tract, Male, Have you experienced unintentional loss of urine?", "GU Tract, Male, Have you experienced loss of sexual interest?", "GU Tract, Male, Do you have erectile dysfunction?")
        }
        return conditions;
        },
    "GU Tract, Male, Do you experience a burning sensation during micturation?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['GU Tract, Male, Do you experience a burning sensation during micturation?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("GU Tract, Male, Burning sensation details",  "GU Tract, Male, Burning sensation duration")

        } else {
            conditions.disable.push("GU Tract, Male, Burning sensation details", "GU Tract, Male, If burning sensation associated with flank pain, which side", "GU Tract, Male, Burning sensation duration")
        }
        return conditions;
        },
    "GU Tract, Male, Burning sensation details": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['GU Tract, Male, Burning sensation details'];
        if (conditionConcept.indexOf("Associated with flank pain") >=0) {
            conditions.enable.push("GU Tract, Male, If burning sensation associated with flank pain, which side")
        } else {
            conditions.disable.push("GU Tract, Male, If burning sensation associated with flank pain, which side")
        }
        return conditions;
        },
    "GU Tract, Male, Have you observed blood in your urine?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['GU Tract, Male, Have you observed blood in your urine?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("GU Tract, Male, Blood in urine severity", "GU Tract, Male, Duration of blood in urine")
        } else {
            conditions.disable.push("GU Tract, Male, Blood in urine severity", "GU Tract, Male, Duration of blood in urine")
        }
        return conditions;
        },
    "GU Tract, Male, Have you experienced unintentional loss of urine?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['GU Tract, Male, Have you experienced unintentional loss of urine?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("GU Tract, Male, If yes on unintentional loss of urine, specify when")
        } else {
            conditions.disable.push("GU Tract, Male, If yes on unintentional loss of urine, specify when")
        }
        return conditions;
        },
    "GU Tract, Female, Are you experiencing any problems when voiding?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['GU Tract, Female, Are you experiencing any problems when voiding?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("GU Tract, Female, Do you experience hesitancy before voiding?", "GU Tract, Female, Do you experience a burning sensation during micturation?", "GU Tract, Female, Do you have a sense of incomplete voiding?", "GU Tract, Female, Do you need to go more frequently?", "GU Tract, Female, Do you have to get up night?", "GU Tract, Female, Do you feel an urgency for urination?", "GU Tract, Female, Have you observed blood in your urine?", "GU Tract, Female, Have you experienced unintentional loss of urine?", "GU Tract, Female, Lower mid-abdominal (bladder area) tenderness?", "GU Tract, Female, Was it associated with a menstrual period?", "GU Tract, Female, Dyparenuia (painful sexual intercourse)", "GU Tract, Female, Have you experienced loss of sexual interest?")
            var BurnMic = formFieldValues['GU Tract, Female, Do you experience a burning sensation during micturation?'];
            if (BurnMic == "Yes"){
                conditions.enable.push("GU Tract, Female, Burning sensation details")
            } else {
                conditions.disable.push("GU Tract, Female, Burning sensation details")
            }
        }
          else {
            conditions.disable.push("GU Tract, Female, Do you experience hesitancy before voiding?", "GU Tract, Female, Do you experience a burning sensation during micturation?", "GU Tract, Female, Do you have a sense of incomplete voiding?", "GU Tract, Female, Do you need to go more frequently?", "GU Tract, Female, Do you have to get up night?", "GU Tract, Female, Do you feel an urgency for urination?", "GU Tract, Female, Have you observed blood in your urine?", "GU Tract, Female, Have you experienced unintentional loss of urine?", "GU Tract, Female, Lower mid-abdominal (bladder area) tenderness?", "GU Tract, Female, Was it associated with a menstrual period?", "GU Tract, Female, Dyparenuia (painful sexual intercourse)", "GU Tract, Female, Have you experienced loss of sexual interest?")
        }
        return conditions;
        },
    "GU Tract, Female, Do you experience a burning sensation during micturation?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['GU Tract, Female, Do you experience a burning sensation during micturation?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("GU Tract, Female, Burning sensation details",  "GU Tract, Female, Burning sensation duration")

        } else {
            conditions.disable.push("GU Tract, Female, Burning sensation details", "GU Tract, Female, If burning sensation associated with flank pain, which side", "GU Tract, Female, Burning sensation duration")
        }
        return conditions;
        },
    "GU Tract, Female, Burning sensation details": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['GU Tract, Female, Burning sensation details'];
        if (conditionConcept.indexOf("Associated with flank pain") >=0) {
            conditions.enable.push("GU Tract, Female, If burning sensation associated with flank pain, which side")
        } else {
            conditions.disable.push("GU Tract, Female, If burning sensation associated with flank pain, which side")
        }
        return conditions;
        },
    "GU Tract, Female, Have you observed blood in your urine?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['GU Tract, Female, Have you observed blood in your urine?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("GU Tract, Female, Blood in urine severity", "GU Tract, Female, Duration of blood in urine")
        } else {
            conditions.disable.push("GU Tract, Female, Blood in urine severity", "GU Tract, Female, Duration of blood in urine")
        }
        return conditions;
        },
    "GU Tract, Female, Have you experienced unintentional loss of urine?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['GU Tract, Female, Have you experienced unintentional loss of urine?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("GU Tract, Female, If yes on unintentional loss of urine, specify when")
        } else {
            conditions.disable.push("GU Tract, Female, If yes on unintentional loss of urine, specify when")
        }
        return conditions;
        },
    "GU Tract, Child, Did the child cry during urination?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['GU Tract, Child, Did the child cry during urination?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("GU Tract, Child, Have you observed blood in the childs urine?", "GU Tract, Child, Blood in urine severity", "GU Tract, Child, Duration of blood in urine")
        } else {
            conditions.disable.push("GU Tract, Child, Have you observed blood in the childs urine?", "GU Tract, Child, Blood in urine severity", "GU Tract, Child, Duration of blood in urine")
        }
        return conditions;
        },
    "GU Tract, Child, Have you observed blood in the childs urine?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['GU Tract, Child, Have you observed blood in the childs urine?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("GU Tract, Child, Blood in urine severity", "GU Tract, Child, Duration of blood in urine")
        } else {
            conditions.disable.push("GU Tract, Child, Blood in urine severity", "GU Tract, Child, Duration of blood in urine")
        }
        return conditions;
        },
    "Substance Abuse, Do you drink alcoholic beverages?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Substance Abuse, Do you drink alcoholic beverages?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Substance Abuse, Alcohol consumption", "Substance Abuse, What type of alcohol do you drink?")
        } else {
            conditions.disable.push("Substance Abuse, Alcohol consumption", "Substance Abuse, What type of alcohol do you drink?")
        }
        return conditions;
        },
    "Substance Abuse, Do you use illicit drugs": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Substance Abuse, Do you use illicit drugs'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Substance Abuse, What types of illicit drugs do you use and how often?")
        } else {
            conditions.disable.push("Substance Abuse, What types of illicit drugs do you use and how often?")
        }
        return conditions;
        },
    "Substance Abuse, Are you or have you ever been a smoker?": function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Substance Abuse, Are you or have you ever been a smoker?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Substance Abuse, When did you start smoking? (year)", "Substance Abuse, How many cigarettes per day on average?", "Substance Abuse, Have you stopped smoking completely?")
        } else {
            conditions.disable.push("Substance Abuse, When did you start smoking? (year)", "Substance Abuse, How many cigarettes per day on average?", "Substance Abuse, Have you stopped smoking completely?")
        }
        return conditions;
        },
    'LH, Have you had a cough?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['LH, Have you had a cough?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("LH, Type of cough","LH, Duration of the cough")
        } else {
            conditions.disable.push("LH, Type of cough","LH, Duration of the cough")
        }
        return conditions;
         },
     'LH, Have you experienced shortness of breath?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['LH, Have you experienced shortness of breath?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("LH, When does the shortness of breath occur?","LH, Duration of shortness of breath?")
        } else {
            conditions.disable.push("LH, When does the shortness of breath occur?","LH, Duration of shortness of breath?")
        }
        return conditions;
        },
     'LH, Have you had a chest pain?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['LH, Have you had a chest pain?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("LH, Location of the chest pain","LH, Duration of chest pains?")
        } else {
            conditions.disable.push("LH, Location of the chest pain","LH, Duration of chest pains?")
        }
        return conditions;
        },
     'LH, Location of the chest pain': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['LH, Location of the chest pain'];
        if (conditionConcept.indexOf("Other locations") >=0) {
            conditions.enable.push("LH, If other location of the chest pain, specify")
        } else {
            conditions.disable.push("LH, If other location of the chest pain, specify")
        }
        return conditions;
        },
     'LH, Have you had more than one episodes of Pneumonia?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['LH, Have you had more than one episodes of Pneumonia?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("LH, How many episodes of Pneumonia?")
        } else {
            conditions.disable.push("LH, How many episodes of Pneumonia?")
        }
        return conditions;
        },
     'LH, Have you had Pneumocystis Carini Pneumonia?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['LH, Have you had Pneumocystis Carini Pneumonia?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("LH, Date of Pneumocystis Carini Pnemonia?")
        } else {
            conditions.disable.push("LH, Date of Pneumocystis Carini Pnemonia?")
        }
        return conditions;
        },
     'LH, Have you had oedema?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['LH, Have you had oedema?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("LH, If yes on oedema, where?","LH, Oedeme other comments")
        } else {
            conditions.disable.push("LH, If yes on oedema, where?","LH, Oedeme other comments")
        }
        return conditions;
        },
     'LH, Have you experienced wheezing?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['LH, Have you experienced wheezing?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("LH, If yes on wheezing, specify type","LH, Wheezing other comments")
        } else {
            conditions.disable.push("LH, If yes on wheezing, specify type","LH, Wheezing other comments")
        }
        return conditions;
        },
     'LH, Do you have a high blood pressure': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['LH, Do you have a high blood pressure'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("LH, Are you on Hypertensive drugs?","LH, Is your blood pressure controlled?")
         var OnHypersensitiveDrugs = formFieldValues['LH, Are you on Hypertensive drugs?'];
         if (OnHypersensitiveDrugs == "Yes") {
          conditions.enable.push("LH, If yes on Hypertensive drugs, specify")
         } else {
          conditions.disable.push("LH, If yes on Hypertensive drugs, specify")
         }
        } else {
            conditions.disable.push("LH, Are you on Hypertensive drugs?","LH, Is your blood pressure controlled?")
        }
        return conditions;
        },
     'LH, Are you on Hypertensive drugs?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['LH, Are you on Hypertensive drugs?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("LH, If yes on Hypertensive drugs, specify")
        } else {
            conditions.disable.push("LH, If yes on Hypertensive drugs, specify")
        }
        return conditions;
        },

    'TB History, Are you currently being treated for TB?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['TB History, Are you currently being treated for TB?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("TB History, How was the current TB diagnosed?","TB History, Location of current TB")
         var OtherMethod = formFieldValues['TB History, How was the current TB diagnosed?'];
         var OtherLocation = formFieldValues['TB History, Location of current TB'];
         if (OtherMethod == "Other") {
          conditions.enable.push("TB History, If other for current TB diagnosed, specify")
         } else {
          conditions.disable.push("TB History, If other for current TB diagnosed, specify")
         }
         if (OtherLocation == "Other") {
                conditions.enable.push("TB History, If other for current TB location, specify")
            } else {
                conditions.disable.push("TB History, If other for current TB location, specify")
            }
        } else {
            conditions.disable.push("TB History, How was the current TB diagnosed?","TB History, Location of current TB")
        }
        return conditions;
        },
     'TB History, How was the current TB diagnosed?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['TB History, How was the current TB diagnosed?'];
        if (conditionConcept == "Other") {
            conditions.enable.push("TB History, If other for current TB diagnosed, specify")
        } else {
            conditions.disable.push("TB History, If other for current TB diagnosed, specify")
        }
        return conditions;
        },
     'TB History, Location of current TB': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['TB History, Location of current TB'];
        if (conditionConcept == "Other") {
            conditions.enable.push("TB History, If other for current TB location, specify")
        } else {
            conditions.disable.push("TB History, If other for current TB location, specify")
        }
        return conditions;
        },
     'TB History, Have been treated for TB before?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['TB History, Have been treated for TB before?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("TB History, How was the previous TB diagnosed?","TB History, Location of previous TB","TB History, How many episodes of TB?","TB History, When were you treated for TB","TB History, Where were you last treated?","TB History, Was treatment interupted?")
            var OtherMethod = formFieldValues['TB History, How was the previous TB diagnosed?'];
            var OtherLocation = formFieldValues['TB History, Location of previous TB'];
            if (OtherMethod == "Other") {
                conditions.enable.push("TB History, If other for previous TB diagnosed, specify")
            } else {
                conditions.disable.push("TB History, If other for previous TB diagnosed, specify")
            }
            if (OtherLocation == "Other") {
                conditions.enable.push("TB History, If other for previous TB location, specify")
            } else {
                conditions.disable.push("TB History, If other for previous TB location, specify")
            }
        } else {
            conditions.disable.push("TB History, How was the previous TB diagnosed?","TB History, Location of previous TB","TB History, How many episodes of TB?","TB History, When were you treated for TB","TB History, Where were you last treated?","TB History, Was treatment interupted?")
        }
        return conditions;
        },
        'TB History, How was the previous TB diagnosed?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['TB History, How was the previous TB diagnosed?'];
        if (conditionConcept == "Other") {
            conditions.enable.push("TB History, If other for previous TB diagnosed, specify")
        } else {
            conditions.disable.push("TB History, If other for previous TB diagnosed, specify")
        }
        return conditions;
        },
        'TB History, Location of previous TB': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['TB History, Location of previous TB'];
        if (conditionConcept == "Other") {
            conditions.enable.push("TB History, If other for previous TB location, specify")
        } else {
            conditions.disable.push("TB History, If other for previous TB location, specify")
        }
        return conditions;
        },
     'TB History, Has you mother or caregiver been treated for TB? (for children under 5)': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['TB History, Has you mother or caregiver been treated for TB? (for children under 5)'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("TB History, Did you received IPT?")
        } else {
            conditions.disable.push("TB History, Did you received IPT?")
        }
        return conditions;
        },
     'Provider TB History, Has you mother or caregiver been treated for TB? (for children under 5)': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Provider TB History, Has you mother or caregiver been treated for TB? (for children under 5)'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Provider TB History, Did you received IPT?")
        } else {
            conditions.disable.push("Provider TB History, Did you received IPT?")
        }
        return conditions;
        },
    'Abuse, Have you experienced or are you experiencing any form of non-sexual abuse?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Abuse, Have you experienced or are you experiencing any form of non-sexual abuse?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Abuse, If yes on non-sexual abuse, specify type")
        } else {
            conditions.disable.push("Abuse, If yes on non-sexual abuse, specify type")
        }
        return conditions;
        },
    'Abuse, Have you been sexually abused?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Abuse, Have you been sexually abused?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Abuse, Has a police report been filed?","Abuse, Did you receive any medical treatment afterwards?","Abuse, Did you receive counseling?")
        } else {
            conditions.disable.push("Abuse, Has a police report been filed?","Abuse, Did you receive any medical treatment afterwards?","Abuse, Did you receive counseling?")
        }
        return conditions;
        },

    'HIV Prevention, Are you sexually active?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HIV Prevention, Are you sexually active?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("HIV Prevention, Age of sexual debut","HIV Prevention, Sexual partners","HIV Prevention, Do you use condoms every time you have sex?")
         var OtherPartners = formFieldValues['HIV Prevention, Sexual partners'];
         var CondomUse = formFieldValues['HIV Prevention, Do you use condoms every time you have sex?'];
         if (OtherPartners == "Other partners") {
          conditions.enable.push("HIV Prevention, If other partners, specify how many")
         } else {
          conditions.disable.push("HIV Prevention, If other partners, specify how many")
         }
         if (CondomUse == "Yes") {
          conditions.enable.push("HIV Prevention, Male condom use","HIV Prevention, Female condom use")
         } else {
          conditions.disable.push("HIV Prevention, Male condom use","HIV Prevention, Female condom use")
         }
        } else {
            conditions.disable.push("HIV Prevention, Age of sexual debut","HIV Prevention, Sexual partners","HIV Prevention, Do you use condoms every time you have sex?")
        }
        return conditions;
        },
     'HIV Prevention, Sexual partners': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HIV Prevention, Sexual partners'];
        if (conditionConcept == "Other partners") {
            conditions.enable.push("HIV Prevention, If other partners, specify how many")
        } else {
            conditions.disable.push("HIV Prevention, If other partners, specify how many")
        }
        return conditions;
        },
     'HIV Prevention, Do you use condoms every time you have sex?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HIV Prevention, Do you use condoms every time you have sex?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("HIV Prevention, Male condom use","HIV Prevention, Female condom use")
        } else {
            conditions.disable.push("HIV Prevention, Male condom use","HIV Prevention, Female condom use")
        }
        return conditions;
        },

      'Skin, Do you have any skin problems?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Skin, Do you have any skin problems?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Skin, Have you had a skin rash recently?","Skin, Have you ever had Herpes zoster / shingles?","Skin, Is your skin inflammed?","Skin, Have you ever had any of the following?","Skin, Fungal infections?","Skin, Pruritis / Prurigo","Skin, Papular pruritic eruptions","Skin, Have you ever had Kaposi Sarcoma?","Skin, Have you observed a lump growing?")
         var SkinRashRecently = formFieldValues['Skin, Have you had a skin rash recently?'];
         var HerpesShingles = formFieldValues['Skin, Have you ever had Herpes zoster / shingles?'];
         var SkinInflammed = formFieldValues['Skin, Is your skin inflammed?'];
         var FungalInfections = formFieldValues['Skin, Fungal infections?'];
         var Pruritis = formFieldValues['Skin, Pruritis / Prurigo'];
         var KaposiSarcoma = formFieldValues['Skin, Have you ever had Kaposi Sarcoma?'];
         var LumpGrow = formFieldValues['Skin, Have you observed a lump growing?'];
         if (SkinRashRecently == "Yes") {
          conditions.enable.push("Skin, Did the skin rash start after taking new medications","Skin, Did you experience any itching with the rash?","Skin, Morphology of rash","Skin, Date rash started","Skin, Location of the skin rash")
         } else {
          conditions.disable.push("Skin, Did the skin rash start after taking new medications","Skin, Did you experience any itching with the rash?","Skin, Morphology of rash","Skin, Date rash started","Skin, Location of the skin rash")
         }
         if (HerpesShingles == "Yes") {
          conditions.enable.push("Skin, Herpes Zoster (scars)?","Skin, Shingles dates")
         } else {
          conditions.disable.push("Skin, Herpes Zoster (scars)?","Skin, Shingles dates")
         }
            if (SkinInflammed == "Yes") {
                conditions.enable.push("Skin, If yes on skin inflammed, specify type")
            } else {
                conditions.disable.push("Skin, If yes on skin inflammed, specify type")
            }
            if (FungalInfections == "Yes") {
                conditions.enable.push("Skin, If yes on fungal infections, where")
            } else {
                conditions.disable.push("Skin, If yes on fungal infections, where")
            }
            if (Pruritis == "Yes") {
                conditions.enable.push("Skin, If yes on Pruritis, specify type")
            } else {
                conditions.disable.push("Skin, If yes on Pruritis, specify type")
            }
            if (KaposiSarcoma == "Yes") {
                conditions.enable.push("Skin, Location of Kaposi Sarcoma","Skin, Kaposi Sarcoma Lesions present")
            } else {
                conditions.disable.push("Skin, Location of Kaposi Sarcoma","Skin, Kaposi Sarcoma Lesions present")
            }
            if (LumpGrow == "Yes") {
                conditions.enable.push("Skin, Location of lump","Skin, Duration of lump","Skin, Is the lump growing in size?")
            } else {
                conditions.disable.push("Skin, Location of lump","Skin, Duration of lump","Skin, Is the lump growing in size?")
            }
     } else {
            conditions.disable.push("Skin, Have you had a skin rash recently?","Skin, Have you ever had Herpes zoster / shingles?","Skin, Is your skin inflammed?","Skin, Have you ever had any of the following?","Skin, Fungal infections?","Skin, Pruritis / Prurigo","Skin, Papular pruritic eruptions","Skin, Have you ever had Kaposi Sarcoma?","Skin, Have you observed a lump growing?")
        }
        return conditions;
        },
    'Skin, Have you had a skin rash recently?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Skin, Have you had a skin rash recently?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Skin, Did the skin rash start after taking new medications","Skin, Did you experience any itching with the rash?","Skin, Morphology of rash","Skin, Date rash started"
                ,"Skin, Location of the skin rash","Skin, Images of location of rash section")
         var AfterNewMeds = formFieldValues['Skin, Did the skin rash start after taking new medications'];
         var Itching = formFieldValues['Skin, Did you experience any itching with the rash?'];
         if (AfterNewMeds == "Yes") {
          conditions.enable.push("Skin, How long after taking the new medication?")
         } else {
          conditions.disable.push("Skin, How long after taking the new medication?")
         }
         if (Itching == "Yes") {
                conditions.enable.push("Skin, Severity of itchiness")
            } else {
                conditions.disable.push("Skin, Severity of itchiness")
            }
        } else {
            conditions.disable.push("Skin, Did the skin rash start after taking new medications","Skin, Did you experience any itching with the rash?","Skin, Morphology of rash","Skin, Date rash started"
                ,"Skin, Location of the skin rash","Skin, Images of location of rash section")
        }
        return conditions;
        },
     'Skin, Did the skin rash start after taking new medications': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Skin, Did the skin rash start after taking new medications'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Skin, How long after taking the new medication?")
        } else {
            conditions.disable.push("Skin, How long after taking the new medication?")
        }
        return conditions;
        },
     'Skin, Did you experience any itching with the rash?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Skin, Did you experience any itching with the rash?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Skin, Severity of itchiness")
        } else {
            conditions.disable.push("Skin, Severity of itchiness")
        }
        return conditions;
        },
     'Skin, Have you ever had Herpes zoster / shingles?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Skin, Have you ever had Herpes zoster / shingles?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Skin, Herpes Zoster (scars)?","Skin, Shingles dates")
         var Scars = formFieldValues['Skin, Herpes Zoster (scars)?'];
         if (Scars == "Yes") {
          conditions.enable.push("Skin, Location of the Shingles","Skin, Images of location of shingles section")
         } else {
          conditions.disable.push("Skin, Location of the Shingles","Skin, Images of location of shingles section")
         }
        } else {
            conditions.disable.push("Skin, Herpes Zoster (scars)?","Skin, Shingles dates")
        }
        return conditions;
        },
     'Skin, Herpes Zoster (scars)?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Skin, Herpes Zoster (scars)?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Skin, Location of the Shingles","Skin, Images of location of shingles section")
        } else {
            conditions.disable.push("Skin, Location of the Shingles","Skin, Images of location of shingles section")
        }
        return conditions;
        },
     'Skin, Is your skin inflammed?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Skin, Is your skin inflammed?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Skin, If yes on skin inflammed, specify type")
         
        } else {
            conditions.disable.push("Skin, If yes on skin inflammed, specify type")
        }
        return conditions;
        },
     'Skin, If yes on skin inflammed, specify type': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Skin, If yes on skin inflammed, specify type'];
        if (conditionConcept.indexOf('Other') >= 0) {
            conditions.enable.push("Skin, Specify other inflammation type")
        } else {
            conditions.disable.push("Skin, Specify other inflammation type")
        }
        return conditions;
        },
     'Skin, Fungal infections?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Skin, Fungal infections?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Skin, If yes on fungal infections, where")
        } else {
            conditions.disable.push("Skin, If yes on fungal infections, where")
        }
        return conditions;
        },
    'Skin, Pruritis / Prurigo': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Skin, Pruritis / Prurigo'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Skin, If yes on Pruritis, specify type")
        } else {
            conditions.disable.push("Skin, If yes on Pruritis, specify type")
        }
        return conditions;
        },
     'Skin, Have you ever had Kaposi Sarcoma?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Skin, Have you ever had Kaposi Sarcoma?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Skin, Location of Kaposi Sarcoma","Skin, Kaposi Sarcoma Lesions present")
        } else {
            conditions.disable.push("Skin, Location of Kaposi Sarcoma","Skin, Kaposi Sarcoma Lesions present")
        }
        return conditions;
        },
     'Skin, Have you observed a lump growing?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Skin, Have you observed a lump growing?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Skin, Location of lump","Skin, Duration of lump","Skin, Is the lump growing in size?")
        } else {
            conditions.disable.push("Skin, Location of lump","Skin, Duration of lump","Skin, Is the lump growing in size?")
        }
        return conditions;
        },
    'HIV Testing, Have you had a positive HIV test?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HIV Testing, Have you had a positive HIV test?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("HIV Testing, When was the test done?","HIV Testing, Do you have a copy of the test result?","HIV Testing, Why was the test done?","HIV Testing, Do you have a partner?","HIV Testing, Have you ever had a Negative HIV test?","HIV Testing, Do you have any children?","HIV Testing, Is any of your other family members HIV Positive?")
         var WhyTestDone = formFieldValues['HIV Testing, Why was the test done?'];
         var Partner = formFieldValues['HIV Testing, Do you have a partner?'];
         var NegHIVTest = formFieldValues['HIV Testing, Have you ever had a Negative HIV test?'];
         var Children = formFieldValues['HIV Testing, Do you have any children?'];
         var FamilyMemHIVPos = formFieldValues['HIV Testing, Is any of your other family members HIV Positive?'];
         if (WhyTestDone == "Other") {
          conditions.enable.push("HIV Testing, If other reason for test, specify why")
         } else {
          conditions.disable.push("HIV Testing, If other reason for test, specify why")
         }
            if (Partner == "Yes") {
                conditions.enable.push("HIV Testing, Is your (sexual) partner aware of your HIV status?","HIV Testing, Has your partner been tested?","HIV Testing, Is your (sexual) partner aware of his/her HIV status?")
            } else {
                conditions.disable.push("HIV Testing, Is your (sexual) partner aware of your HIV status?","HIV Testing, Has your partner been tested?","HIV Testing, Is your (sexual) partner aware of his/her HIV status?")
            }
            if (NegHIVTest == "Yes") {
                conditions.enable.push("HIV Testing, When was the negative test done?")
            } else {
                conditions.disable.push("HIV Testing, When was the negative test done?")
            }
            if (Children == "Yes") {
                conditions.enable.push("HIV Testing, How many children do you have?","HIV Testing, Has any of your children tested?")
            } else {
                conditions.disable.push("HIV Testing, How many children do you have?","HIV Testing, Has any of your children tested?")
            }
            if (FamilyMemHIVPos == "Yes") {
                conditions.enable.push("HIV Testing, Are they receiving HIV care?")
            } else {
                conditions.disable.push("HIV Testing, Are they receiving HIV care?")
            }
        } else {
            conditions.disable.push("HIV Testing, When was the test done?","HIV Testing, Do you have a copy of the test result?","HIV Testing, Why was the test done?","HIV Testing, Do you have a partner?","HIV Testing, Have you ever had a Negative HIV test?","HIV Testing, Do you have any children?","HIV Testing, Is any of your other family members HIV Positive?")
        }
        return conditions;
        },
     'HIV Testing, Why was the test done?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HIV Testing, Why was the test done?'];
        if (conditionConcept == "Other") {
            conditions.enable.push("HIV Testing, If other reason for test, specify why")
        } else {
            conditions.disable.push("HIV Testing, If other reason for test, specify why")
        }
        return conditions;
        },
     'HIV Testing, Do you have a partner?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HIV Testing, Do you have a partner?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("HIV Testing, Is your (sexual) partner aware of your HIV status?","HIV Testing, Has your partner been tested?","HIV Testing, Is your (sexual) partner aware of his/her HIV status?")
         var PartnerAware = formFieldValues['HIV Testing, Is your (sexual) partner aware of his/her HIV status?'];
         if (PartnerAware == "Yes") {
          conditions.enable.push("HIV Testing, If yes, what is the partners HIV status")
         } else {
          conditions.disable.push("HIV Testing, If yes, what is the partners HIV status")
         }
        } else {
            conditions.disable.push("HIV Testing, Is your (sexual) partner aware of your HIV status?","HIV Testing, Has your partner been tested?","HIV Testing, Is your (sexual) partner aware of his/her HIV status?")
        }
        return conditions;
        },
     'HIV Testing, Is your (sexual) partner aware of his/her HIV status?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HIV Testing, Is your (sexual) partner aware of his/her HIV status?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("HIV Testing, If yes, what is the partners HIV status")
        } else {
            conditions.disable.push("HIV Testing, If yes, what is the partners HIV status")
        }
        return conditions;
        },
     'HIV Testing, Have you ever had a Negative HIV test?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HIV Testing, Have you ever had a Negative HIV test?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("HIV Testing, When was the negative test done?")
        } else {
            conditions.disable.push("HIV Testing, When was the negative test done?")
        }
        return conditions;
        },
    'HIV Testing, Do you have any children?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HIV Testing, Do you have any children?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("HIV Testing, How many children do you have?","HIV Testing, Has any of your children tested?")
         var ChildrenTested = formFieldValues['HIV Testing, Has any of your children tested?'];
         if (ChildrenTested == "Yes") {
          conditions.enable.push("HIV Testing, Number of Children HIV positive","HIV Testing, Number of children HIV negative","HIV Testing, Number of children not tested")
         } else {
          conditions.disable.push("HIV Testing, Number of Children HIV positive","HIV Testing, Number of children HIV negative","HIV Testing, Number of children not tested")
         }
        } else {
            conditions.disable.push("HIV Testing, How many children do you have?","HIV Testing, Has any of your children tested?")
        }
        return conditions;
        },
     'HIV Testing, Has any of your children tested?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HIV Testing, Has any of your children tested?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("HIV Testing, Number of Children HIV positive","HIV Testing, Number of children HIV negative","HIV Testing, Number of children not tested")
        } else {
            conditions.disable.push("HIV Testing, Number of Children HIV positive","HIV Testing, Number of children HIV negative","HIV Testing, Number of children not tested")
        }
        return conditions;
        },
     'HIV Testing, Is any of your other family members HIV Positive?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['HIV Testing, Is any of your other family members HIV Positive?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("HIV Testing, Are they receiving HIV care?")
        } else {
            conditions.disable.push("HIV Testing, Are they receiving HIV care?")
        }
        return conditions;
        },

    'GI Tract, Do you have difficulty swallowing?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['GI Tract, Do you have difficulty swallowing?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("GI Tract, Is swallowing painful","GI Tract, Swallowing difficulty details","GI Tract, Swallowing difficulty duration")
        } else {
            conditions.disable.push("GI Tract, Is swallowing painful","GI Tract, Swallowing difficulty details","GI Tract, Swallowing difficulty duration")
        }
        return conditions;
        },
     'GI Tract, Do you have frequent nausea?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['GI Tract, Do you have frequent nausea?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("GI Tract, Nausea severity")
        } else {
            conditions.disable.push("GI Tract, Nausea severity")
        }
        return conditions;
        },
     'GI Tract, Do you vomit frequently?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['GI Tract, Do you vomit frequently?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("GI Tract, When do you vomit?","GI Tract, Vomit content")
         var VomitOther = formFieldValues['GI Tract, When do you vomit?'];
         if (VomitOther == "Other") {
          conditions.enable.push("GI Tract, If other on vomit, specify")
         } else {
          conditions.disable.push("GI Tract, If other on vomit, specify")
         }
        } else {
            conditions.disable.push("GI Tract, When do you vomit?","GI Tract, Vomit content")
        }
        return conditions;
        },
          'GI Tract, When do you vomit?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['GI Tract, When do you vomit?'];
        if (conditionConcept == "Other") {
            conditions.enable.push("GI Tract, If other on vomit, specify")
        } else {
            conditions.disable.push("GI Tract, If other on vomit, specify")
        }
        return conditions;
        },
        'GI Tract, Vomit content': function (formName, formFieldValues) {
            var conditions = {enable: [], disable: []};
            var conditionConcept = formFieldValues['GI Tract, Vomit content'];
            if (conditionConcept == "Other") {
                conditions.enable.push("GI Tract, If other, specify details of vomit content")
            } else {
                conditions.disable.push("GI Tract, If other, specify details of vomit content")
            }
            return conditions;
        },
         'GI Tract, Do you suffer from heartburn?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['GI Tract, Do you suffer from heartburn?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("GI Tract, When does the heartburn occur?")
        } else {
            conditions.disable.push("GI Tract, When does the heartburn occur?")
        }
        return conditions;
        },
     'GI Tract, Do you have frequent diarrhea?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['GI Tract, Do you have frequent diarrhea?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("GI Tract, Diarrhea Details","GI Tract, Diarrhea duration")
        } else {
            conditions.disable.push("GI Tract, Diarrhea Details","GI Tract, Diarrhea duration")
        }
        return conditions;
        },
     'GI Tract, Do you have frequent abdominal pain?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['GI Tract, Do you have frequent abdominal pain?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("GI Tract, Abdominal pain location","GI Tract, Abdominal pain type","GI Tract, Abdominal pain duration","GI Tract, Does the abdominal pain occur during fasting?")
        } else {
            conditions.disable.push("GI Tract, Abdominal pain location","GI Tract, Abdominal pain type","GI Tract, Abdominal pain duration","GI Tract, Does the abdominal pain occur during fasting?")
        }
        return conditions;
        },
     'GI Tract, Are you frequently constipated?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['GI Tract, Are you frequently constipated?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("GI Tract, Duration of constipation?")
        } else {
            conditions.disable.push("GI Tract, Duration of constipation?")
        }
        return conditions;
        },
     'GI Tract, Have you experienced abdominal swelling?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['GI Tract, Have you experienced abdominal swelling?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("GI Tract, Duration of abdominal swelling")
        } else {
            conditions.disable.push("GI Tract, Duration of abdominal swelling")
        }
        return conditions;
        },

    'Contact Tracing, Has your partner been tested?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Contact Tracing, Has your partner been tested?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Contact Tracing, If Yes, what was the result")
         conditions.disable.push("Contact Tracing, If Not tested, why have they not been tested?")
         var Result = formFieldValues['Contact Tracing, If Yes, what was the result'];
         if (Result == "Positive") {
          conditions.enable.push("Contact Tracing, If Positive, are they on ART or No")
          conditions.disable.push("Contact Tracing, If Negative, when was the last test done")
         } else if (Result == "Negative") {
          conditions.enable.push("Contact Tracing, If Negative, when was the last test done")
          conditions.disable.push("Contact Tracing, If Positive, are they on ART or No")
         } else {
          conditions.disable.push("Contact Tracing, If Positive, are they on ART or No","Contact Tracing, If Negative, when was the last test done")
         }
        } else if (conditionConcept == "No") {
         conditions.enable.push("Contact Tracing, If Not tested, why have they not been tested?")
            conditions.disable.push("Contact Tracing, If Yes, what was the result")
         var WhyNotTested = formFieldValues['Contact Tracing, If Not tested, why have they not been tested?'];
         if (WhyNotTested == "Too Busy") {
          conditions.enable.push("Contact Tracing, If they are too busy, would you be comfortable in us visiting your home to provide the HIV testing?")
         } else {
          conditions.disable.push("Contact Tracing, If they are too busy, would you be comfortable in us visiting your home to provide the HIV testing?")
         }
        } else {
         conditions.disable.push("Contact Tracing, If Yes, what was the result","Contact Tracing, If Not tested, why have they not been tested?")
     }
        return conditions;
        },
     'Contact Tracing, If Yes, what was the result': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Contact Tracing, If Yes, what was the result'];
        if (conditionConcept == "Positive") {
            conditions.enable.push("Contact Tracing, If Positive, are they on ART or No")
            conditions.disable.push("Contact Tracing, If Negative, when was the last test done")
        } else if (conditionConcept == "Negative") {
            conditions.enable.push("Contact Tracing, If Negative, when was the last test done")
            conditions.disable.push("Contact Tracing, If Positive, are they on ART or No")
        } else {
            conditions.disable.push("Contact Tracing, If Positive, are they on ART or No","Contact Tracing, If Negative, when was the last test done")
        }
        return conditions;
        },
     'Contact Tracing, If Not tested, why have they not been tested?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Contact Tracing, If Not tested, why have they not been tested?'];
        if (conditionConcept == "Too Busy") {
            conditions.enable.push("Contact Tracing, If they are too busy, would you be comfortable in us visiting your home to provide the HIV testing?")
         var HomeVisit = formFieldValues['Contact Tracing, If they are too busy, would you be comfortable in us visiting your home to provide the HIV testing?'];
         if (HomeVisit == "Yes") {
          conditions.enable.push("Contact Tracing, Would you mind if we call to check when you are ready for the test","Contact Tracing, After how long do you think we should call you")
         } else {
          conditions.disable.push("Contact Tracing, Would you mind if we call to check when you are ready for the test","Contact Tracing, After how long do you think we should call you")
         }
        } else {
            conditions.disable.push("Contact Tracing, If they are too busy, would you be comfortable in us visiting your home to provide the HIV testing?")
        }
        return conditions;
        },
     'Contact Tracing, If they are too busy, would you be comfortable in us visiting your home to provide the HIV testing?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Contact Tracing, If they are too busy, would you be comfortable in us visiting your home to provide the HIV testing?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Contact Tracing, Would you mind if we call to check when you are ready for the test","Contact Tracing, After how long do you think we should call you")
        } else {
            conditions.disable.push("Contact Tracing, Would you mind if we call to check when you are ready for the test","Contact Tracing, After how long do you think we should call you")
        }
        return conditions;
        },
     'Contact Tracing, Would you be comfortable if we contact your partner(s) that they can come for HIV test': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Contact Tracing, Would you be comfortable if we contact your partner(s) that they can come for HIV test'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Contact Tracing, If Yes, should we mention that you gave us their details or it should be anonymous","Contact Tracing, What time of the day would be advisable to call your partner")
        } else {
            conditions.disable.push("Contact Tracing, If Yes, should we mention that you gave us their details or it should be anonymous","Contact Tracing, What time of the day would be advisable to call your partner")
        }
        return conditions;
        },
        "Contact Tracing, What time of the day would be advisable to call your partner": function (formName, formFieldValues) {
            var conditions = {enable: [], disable: []};
            var conditionConcept = formFieldValues['Contact Tracing, What time of the day would be advisable to call your partner'];
            if (conditionConcept == "Given a specific time") {
                conditions.enable.push("Contact Tracing, Specify time")
            } else {
                conditions.disable.push("Contact Tracing, Specify time")
            }
            return conditions;
        },
    'Contact Tracing, Do you have any children?': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Contact Tracing, Do you have any children?'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Contact Tracing, If Yes, how old are they, in their chronological order","Contact Tracing, Have any of your children been tested")
         var ChildrenTested = formFieldValues['Contact Tracing, Have any of your children been tested'];
         if (ChildrenTested == "Yes") {
          conditions.enable.push("Contact Tracing, If tested, how many","Contact Tracing, If tested, how many negative","Contact Tracing, If tested, how many positive")
          conditions.disable.push("Contact Tracing, If not tested, would you be comfortable if they get tested")
         } else if (ChildrenTested == "No") {
          conditions.enable.push("Contact Tracing, If not tested, would you be comfortable if they get tested")
          conditions.disable.push("Contact Tracing, If tested, how many","Contact Tracing, If tested, how many negative","Contact Tracing, If tested, how many positive")
         } else {
          conditions.disable.push("Contact Tracing, If tested, how many","Contact Tracing, If tested, how many negative","Contact Tracing, If tested, how many positive","Contact Tracing, If not tested, would you be comfortable if they get tested")
         }
        } else {
            conditions.disable.push("Contact Tracing, If Yes, how old are they, in their chronological order","Contact Tracing, Have any of your children been tested")
        }
        return conditions;
        },
     'Contact Tracing, Have any of your children been tested': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Contact Tracing, Have any of your children been tested'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Contact Tracing, If tested, how many","Contact Tracing, If tested, how many negative","Contact Tracing, If tested, how many positive")
            conditions.disable.push("Contact Tracing, If not tested, would you be comfortable if they get tested")
         var HIVPos = formFieldValues['Contact Tracing, If tested, how many positive'];
         if (HIVPos > 0) {
          conditions.enable.push("Contact Tracing, If positive are they on ART")
         } else {
          conditions.disable.push("Contact Tracing, If positive are they on ART")
         }
        } else if (conditionConcept == "No") {
            conditions.enable.push("Contact Tracing, If not tested, would you be comfortable if they get tested")
            conditions.disable.push("Contact Tracing, If tested, how many","Contact Tracing, If tested, how many negative","Contact Tracing, If tested, how many positive")
         var GetTested = formFieldValues['Contact Tracing, If not tested, would you be comfortable if they get tested'];
         if (GetTested == "Yes") {
          conditions.enable.push("Contact Tracing, If Yes, what would you prefer a home visit or bringing them to NSC")
         } else {
          conditions.disable.push("Contact Tracing, If Yes, what would you prefer a home visit or bringing them to NSC")
         }
        } else {
            conditions.disable.push("Contact Tracing, If tested, how many","Contact Tracing, If tested, how many negative","Contact Tracing, If tested, how many positive","Contact Tracing, If not tested, would you be comfortable if they get tested")
        }
        return conditions;
        },
     'Contact Tracing, If tested, how many positive': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Contact Tracing, If tested, how many positive'];
        if (conditionConcept > 0) {
            conditions.enable.push("Contact Tracing, If positive are they on ART")
        } else {
            conditions.disable.push("Contact Tracing, If positive are they on ART")
        }
        return conditions;
        },
     'Contact Tracing, If not tested, would you be comfortable if they get tested': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Contact Tracing, If not tested, would you be comfortable if they get tested'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Contact Tracing, If Yes, what would you prefer a home visit or bringing them to NSC")
        } else {
            conditions.disable.push("Contact Tracing, If Yes, what would you prefer a home visit or bringing them to NSC")
        }
        return conditions;
        },
     'Contact Tracing, Do you think there is a family member that might have been exposed to HIV that you would want to be tested': function (formName, formFieldValues) {
        var conditions = {enable: [], disable: []};
        var conditionConcept = formFieldValues['Contact Tracing, Do you think there is a family member that might have been exposed to HIV that you would want to be tested'];
        if (conditionConcept == "Yes") {
            conditions.enable.push("Contact Tracing, If Yes, how would you want them contacted")
        } else {
            conditions.disable.push("Contact Tracing, If Yes, how would you want them contacted")
        }
        return conditions;
        },
	"PHTC, Ever had sexual intercourse": function(formName, formFieldValues) {
                var questionThatTriggersRule = "PHTC, Ever had sexual intercourse"
                var selectedResponses = formFieldValues[questionThatTriggersRule];
                var question1AffectedByRule = "PHTC, Age of first penetrative sex"
                var question2AffectedByRule = "PHTC, Do you or your partner currently have an STI"
                var question3AffectedByRule = "PHTC, In the last twelve months, ever had sex while intoxicated"
                var question4AffectedByRule = "PHTC, In the last twelve month exchanged money or goods for sex"
                var question5AffectedByRule = "PHTC, Last time you had sex did you use a condom"
                var question6AffectedByRule = "PHTC, Do you currently have more than one sexual partner (including your spouse or regular partner)"
                var question7AffectedByRule = "PHTC, How many sexual partners did you have in the last twelve months (including your spouse or sexual partner)"
                var question8AffectedByRule = "PHTC, Are you or your partner circumcised (Male circumcision)"
                var conditionTrue = selectedResponses == 'Yes';
                var ruleActions = {enable: [], disable: []};
                if(conditionTrue) {
                        ruleActions.enable.push(question1AffectedByRule)
                        ruleActions.enable.push(question2AffectedByRule)
                        ruleActions.enable.push(question3AffectedByRule)
                        ruleActions.enable.push(question4AffectedByRule)
                        ruleActions.enable.push(question5AffectedByRule)
                        ruleActions.enable.push(question6AffectedByRule)
                        ruleActions.enable.push(question7AffectedByRule)
                        ruleActions.enable.push(question8AffectedByRule)
                } else {
                        ruleActions.disable.push(question1AffectedByRule)
                        ruleActions.disable.push(question2AffectedByRule)
                        ruleActions.disable.push(question3AffectedByRule)
                        ruleActions.disable.push(question4AffectedByRule)
                        ruleActions.disable.push(question5AffectedByRule)
                        ruleActions.disable.push(question6AffectedByRule)
                        ruleActions.disable.push(question7AffectedByRule)
                        ruleActions.disable.push(question8AffectedByRule)
                }
                return ruleActions;
        },
    "PHTC, Are you currently coughing": function (formName, formFieldValues) {
                var conditions = {enable: [], disable: []};
                var conditionConcept = formFieldValues['PHTC, Are you currently coughing'];
                if (conditionConcept == "Yes") {
                        conditions.enable.push("PHTC, For how long have you been coughing")
                } else {
                        conditions.disable.push("PHTC, For how long have you been coughing")
                }
                return conditions;
        },
	"HST, External referral to:(Multiple responses possible)": function (formName, formFieldValues) {
                var conditions = {enable: [], disable: []};
                var conditionConcept = formFieldValues['HST, External referral to:(Multiple responses possible)'];
                if (conditionConcept.indexOf("Other") >= 0) {
                        conditions.enable.push("HST, If other on External referral to, specify")
                } else {
                        conditions.disable.push("HST, If other on External referral to, specify")
                }
                return conditions;
        },
    "Have you experienced problems with medicines?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you experienced problems with medicines?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Did you have a rash from taking the medications?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
      },
    "Do you have difficulty swallowing?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you have difficulty swallowing?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Is swallowing painful?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
    },
    "Have you lost your appetite?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you lost your appetite?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Duration of appetite loss "
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
    },
    "Coordinatedbilateral eye movements?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Coordinatedbilateral eye movements?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Double vision"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
    "Do you suffer from frequent nasal discharge?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you suffer from frequent nasal discharge?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Is the discharge associated with headaches?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
    "Do you suffer from frequent nasal discharge?(3)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you suffer from frequent nasal discharge?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Is the discharge associated with swelling in the face?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
    "How many children do you have?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="How many children do you have?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Have any of  your children been tested for HIV?"
        var conditionTrue = selectedResponses == 'Enter Answer';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
    "Are you hard of hearing?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you hard of hearing?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Additional comments about hearing loss"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
    "KS Lesions?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="KS Lesions?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Locations on body"
        var conditionTrue = selectedResponses == 'Enter Answer';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
    "Are you currently pregnant?(4)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you currently pregnant?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Are you on any other drugs?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
    "Have you been screened for cervical cancer?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you been screened for cervical cancer?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Screening result"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
    "Do you suffer from frequent nasal discharge?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you suffer from frequent nasal discharge?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Colour of discharge"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
    "Have you lost weight?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you lost weight?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "How much weight lost"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
    "Did the skin rash start after taking new medication?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Did the skin rash start after taking new medication?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "How long after taking the new medication?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
    "Have you had pneumocystis carinii pneumonia?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you had pneumocystis carinii pneumonia?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Date of pneumocystis carinii pneumonia"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
    "Have you noticed any lumps on the neck?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you noticed any lumps on the neck?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Draining fistulas"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
    "Do you vomit frequently?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you vomit frequently?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "When do you vomit?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
    "Have you noticed ulcers on the penis?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you noticed ulcers on the penis?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Duration of ulcers on the penis"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
    "Do you have any skin problems?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you have any skin problems?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Have you had a skin rash recently?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
    "Have you carried any full term pregnancies?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you carried any full term pregnancies?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "How many full term pregnancies?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
    "Have you been sexually abused?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you been sexually abused?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Has a police report been filed?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

    "Do you suffer from heartburn?(3)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you suffer from heartburn?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "When does the heartburn occur?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
    "Did you receive PMTCT?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Did you receive PMTCT?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Did you receive PMTCT during pregnancy?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

    "Have you experienced chronic back pain?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you experienced chronic back pain?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Does the back pain occur with specific movements?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
    "Do you know the due date?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you know the due date?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Due Date"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

    "PMTCT Provided to Infant(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="PMTCT Provided to Infant"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Drugs/Regimen Received"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
    "Ear pain or discharge?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Ear pain or discharge?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Details"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

    "Are Sclerae / Conjunctivae normal?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are Sclerae / Conjunctivae normal?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Pterygium present"
        var conditionTrue = selectedResponses == 'No';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
       },
        "Is the child developing like other children of the same age?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Is the child developing like other children of the same age?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Child development issues"
        var conditionTrue = selectedResponses == 'No';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Have you ever been pregnant?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you ever been pregnant?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Have you carried any full term pregnancies?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you had chest pain?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you had chest pain?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Location of chest pain"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you noticed any changes in or around the mouth and neck?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you noticed any changes in or around the mouth and neck?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Have you had sores or non healing ulcers in the mouth?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you ever been pregnant?(5)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you ever been pregnant?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Age of Children"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you had a rash with any of those symptoms?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you had a rash with any of those symptoms?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Duration of rash"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you observed a swelling of your limbs(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you observed a swelling of your limbs"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Swelling location"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Are you currently pregnant?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you currently pregnant?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Are you booked for antenatal care?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },


        "Was the pregnancy booked?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Was the pregnancy booked?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "How many antenatal visits did the patient attend?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Have you had blisters or swelling on/around the lips?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you had blisters or swelling on/around the lips?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "How often"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you experienced problems with medicines?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you experienced problems with medicines?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Nausea from taking the medications?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you had shortness of breath?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you had shortness of breath?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Shortness of breath duration"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },



        "Do you have a child health card?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you have a child health card?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Is the child growing well as per child health card curve?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Have you had a positive HIV test?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you had a positive HIV test?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Where was the test performed"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },









        "Do you suffer from frequent nasal discharge?(4)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you suffer from frequent nasal discharge?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Additional comments about nasal discharge"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Have you ever been pregnant?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you ever been pregnant?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Did you have any premature births?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you ever had Herpes zoster / shingles?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you ever had Herpes zoster / shingles?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Shingles date(s)"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you had a skin rash recently?(3)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you had a skin rash recently?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Did the skin rash start after taking new medication?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you ever had Herpes zoster / shingles?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you ever had Herpes zoster / shingles?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Have you had several episodes?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you ever been treated with ARV's?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you ever been treated with ARV's?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Did you miss a dose in the past three days?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Do you vomit frequently?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you vomit frequently?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Vomit content"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Is your (sexual) partner aware of his/her HIV status?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Is your (sexual) partner aware of his/her HIV status?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Partners HIV Status"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you ever had Kaposi Sarcoma?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you ever had Kaposi Sarcoma?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Location(s) of Kaposi Sarcoma"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Do you feel a burning sensation with urination?(5)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you feel a burning sensation with urination?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Do you have to get up at night?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Have you been sexually abused?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you been sexually abused?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Did you receive any medical treatment afterwards?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Do you feel a burning sensation with urination?(6)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you feel a burning sensation with urination?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Did you have a fever, rigors or chills with the burning sensation?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Do you feel unusually tired?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you feel unusually tired?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Duration of tiredness"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },


        "Do you use contraceptives?(4)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you use contraceptives?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "What types of contraceptives do you use?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Rectal exam performed?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Rectal exam performed?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Results"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you changed your medicines?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you changed your medicines?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Changes to ARV's"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },


        "Did you receive PMTCT after delivery?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Did you receive PMTCT after delivery?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "For how long?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you experienced loss of sexual interest?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you experienced loss of sexual interest?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Dysparenuia (painful sexual intercourse)"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },



        "Was the pregnancy booked?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Was the pregnancy booked?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Where was the pregnancy booked?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Do you have high blood pressure?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you have high blood pressure?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Is your BP well controlled?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },



        "Are you suffering from headaches?(3)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you suffering from headaches?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Headache association"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you ever been treated with ARV's?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you ever been treated with ARV's?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Have you experienced problems with medicines?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Thrush?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Thrush?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Associated with difficulty or pain when swallowing?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Have you experienced joint pain?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you experienced joint pain?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Joint pain duration"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Was the pregnancy booked?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Was the pregnancy booked?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "At what month of the pregnancy was the pregnancy booked?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Are you sexually active?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you sexually active?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Age of sexual debut"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Do you suffer from frequent nasal discharge?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you suffer from frequent nasal discharge?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Is the discharge associated with facial pain?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Are you in school?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you in school?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Did you drop out of  school?"
        var conditionTrue = selectedResponses == 'No';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Record Pulse(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Record Pulse"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Is Pulse Rate above 80 beats per minute?"
        var conditionTrue = selectedResponses == 'Enter Answer';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Did you have a fever recently?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Did you have a fever recently?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Duration of fever"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you reached menopause?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you reached menopause?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Have you missed your period?"
        var conditionTrue = selectedResponses == 'No';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },


        "Tumors?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Tumors?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Inflammation"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },



        "Have you observed blood in your urine?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you observed blood in your urine?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Blood in urine duration"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },




        "Abdominal tenderness?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Abdominal tenderness?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Localized location"
        var conditionTrue = selectedResponses == 'Localized';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Did you have a rash from taking the medications?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Did you have a rash from taking the medications?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Date rash started"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Is patient on triple therapy?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Is patient on triple therapy?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Which drugs?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Cough?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Cough?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Auscultation"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Has the child ever suffered from measles?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Has the child ever suffered from measles?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Did the child develop eye problems afterward?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Do you feel a burning sensation with urination?(3)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you feel a burning sensation with urination?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Do you feel an urgency to go?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you experienced problems with medicines?(3)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you experienced problems with medicines?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Numbness or pins and needles from taking the medications?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },


        "Does the abdominal pain occur during fasting?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Does the abdominal pain occur during fasting?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Epigastric pain?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },


        "Have you lost weight?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you lost weight?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Why do you think you lost weight?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Do you have frequent nausea?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you have frequent nausea?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Nausea severity"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Are you currently pregnant?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you currently pregnant?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "HIV-STATUS OF MOTHER"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Do you use illicit drugs?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you use illicit drugs?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "What types of illicit drugs do you use and how often?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Did the child have any birth defects?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Did the child have any birth defects?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Did the child have a cataract at birth?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Vomiting from taking the medications?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Vomiting from taking the medications?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Were tablets visible in vomitus?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you experienced problems with medicines?(6)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you experienced problems with medicines?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Other issues from taking the medications?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you observed blood in your urine?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you observed blood in your urine?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Blood in urine severity"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you observed a breast lump?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you observed a breast lump?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Duration of breast lump"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Do you have any skin problems?(3)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you have any skin problems?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Have you observed a lump growing?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Have you had a positive HIV test?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you had a positive HIV test?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "When was the test done?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },


        "Did you receive PMTCT during pregnancy?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Did you receive PMTCT during pregnancy?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Which drugs?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },



        "Ear pain or discharge?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Ear pain or discharge?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Otoscopic exam performed?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Have you noticed any changes in or around the mouth and neck?(3)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you noticed any changes in or around the mouth and neck?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Have you had painful or bleeding gums?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Have you experienced joint pain?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you experienced joint pain?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Location"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Are you suffering from headaches?(4)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you suffering from headaches?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Headache frequency"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Are you or have you ever been a smoker?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you or have you ever been a smoker?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Have you stopped smoking completely?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Do you have difficulty swallowing?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you have difficulty swallowing?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Swallowing difficulty details"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Did you receive PMTCT after delivery?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Did you receive PMTCT after delivery?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Which drugs?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },


        "Is Partner Dead(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Is Partner Dead"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Cause of Partners Death"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Do you know the due date?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you know the due date?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Gestational week"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you ever been pregnant?(4)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you ever been pregnant?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "How many of your children have died"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },


        "Are you suffering from headaches?(6)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you suffering from headaches?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Headache location"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },





        "Have you noticed painful ulcers on or around the labia?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you noticed painful ulcers on or around the labia?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Duration of labia ulcers"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Were there any problems associated with the pregnancy?(3)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Were there any problems associated with the pregnancy?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Did the mother suffer from severe viral illnesses during pregnancy?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you experienced problems with medicines?(5)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you experienced problems with medicines?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Changes in bodily appearance from taking the medications?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },


        "Do you drink alcoholic beverages?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you drink alcoholic beverages?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Alcohol consumption"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Have any children died(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have any children died"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "CAUSE OF DEATH(S)"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you had a skin rash recently?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you had a skin rash recently?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Location of skin rash"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you experienced abdominal swelling?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you experienced abdominal swelling?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Duration of abdominal swelling"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Have you had a skin rash recently?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you had a skin rash recently?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Morphology"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Did the child cry when urinating?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Did the child cry when urinating?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Did the child have a fever when urinating?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you observed a lump growing?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you observed a lump growing?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Location of lump"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Vomiting from taking the medications?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Vomiting from taking the medications?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Vomiting occurence"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Did the child breast feed?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Did the child breast feed?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Did the child exclusively breast feed?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Have you observed blood in your urine?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you observed blood in your urine?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Additional information about blood in the urine"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "KS Lesions?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="KS Lesions?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Approximate number"
        var conditionTrue = selectedResponses == 'Enter Answer';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },


        "Have you lost weight?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you lost weight?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Duration of weight loss"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Do you have frequent diarrhea?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you have frequent diarrhea?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Diarrhea Details"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Did you receive PMTCT?(3)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Did you receive PMTCT?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Did your baby receive PMTCT?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Did you receive PMTCT?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Did you receive PMTCT?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Did you receive PMTCT after delivery?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Accomodation(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Accomodation"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "How many rooms do you occupy?"
        var conditionTrue = selectedResponses == 'Lodger';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Are you or have you ever been a smoker?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you or have you ever been a smoker?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "How many cigarettes per day on average?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Are you suffering from headaches?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you suffering from headaches?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Headache duration"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },


        "Are you suffering from headaches?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you suffering from headaches?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Headache severity"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Do you have frequent abdominal pain?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you have frequent abdominal pain?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Addominal pain location"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },



        "Are you sexually active?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you sexually active?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Sexual partners"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Are you currently pregnant?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you currently pregnant?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Is patient on triple therapy?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Have you had sores or non healing ulcers in the mouth?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you had sores or non healing ulcers in the mouth?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "How often"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Do you have ear pain or discharge?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you have ear pain or discharge?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Ear pain or discharge duration"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Have you noticed any changes in or around the mouth and neck?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you noticed any changes in or around the mouth and neck?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Have you had blisters or swelling on/around the lips?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Have you had a skin rash recently?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you had a skin rash recently?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Duration of skin rash"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you had a cough?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you had a cough?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Type of cough"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you noticed any changes in or around the mouth and neck?(4)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you noticed any changes in or around the mouth and neck?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Have you had painful teeth?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Has your partner been tested?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Has your partner been tested?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Partners test result"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "KS Lesions?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="KS Lesions?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Measure maximum lenght and width of an index legion"
        var conditionTrue = selectedResponses == 'Enter Answer';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Are you hard of hearing?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you hard of hearing?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Hearing loss duration"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Did you experience any itching?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Did you experience any itching?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Location of itching"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Are you suffering from headaches?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you suffering from headaches?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Headache course"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },




        "Have you experienced muscle ache?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you experienced muscle ache?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Location of muscle aches"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you had shortness of breath?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you had shortness of breath?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "When does shortness of breath occur"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Did you have a rash from taking the medications?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Did you have a rash from taking the medications?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Rash location"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Did your baby receive PMTCT?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Did your baby receive PMTCT?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Which drugs?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },


        "Do you have frequent diarrhea?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you have frequent diarrhea?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Diarrhea duration"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },




        "Did you have a fever recently?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Did you have a fever recently?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Did you have rigors (shaking chills) with the fever?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Itching rash?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Itching rash?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Eczema"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },


        "Do you have a partner?(4)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you have a partner?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Is your (sexual) partner aware of your HIV status?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you observed blood in your urine?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you observed blood in your urine?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Was it associated with a menstrual period?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you had a rash with any of those symptoms?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you had a rash with any of those symptoms?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Morphology"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },


        "Have you noticed any changes in or around the mouth and neck?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you noticed any changes in or around the mouth and neck?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Have you had non-healing cracks at the corner of your mouth?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you noticed any changes in or around the mouth and neck?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you noticed any changes in or around the mouth and neck?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Have you had oral thrush?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Has the child missed school?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Has the child missed school?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "School ending date"
        var conditionTrue = selectedResponses == 'Stopped going to school';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Are you in school?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you in school?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Have you ever missed school?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },


        "Have you had a positive HIV test?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you had a positive HIV test?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Why was the test done?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "PMTCT Provided to Mother(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="PMTCT Provided to Mother"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "PMTCT Date when drugs started"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you experienced loss of sexual interest?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you experienced loss of sexual interest?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Erectile dysfunction"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Enlarged lymph nodes?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Enlarged lymph nodes?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Location"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Loss of vision?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Loss of vision?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Assess visual acuity with handheld acuity chart or Snellen chart"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Do you have any skin problems?(4)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you have any skin problems?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Have you ever had Kaposi Sarcoma?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },


        "Do you have a child health card?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you have a child health card?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "What was the child`s APGAR score?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Were there any problems associated with the pregnancy?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Were there any problems associated with the pregnancy?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Was the mother treated for syphilis during pregnancy?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },




        "Have you ever been pregnant?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you ever been pregnant?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Do you have any living children?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Are immunizations up to date (Child Health Card)?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are immunizations up to date (Child Health Card)?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Note immunizations that have been missed according to schedule"
        var conditionTrue = selectedResponses == 'No';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you experienced problems with medicines?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you experienced problems with medicines?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Vomiting from taking the medications?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Do you have frequent abdominal pain?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you have frequent abdominal pain?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Does the abdominal pain occur during fasting?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Do you have ear pain or discharge?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you have ear pain or discharge?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Is discharge associated with pain?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Was the child part of a twin/ multiple birth?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Was the child part of a twin/ multiple birth?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Did the other(s) survive?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you experienced problems with medicines?(4)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you experienced problems with medicines?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Diarrhea from taking the medications?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Are you sexually active?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you sexually active?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Male condom use"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Did the child breast feed?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Did the child breast feed?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "For how long did the child breast feed?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you had any joint swelling?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you had any joint swelling?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Joint swelling location"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Where was the child delivered?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Where was the child delivered?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "What was the mode of delivery?"
        var conditionTrue = selectedResponses == 'At health care facility';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you noticed any changes in or around the mouth and neck?(5)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you noticed any changes in or around the mouth and neck?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Have you noticed any lumps on the neck?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you had TB in places other than the lungs?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you had TB in places other than the lungs?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "How was it diagnosed?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Are you currently pregnant?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you currently pregnant?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Do you know the due date?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you experienced chronic back pain?(3)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you experienced chronic back pain?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Does the back pain occur at night?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you changed your medicines?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you changed your medicines?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Have you self administrered or taken traditional medicines?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Is patient on triple therapy?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Is patient on triple therapy?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Since which date?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you been screened for cervical cancer?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you been screened for cervical cancer?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Date of  screening"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Did the child breast feed?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Did the child breast feed?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Did the child suckle properly?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "PMTCT Provided to Infant(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="PMTCT Provided to Infant"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "PMTCT Date when drugs started"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Did your baby receive PMTCT?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Did your baby receive PMTCT?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "For how long?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Did you have a rash from taking the medications?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Did you have a rash from taking the medications?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Rash Morphology"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you ever been pregnant?(3)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you ever been pregnant?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Did you have any miscarriages or abortions?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you had a positive HIV test?(9)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you had a positive HIV test?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Do you have any children?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Do you feel a burning sensation with urination?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you feel a burning sensation with urination?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Burning urination duration"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you observed a swelling of your limbs(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you observed a swelling of your limbs"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Swelling duration"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Are Sclerae / Conjunctivae normal?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are Sclerae / Conjunctivae normal?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Conjunctivae"
        var conditionTrue = selectedResponses == 'No';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Have you had any joint swelling?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you had any joint swelling?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Joint swelling duration"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you carried any full term pregnancies?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you carried any full term pregnancies?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Did you receive PMTCT?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you ever been treated with ARV's?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you ever been treated with ARV's?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Have you missed a dose today?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Are you currently pregnant?(3)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you currently pregnant?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "HAS SHE BEEN SCREENED FOR TB"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Itching rash?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Itching rash?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Pruritis / Prurigo"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you ever had PTB?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you ever had PTB?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "How many episodes of PTB?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you experienced intermenstrual bleeding?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you experienced intermenstrual bleeding?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Intensity"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you experienced chronic back pain?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you experienced chronic back pain?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Back pain duration"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Cough?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Cough?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Percussion"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Tachypnea?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Tachypnea?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Use of auxiliary respiratory muscles?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you reached menopause?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you reached menopause?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Beginning date of LMP?"
        var conditionTrue = selectedResponses == 'No';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Did you interrupt treatment at times?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Did you interrupt treatment at times?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "When did you miss a dose?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you reached menopause?(4)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you reached menopause?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Dysmenorrhea"
        var conditionTrue = selectedResponses == 'No';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Do you have a partner?(5)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you have a partner?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Has your partner been tested?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Wheezing(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Wheezing"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Chronic wheezing"
        var conditionTrue = selectedResponses == 'Chronic';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Do you have high blood pressure?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you have high blood pressure?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Are you on BP drugs?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Did the child breast feed?(3)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Did the child breast feed?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Did the child breast feed well?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you noticed any lumps on the neck?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you noticed any lumps on the neck?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Duration of lumps"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Do you have any skin problems?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you have any skin problems?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Have you ever had Herpes zoster / shingles?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Loss of vision?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Loss of vision?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Are visual fields normal?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you experienced loss of sexual interest?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you experienced loss of sexual interest?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Other"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Tumors?(3)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Tumors?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Mobility"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Have you observed a breast lump?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you observed a breast lump?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Size of breast lump(s)"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Have you missed your period?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you missed your period?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Are you pregnant?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Lumps?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Lumps?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Size"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Tumors?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Tumors?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Locations"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Are you or have you ever been a smoker?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you or have you ever been a smoker?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "When did you start smoking?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Lumps?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Lumps?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Location"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Did you have night sweats?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Did you have night sweats?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Duration of night sweats"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Enlarged lymph nodes?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Enlarged lymph nodes?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Properties"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Did you interrupt treatment at times?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Did you interrupt treatment at times?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Why did you miss doses?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Were there any problems associated with the pregnancy?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Were there any problems associated with the pregnancy?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Was a TORCHES screen ever done on the mother?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you had chest pain?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you had chest pain?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "When does chest pain occur"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Addominal pain location(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Addominal pain location"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Abdominal pain location"
        var conditionTrue = selectedResponses == 'Localized';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Do you drink alcoholic beverages?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you drink alcoholic beverages?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "What type of alcohol do you drink?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Do you have any children?(7)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you have any children?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "How many children do you have?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Have you had a rash with any of those symptoms?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you had a rash with any of those symptoms?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Location of rash"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Have you experienced chronic back pain?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you experienced chronic back pain?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Location of back pain"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Do you feel generalized body pain?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you feel generalized body pain?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Duration of pain"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "DISCLOSURE DONE?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="DISCLOSURE DONE?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "DISCLOSURE DONE, TO WHOM?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you noticed any lumps on the neck?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you noticed any lumps on the neck?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Location of lumps"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you experienced muscle ache?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you experienced muscle ache?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Are you currently on NRTI's?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Did the skin rash start after taking new medication?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Did the skin rash start after taking new medication?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Which medication?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Did you receive PMTCT?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Did you receive PMTCT?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Did you receive PMTCT during delivery?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you had a positive HIV test?(8)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you had a positive HIV test?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Do you have a partner?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Abdominal swelling(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Abdominal swelling"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "LMP"
        var conditionTrue = selectedResponses == 'Pregnancy';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Do you feel a burning sensation with urination?(7)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you feel a burning sensation with urination?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Have you had several episodes?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you observed a lump growing?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you observed a lump growing?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Duration of lump"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Do you have any skin problems?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you have any skin problems?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Did you experience any itching?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Are you sexually active?(3)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you sexually active?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Female condom use"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Were there any problems associated with the pregnancy?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Were there any problems associated with the pregnancy?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Was the mother ever treated for any other sexually transmitted illnesses?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have any of  your children been tested for HIV?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have any of  your children been tested for HIV?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Test Results"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Record Temperature(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Record Temperature"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Is temperature above 37.8°?"
        var conditionTrue = selectedResponses == 'Enter Answer';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you experienced abdominal swelling?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you experienced abdominal swelling?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Last Menstrual Period?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Do you feel a burning sensation with urination?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you feel a burning sensation with urination?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Burning senstation details"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Are you frequently constipated?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you frequently constipated?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Duration of constipation"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Did the child exclusively breast feed?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Did the child exclusively breast feed?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "For how long did the child exclusively breast feed?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you ever had PTB?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you ever had PTB?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Date(s) of previous episodes"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Are you suffering from headaches?(5)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you suffering from headaches?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Headache onset"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Do you feel a burning sensation with urination?(4)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you feel a burning sensation with urination?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Have you experienced flank pain during such epsiodes?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Have you had a positive HIV test?(3)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you had a positive HIV test?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Do you have a copy of the test result?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Do you have a partner?(6)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you have a partner?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Is your (sexual) partner aware of his/her HIV status?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Have any children died(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have any children died"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "AGE OF  CHILD(REN) AT TIME OF DEATH (MONTHS/YEARS)"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you reached menopause?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you reached menopause?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Are your periods irregular?"
        var conditionTrue = selectedResponses == 'No';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Itching rash?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Itching rash?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Papular pruritic eruptions"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Have you observed a swelling of your limbs(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you observed a swelling of your limbs"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Is swelling painful?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Are you currently pregnant?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you currently pregnant?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "GESTATIONAL AGE (IN WEEKS)"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Have you ever had a negative HIV test?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you ever had a negative HIV test?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "When was the negative test done?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Have you had a cough?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you had a cough?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Cough duration"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Do you have ear pain or discharge?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you have ear pain or discharge?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Ear pain or discharge location"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Have you reached menopause?(3)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you reached menopause?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Period intensity"
        var conditionTrue = selectedResponses == 'No';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you noticed any changes in or around the mouth and neck?(3)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you noticed any changes in or around the mouth and neck?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Have you had oral thrush?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Are you hard of hearing?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you hard of hearing?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Hearing loss location"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you ever been treated with ARV's?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you ever been treated with ARV's?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Did you interrupt treatment at times?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Did you receive PMTCT during pregnancy?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Did you receive PMTCT during pregnancy?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "When started?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you changed your medicines?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you changed your medicines?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Changes to other drugs"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Are you currently pregnant?(3)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you currently pregnant?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Is patient scheduled for AZT prophylaxis?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },


        "Do you want to stop the film of your life or do you have moments when you wish you were dead?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you want to stop the film of your life or do you have moments when you wish you were dead?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Have you thought about ending your life?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you been sexually abused?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you been sexually abused?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Did you receive counselling?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },


        "Are you currently pregnant?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you currently pregnant?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "HIV-STATUS OF PARTNER  "
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Are you sexually active?(4)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Are you sexually active?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Do you use condoms every time you have sex?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Tachypnea?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Tachypnea?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Nasal flaring?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },


        "Tumors?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Tumors?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Tumor size"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "HIV-STATUS OF MOTHER(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="HIV-STATUS OF MOTHER"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "DISCLOSURE DONE?"
        var conditionTrue = selectedResponses == 'Positive';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you observed a breast lump?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you observed a breast lump?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Where did the breast lump(s) occur?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Record Pulse(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Record Pulse"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Is Pulse Rate below 60 beats per minute?"
        var conditionTrue = selectedResponses == 'Enter Answer';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Do you have difficulty swallowing?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you have difficulty swallowing?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Swallowing difficulty duration"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Have you had TB in places other than the lungs?(1)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you had TB in places other than the lungs?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Location of TB"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Did you receive PMTCT?(4)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Did you receive PMTCT?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Did you receive PMTCT for each pregnancy?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Do you have frequent abdominal pain?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you have frequent abdominal pain?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Abdominal pain duration"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
        "Have you experienced intermenstrual bleeding?(0)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Have you experienced intermenstrual bleeding?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Duration"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },

        "Do you feel a burning sensation with urination?(2)": function(formName, formFieldValues) {
        var questionThatTriggersRule ="Do you feel a burning sensation with urination?"
        var selectedResponses = formFieldValues[questionThatTriggersRule]
        var question1AffectedByRule = "Do you need to go more frequently?"
        var conditionTrue = selectedResponses == 'Yes';
        var ruleActions = {enable: [], disable: []};
        if(conditionTrue)
        {ruleActions.enable.push(question1AffectedByRule)}
        else
        {ruleActions.disable.push(question1AffectedByRule)}
        return ruleActions;
        },
    'Self-test outcome': function (formName, formFieldValues) {
        var conditions = {
                    enable: [],
                    disable: []
                    };
        var conditionConcept = formFieldValues['Self-test outcome'];
        if (conditionConcept == "Positive") {
            conditions.enable.push("HST, Request Services")
        } else {
            conditions.disable.push("HST, Request Services")
        }
        return conditions;
        },
    'Provider TB History, Were you treated for TB before?': function (formName, formFieldValues) {
        var conditions = {
                    enable: [],
                    disable: []
                    };
        var conditionConcept = formFieldValues['Provider TB History, Were you treated for TB before?'];
        if (conditionConcept == "No") {
            conditions.disable.push("Provider TB History, How was the TB diagnosed?","Provider TB History, Have you had TB in places other than the lungs?","Provider TB History, Location of TB","Provider TB History, Was treatment interupted?")
        } else {
            conditions.enable.push("Provider TB History, How was the TB diagnosed?","Provider TB History, Have you had TB in places other than the lungs?","Provider TB History, Location of TB","Provider TB History, Was treatment interupted?")
        }
        return conditions;
        },
    'PHTC, Ever had anal sex': function (formName, formFieldValues) {
        var conditions = {
                    enable: [],
                    disable: []
                    };
        var conditionConcept = formFieldValues['PHTC, Ever had anal sex'];
        if (conditionConcept == "Yes") {
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
    'Provider TB History, Are you currently being treated for TB?': function (formName, formFieldValues) {
            var conditions = {
                    enable: [],
                    disable: []
                    };
            var conditionConcept = formFieldValues['Provider TB History, Are you currently being treated for TB?'];
            if (conditionConcept == "Yes") {
                conditions.enable.push("Provider TB History, How was the TB diagnosed?","Provider TB History, Location of TB", "Provider TB History, How was the TB diagnosed?")
                  }
           else {
                conditions.disable.push("Provider TB History, How was the TB diagnosed?","Provider TB History, Location of TB", "Provider TB History, How was the TB diagnosed?")
            }
            return conditions;
        },
     'Provider TB History, How was the TB diagnosed?': function (formName, formFieldValues) {
         var conditions = {
                 enable: [],
                 disable: []
                 };
         var conditionConcept = formFieldValues['Provider TB History, How was the TB diagnosed?'];
         if (conditionConcept == "Other") {
             conditions.enable.push("Provider TB History, If other TB diagnosed, specify")
               }
        else {
             conditions.disable.push("Provider TB History, If other TB diagnosed, specify")
         }
         return conditions;
         },
      'Provider TB History, Location of TB': function (formName, formFieldValues) {
          var conditions = {
                  enable: [],
                  disable: []
                  };
          var conditionConcept = formFieldValues['Provider TB History, Location of TB'];
          if (conditionConcept == "Other") {
              conditions.enable.push("Provider TB History, If other TB location, specify")
                }
         else {
              conditions.disable.push("Provider TB History, If other TB location, specify")
          }
          return conditions;
          },
    'PHT, Ever had anal sex': function (formName, formFieldValues) {
         var conditions = {
                     enable: [],
                     disable: []
                     };
         var conditionConcept = formFieldValues['PHT, Ever had anal sex'];
         if (conditionConcept == "Yes") {
             conditions.enable.push("PHT, Age of first penetrative sex");
             conditions.enable.push("PHT, Do you or your partner currently have an STI");
             conditions.enable.push("PHT, In the last twelve months, ever had sex while intoxicated");
             conditions.enable.push("PHT, In the last twelve month exchanged money or goods for sex");
             conditions.enable.push("PHT, Last time you had sex did you use a condom");
             conditions.enable.push("PHT, Do you currently have more than one sexual partner (including your spouse or regular partner)");
             conditions.enable.push("PHT, How many sexual partners did you have in the last twelve months (including your spouse or sexual partner)");
             conditions.enable.push("PHT, Are you or your partner circumcised (Male circumcision)");

         } else {
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
    'PHT, Ever had oral sex': function (formName, formFieldValues) {
          var conditions = {
                      enable: [],
                      disable: []
                      };
          var conditionConcept = formFieldValues['PHT, Ever had oral sex'];
          if (conditionConcept == "Yes") {
              conditions.enable.push("PHT, Age of first penetrative sex");
              conditions.enable.push("PHT, Do you or your partner currently have an STI");
              conditions.enable.push("PHT, In the last twelve months, ever had sex while intoxicated");
              conditions.enable.push("PHT, In the last twelve month exchanged money or goods for sex");
              conditions.enable.push("PHT, Last time you had sex did you use a condom");
              conditions.enable.push("PHT, Do you currently have more than one sexual partner (including your spouse or regular partner)");
              conditions.enable.push("PHT, How many sexual partners did you have in the last twelve months (including your spouse or sexual partner)");
              conditions.enable.push("PHT, Are you or your partner circumcised (Male circumcision)");

          } else {
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
 };
