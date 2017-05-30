Bahmni.ConceptSet.FormConditions.rules = {
    'Why are you worried/ curious about learning your HIV status?  (Multiple responses possible)': function(formName, formFieldValues) {
        var conditions = {show: [], hide: []};
        var selectedValues = formFieldValues['Why are you worried/ curious about learning your HIV status?  (Multiple responses possible)'];
        var found = _.contains(selectedValues, "Other (specify)");
        if(found) {
            conditions.show.push("Other specific (why worried/curious about HIV status)")
        } else {
            conditions.hide.push("Other specific (why worried/curious about HIV status)")
        }
        return conditions
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