Bahmni.ConceptSet.FormConditions.rules = {

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
        var conditionTrue = selectedResponses == 'Other (specify)';
    	var ruleActions = {enable: [], disable: []};
        if(conditionTrue) {
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

	"Ever had sexual intercourse": function(formName, formFieldValues) {
		var questionThatTriggersRule = "Ever had sexual intercourse"
        var selectedResponses = formFieldValues[questionThatTriggersRule];
		var question1AffectedByRule = "Age at first penetrative sex?"
		var question2AffectedByRule = "Do you / your partner currently have an STI?"
		var question3AffectedByRule = "Past 12 months had sex while intoxicated"
		var question4AffectedByRule = "Past 12 months exchanged money/ goods for sex?"
		var question5AffectedByRule = "Last time had sex, did you use a condom?"
		var question6AffectedByRule = "Do you currently have more than one sexual partner (including your spouse/regular partner)?"
		var question7AffectedByRule = "How many sexual partners did you have in the past 12 mths? ( including your spouse/regular partner)"
		var question8AffectedByRule = "Are you/is your partner circumcised (male circumcision)?"
		var question9AffectedByRule = "Have you ever talked about T&C with your partner/spouse?"
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
            ruleActions.enable.push(question9AffectedByRule)
        } else {
            ruleActions.disable.push(question1AffectedByRule)
            ruleActions.disable.push(question2AffectedByRule)
            ruleActions.disable.push(question3AffectedByRule)
            ruleActions.disable.push(question4AffectedByRule)
            ruleActions.disable.push(question5AffectedByRule)
            ruleActions.disable.push(question6AffectedByRule)
            ruleActions.disable.push(question7AffectedByRule)
            ruleActions.disable.push(question8AffectedByRule)
            ruleActions.disable.push(question9AffectedByRule)
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

};