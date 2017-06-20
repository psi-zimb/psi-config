// Below is a model you can use for adding skip/disable logic to formCondition.js.  Just copy-paste this text into the second line onwards of the file.
// Note that any rules/conditions will apply across all observation forms (if you want to make a rule specific to just one observation form, you'll need
//    to add a condition that checks a question that's only available on that observation form).
// Note also that rules can actually apply to any concept (eg forms and form sections, as well as questions themselves), but can only reference 
//    other concepts contained within the same form/section (eg you can't change a value in one section, and have it hide a question in another section).

    "Name of rule (for easy reference, you can use the question that triggers the rule)": function(formName, formFieldValues) {

        // 1. Add the question that triggers the rule below, deleting the angle brackets but leaving the quotation marks:
        var questionThatTriggersRule = "<concept name of question that triggers the rule>"
        // Don't change this line:
        var selectedResponses = formFieldValues[questionThatTriggersRule];

        // 2. Add the questions/sections that you want to enable/disable or show/hide, deleting the angle brackets but leaving the quotation marks:
        //    (you can have as many questions affected by a single rule as you want - just uncomment the lines below, and add the additional questions)
        var question1AffectedByRule = "<concept name of question 1 affected by rule>"
        //var question2AffectedByRule = "<concept name of question 2 affected by rule>"
        //var question3AffectedByRule = "<concept name of question 3 affected by rule>"

        // 3. un-comment just one of the 'var' options below, depending on your need; if necessary, these options can be
        //     combined into one conditionTrue statement using && (and) or || (or):
        //var conditionTrue = selectedResponses == '<response>'; // normal text/drop-down question: is this the response?
        //var conditionTrue = selectedResponses.indexOf('<response>') >= 0; // multi-select question: is this response one of the responses selected?
        //var conditionTrue = selectedResponses == <response>; // numeric question: is this the response (you can include >, < and ranges etc)

        // 4. un-comment just one of the two options below, depending on whether you want to enable/disable or show/hide the question(s)
        //var ruleActions = {show: [], hide: []};
        //var ruleActions = {enable: [], disable: []};
        if(conditionTrue) {
        // 5. in the code below, change 'enable'/'disable' to 'show'/'hide' if that's the option you've selected at step 4.
            ruleActions.enable.push(question1AffectedByRule)
            // 6. If you have multiple questions affected by a single rule, un-comment these lines as appropriate:
            //ruleActions.enable.push(question2AffectedByRule)
            //ruleActions.enable.push(question3AffectedByRule)          
        } else {
            ruleActions.disable.push(question1AffectedByRule)
            // 6. If you have multiple questions affected by a single rule, un-comment these lines as appropriate:
            //ruleActions.disable.push(question2AffectedByRule)
            //ruleActions.disable.push(question3AffectedByRule)
        }
        return ruleActions;
        },
        // 7. For conciseness and readability, once you've tested this rule, we recommend removing all comments.

