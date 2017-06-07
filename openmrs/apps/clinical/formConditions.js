Bahmni.ConceptSet.FormConditions.rules = {

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