Bahmni.ConceptSet.FormConditions.rules = {
    'Why are you worried/ curious about learning your HIV status?  (Multiple responses possible)': function(formName, formFieldValues) {
        var conditionActions = {show: [], hide: []};
        var selectedValues = formFieldValues['Why are you worried/ curious about learning your HIV status?  (Multiple responses possible)'];
        var conditionTrue = (selectedValues.indexOf("Other (specify)") >= 0);
        if(conditionTrue) {
            conditionActions.show.push("Other specific (why worried/curious about HIV status)")
        } else {
            conditionActions.hide.push("Other specific (why worried/curious about HIV status)")
        }
        return conditionActions;
	    },
    'Diastolic Data' : function (formName, formFieldValues) {
        var systolic = formFieldValues['Systolic'];
        var diastolic = formFieldValues['Diastolic'];
        if (systolic || diastolic) {
            return {
                enable: ["Posture"]
            }
        } else {
            return {
                disable: ["Posture"]
            }
        }
    },
    'Systolic Data' : function (formName, formFieldValues) {
        var systolic = formFieldValues['Systolic'];
        var diastolic = formFieldValues['Diastolic'];
        if (systolic || diastolic) {
            return {
                enable: ["Posture"]
            }
        } else {
            return {
                disable: ["Posture"]
            }
        }
    }
};