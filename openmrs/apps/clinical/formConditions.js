Bahmni.ConceptSet.FormConditions.rules = {
    'Why are you worried/ curious about learning your HIV status?  (Multiple responses possible)': function(formName, formFieldValues) {
        var selectedValues = formFieldValues['Why are you worried/ curious about learning your HIV status?  (Multiple responses possible)'];
        var found = _.contains(selectedValues, "Other (specify)")
        if(found) {
            return {
                show: ["Other specific (why worried/curious about HIV status)"]
            }
        } else {
            return {hide: ["Other specific (why worried/curious about HIV status)"]
            }
        }
    }  
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