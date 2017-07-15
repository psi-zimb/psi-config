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
"Have you ever had PTB?(2)": function(formName, formFieldValues) {
var questionThatTriggersRule ="Have you ever had PTB?"
var selectedResponses = formFieldValues[questionThatTriggersRule]
var question1AffectedByRule = "Were you treated for TB before?"
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
"Are you currently being treated for TB?(0)": function(formName, formFieldValues) {
var questionThatTriggersRule ="Are you currently being treated for TB?"
var selectedResponses = formFieldValues[questionThatTriggersRule]
var question1AffectedByRule = "How was TB diagnosed?"
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
"Were you treated for TB before?(0)": function(formName, formFieldValues) {
var questionThatTriggersRule ="Were you treated for TB before?"
var selectedResponses = formFieldValues[questionThatTriggersRule]
var question1AffectedByRule = "When were you treated for TB?"
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
"Were you treated for TB before?(1)": function(formName, formFieldValues) {
var questionThatTriggersRule ="Were you treated for TB before?"
var selectedResponses = formFieldValues[questionThatTriggersRule]
var question1AffectedByRule = "Was treatment interupted?"
var conditionTrue = selectedResponses == 'Yes';
var ruleActions = {enable: [], disable: []};
if(conditionTrue)
{ruleActions.enable.push(question1AffectedByRule)}
else
{ruleActions.disable.push(question1AffectedByRule)}
return ruleActions;
},
 
 
 


};