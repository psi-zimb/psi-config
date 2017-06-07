Bahmni.ConceptSet.FormConditions.rules = {

	"If married/having a partner and individual T&C, Reasons for not  bringing partner  (Multiple responses possible)": function(formName, formFieldValues) {
		var questionThatTriggersRule = "If married/having a partner and individual T&C, Reasons for not  bringing partner  (Multiple responses possible)"
        var selectedResponses = formFieldValues[questionThatTriggersRule];
		var question1AffectedByRule = "Other specific (reasons for not bringing partner)"
        var conditionTrue = "selectedResponses.indexOf('Other (specify)') >= 0"; // multi-select question: is this response one of the responses selected?
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
        var conditionTrue = "selectedResponses.indexOf('Other (specify)') >= 0"; // multi-select question: is this response one of the responses selected?
    	var ruleActions = {enable: [], disable: []};
        if(conditionTrue) {
            ruleActions.enable.push("Other specific (why worried/curious about HIV status)")
        } else {
            ruleActions.disable.push("Other specific (why worried/curious about HIV status)")
        }
        return ruleActions;
	    },


// How did you learn about this T&C site?
// Other specific (how learned about this T&C site)

// If client advised to return for re-testing indicate timeline (2 weeks, 4 weeks, 3months, 6 months, other)
// Other specific (timeline advised to return for re-testing)

// Disclosure planned to:  (Multiple responses possible)
// Other specific (disclosure planned to)

// Risk reduction plan  (Multiple responses possible)
// Other specific (risk reduction plan)


};