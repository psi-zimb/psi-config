import org.apache.commons.lang.StringUtils
import org.openmrs.Concept
import org.openmrs.ConceptSet
import org.openmrs.api.ConceptService
import org.openmrs.api.context.Context
import org.openmrs.module.bahmniemrapi.encountertransaction.contract.BahmniEncounterTransaction
import org.openmrs.module.bahmniemrapi.encountertransaction.contract.BahmniObservation
import org.openmrs.module.bahmniemrapi.obscalculator.ObsValueCalculator
import org.openmrs.module.emrapi.encounter.domain.EncounterTransaction

public class BahmniObsValueCalculator implements ObsValueCalculator {
    static Double ZERO = 0.0;

    class ScoreDetails {
        Double score;
        Integer totalQuestions;
        Integer answeredQuestions;

        ScoreDetails(Double score, Integer totalQuestions, Integer answeredQuestions) {
            this.score = score
            this.totalQuestions = totalQuestions
            this.answeredQuestions = answeredQuestions
        }

        Double getScore() {
            return score
        }

        Integer getAnsweredQuestions() {
            return answeredQuestions
        }

        boolean areAllQuestionsAnswered() {
            return this.answeredQuestions.equals(this.totalQuestions)
        }
    }

    interface ScoreCalculationType {
        ScoreDetails getScoreDetails(BahmniObservation bahmniObservation)
    }

    class DefaultScoreCalculation implements ScoreCalculationType {
        @Override
        ScoreDetails getScoreDetails(BahmniObservation bahmniObservation) {
            double score = ZERO
            int answeredQuestions = ZERO, totalQuestions = ZERO

            ConceptService conceptService = Context.getConceptService();
            Concept concept = conceptService.getConceptByUuid(bahmniObservation.getConcept().getUuid());
            for (ConceptSet conceptSet : concept.getConceptSets()) {
                boolean isCodedConcept = conceptSet.getConcept().getDatatype().getName() == "Coded";
                if (isCodedConcept) {
                    totalQuestions += 1;
                    String groupMemberName = conceptSet.getConcept().getName().getName();
                    List<BahmniObservation> bahmniObservations = getAllGroupMembersWithConcept(groupMemberName, bahmniObservation.getGroupMembers());
                    for (BahmniObservation observation : bahmniObservations) {
                        if (observation != null && !observation.getVoided()) {
                            String answer = observation.getValue().get('displayString') == null ? observation.getValue().get('name') : observation.getValue().get('displayString');
                            score += getValueFromConceptName(answer);
                            answeredQuestions += 1;
                        }
                    }
                }
            }
            return new ScoreDetails(score, totalQuestions, answeredQuestions)
        }
    }

    class AggregateScoreCalculation implements ScoreCalculationType {
        private List<String> scoreConceptNames;

        AggregateScoreCalculation(List<String> scoreConceptNames) {
            this.scoreConceptNames = scoreConceptNames
        }

        @Override
        ScoreDetails getScoreDetails(BahmniObservation bahmniObservation) {
            double score = 0
            int answeredQuestions = 0, totalQuestions = 0

            for (String scoreConcept : scoreConceptNames) {
                totalQuestions += 1
                BahmniObservation childObs = find(scoreConcept, bahmniObservation.getGroupMembers(), null)
                if (childObs != null && !childObs.getVoided()) {
                    Double value = Double.parseDouble(childObs.getValue() + "")
                    score += value;
                    answeredQuestions += 1;
                }
            }
            return new ScoreDetails(score, totalQuestions, answeredQuestions)
        }
    }

    interface Formula {
        String applyFormulaOnScore(ScoreDetails scoreDetails)
    }

    class ExtremityFunctionFormula implements Formula {
        @Override
        String applyFormulaOnScore(ScoreDetails scoreDetails) {
            if (scoreDetails.getAnsweredQuestions() == 0) {
                return ZERO
            }
//            double score = scoreDetails.areAllQuestionsAnswered() ? scoreDetails.getScore() * 1.25 : (scoreDetails.getScore() + scoreDetails.getScore() / scoreDetails.getAnsweredQuestions()) * 1.25;
              double score = scoreDetails.areAllQuestionsAnswered() ? scoreDetails.getScore() * 1.25 : (scoreDetails.getScore()  / (4 * scoreDetails.getAnsweredQuestions())) * 100;
            String value = "" + roundOffToTwoDecimalPlaces(score);
            return value
        }
    }

    class DefaultFormula implements Formula {
        @Override
        String applyFormulaOnScore(ScoreDetails scoreDetails) {
            if (scoreDetails.getAnsweredQuestions() == 0) {
                return ZERO
            }
            String value = "" + roundOffToTwoDecimalPlaces(scoreDetails.getScore())
            return value
        }
    }

    class AverageFormula implements Formula{

        @java.lang.Override
        String applyFormulaOnScore(ScoreDetails scoreDetails) {
            if (scoreDetails.getAnsweredQuestions() == 0) {
                return ZERO
            }
            Double val = roundOffToTwoDecimalPlaces((scoreDetails.getScore())/2)
            String value = "" + val
            return value
        }
    }

    class RiskFallsFormula implements Formula {
        @Override
        String applyFormulaOnScore(ScoreDetails scoreDetails) {
            double score = scoreDetails.getScore();
            String risk;
            if (score <= 18) {
                risk = "High"
            } else if (score >= 19 && score <= 23) {
                risk = "Moderate";
            } else if (score >= 24) {
                risk = "Low";
            }
            return risk;
        }
    }

    class FunctionalIndexTableFormula implements Formula {
        double[] table = [0.0, 8.5, 14.4, 18.6, 21.7, 24.3, 26.5, 28.4, 30.1, 31.7, 33.1, 34.4, 35.6, 36.7, 37.8, 38.9, 39.9, 40.8, 41.8, 42.7, 43.5, 44.4, 45.2, 46.0, 46.9, 47.6, 48.4, 49.2, 50.0, 50.7, 51.5, 52.3, 53.0, 53.8, 54.6, 55.3, 56.1, 56.9, 57.7, 58.5, 59.4, 60.2, 61.1, 62.0, 63.0, 64.0, 65.0, 66.1, 67.3, 68.5, 69.9, 71.3, 72.9, 74.8, 76.8, 79.3, 82.3, 86.2, 91.8, 100.0];
        @Override
        String applyFormulaOnScore(ScoreDetails scoreDetails) {
            int i = scoreDetails.getScore();
            double score = table[i];
            return score
        }
    }

    class PhysicalFunctionFormula implements Formula {
        @Override
        String applyFormulaOnScore(ScoreDetails scoreDetails) {
            if (scoreDetails.getAnsweredQuestions() == 0) {
                return ZERO;
            }
            double score = ((scoreDetails.getScore() - scoreDetails.getAnsweredQuestions()) / scoreDetails.getAnsweredQuestions()) * 25;
            String value = "" + roundOffToTwoDecimalPlaces(score)
            return value
        }
    }

    class SocialFunctionFormula implements Formula {
        @Override
        String applyFormulaOnScore(ScoreDetails scoreDetails) {
            if (scoreDetails.getAnsweredQuestions() == 0) {
                return ZERO;
            }
            double score = ((scoreDetails.getScore() - scoreDetails.getAnsweredQuestions()) / scoreDetails.getAnsweredQuestions()) * 20;
            String value = "" + roundOffToTwoDecimalPlaces(score);
            return value
        }
    }

    class Section {
        private BahmniObservation sectionObservation;
        private String scoreConceptName;
        private ScoreCalculationType scoreType;
        private Formula formula;

        Section(ScoreCalculationType scoreType, Formula formula, BahmniObservation formObs, String scoreConceptName) {
            this.scoreType = scoreType
            this.sectionObservation = formObs
            this.scoreConceptName = scoreConceptName
            this.formula = formula
        }

        void setScore() {
            if (sectionObservation != null) {
                ScoreDetails scoreDetails = scoreType.getScoreDetails(sectionObservation)
                BahmniObservation scoreObservation = find(this.scoreConceptName, sectionObservation.getGroupMembers(), null)
                if (scoreDetails.getAnsweredQuestions() == 0) {
                    voidObs(scoreObservation)
                    voidObs(sectionObservation)
                } else {
                    scoreObservation = hasValue(scoreObservation) ? scoreObservation : createObs(scoreConceptName, sectionObservation, null, getDate(sectionObservation))
                    String value = formula.applyFormulaOnScore(scoreDetails)
                    scoreObservation.setValue(value)
                }
            }
        }
    }

    void run(BahmniEncounterTransaction bahmniEncounterTransaction) {
        Collection<BahmniObservation> observations = bahmniEncounterTransaction.getObservations()
        BahmniObservation baselineVitalsForm = find("ART Observations Form Template", observations, null)
        BahmniObservation cosdForm = find("Community Operational and Service deliver form", observations, null)
        if (baselineVitalsForm != null) {
            calculateBMIAndSave(baselineVitalsForm, "HEIGHT", "WEIGHT", "BMI Data", "BMI")
        }
        if (cosdForm != null) {
            calculateBMIAndSave(cosdForm, "COSD, Height", "COSD, Weight", "COSD, BMI Data", "COSD, BMI")
        }
        
        println("hello");
        calculateScores(observations)
        voidExistingObservationWithoutValue(observations)
    }

    static Double getValueFromConceptName(String conceptName) {
        return Double.parseDouble(conceptName.split("= ")[0]);
    }

    static void voidExistingObservationWithoutValue(Collection<BahmniObservation> observations) {
        for (BahmniObservation observation : observations) {
            if (observation.getGroupMembers().size() > 0) {
                voidExistingObservationWithoutValue(observation.getGroupMembers())
                observation.getVoided() || observation.setVoided(canBeVoided(observation))
            }
        }
    }

    static boolean isGroupWithOnlyVoidedMembers(BahmniObservation observation) {
        for (BahmniObservation groupMember : observation.getGroupMembers()) {
            if (!groupMember.getVoided()) {
                return false;
            }
        }
        return true;
    }

    static boolean canBeVoided(BahmniObservation bahmniObservation) {
        return (bahmniObservation.getUuid() != null && (bahmniObservation.getGroupMembers().size() == 0 || isGroupWithOnlyVoidedMembers(bahmniObservation)))
    }

    def calculateScores(Collection<BahmniObservation> observations) {
        ScoreCalculationType defaultScoreCalculation = new DefaultScoreCalculation();
        Formula extremityFunctionFormula = new ExtremityFunctionFormula()
        Formula defaultScoreFormula = new DefaultFormula()
        Formula riskFallsFormula = new RiskFallsFormula()
        Formula physicalFunctionFormula = new PhysicalFunctionFormula()
        Formula socialFunctionFormula = new SocialFunctionFormula()
        Formula functionalIndexTableFormula = new FunctionalIndexTableFormula()
        Formula averageFormula = new AverageFormula()
        Section lowerLimbExtremityFunction = new Section(
                defaultScoreCalculation,
                defaultScoreFormula,
                find("LLA, Lower Extremity Functional Index (LEFI)", observations, null),
                "LLA LEFI, Total Score")
        Section lowerLimbPediatricExtremityFunction = new Section(
                defaultScoreCalculation,
                extremityFunctionFormula,
                find("LLA, Pediatric Lower Extremity Function(Mobility)", observations, null),
                "LLA Pediatric, Total Score");
        Section lowerLimbGaitSection = new Section(
                defaultScoreCalculation,
                defaultScoreFormula,
                find("LLA, Gait Section", observations, null),
                "LLA, Gait Score")
        Section lowerLimbBalanceSection = new Section(
                defaultScoreCalculation,
                defaultScoreFormula,
                find("LLA, Balance Section", observations, null),
                "LLA, Balance Score")
        Section lowerLimbBalanceAssessmentSection = new Section(
                new AggregateScoreCalculation(Arrays.asList("LLA, Gait Score", "LLA, Balance Score")),
                defaultScoreFormula,
                find("LLA, Tinetti Balance Assessment Tool", observations, null),
                "LLA, Total Score")
        Section lowerLimbRiskFallsSection = new Section(
                new AggregateScoreCalculation(Arrays.asList("LLA, Gait Score", "LLA, Balance Score")),
                riskFallsFormula,
                find("LLA, Tinetti Balance Assessment Tool", observations, null),
                "LLA, Risk of Falls")
        Section upperLimbPediatricExtremityFunction = new Section(
                defaultScoreCalculation,
                extremityFunctionFormula,
                find("ULA, Pediatric Upper Extremity Function ( Fine Motor, ADL)", observations, null),
                "ULA, Total score")
        Section upperLimbExtremityFunction = new Section(
                defaultScoreCalculation,
                defaultScoreFormula,
                find("ULA, (UEFI) Upper Extremity Functional Index", observations, null),
                "ULA, Total raw score")
        Section upperLimbExtremityFinalScoreFunction = new Section(
                defaultScoreCalculation,
                functionalIndexTableFormula,
                find("ULA, (UEFI) Upper Extremity Functional Index", observations, null),
                "ULA, Final score")
        Section facialDisabiltyPhysicalFunction = new Section(
                defaultScoreCalculation,
                physicalFunctionFormula,
                find("MPA, Physical Function", observations, null),
                "MPA, Physical Function Score")
        Section facialDisabilitySocialFunction = new Section(
                defaultScoreCalculation,
                socialFunctionFormula,
                find("MPA, Social Function", observations, null),
                "MPA, Social Wellbeing Score")
        Section facialDisabilityIndexFunction = new Section(
                new AggregateScoreCalculation(Arrays.asList("MPA, Physical Function Score", "MPA, Social Wellbeing Score")),
                averageFormula,
                find("MPA, Facial Disability Index", observations, null),
                "MPA, Total score (FDI)")

        Section[] forms = [lowerLimbGaitSection,
                           lowerLimbBalanceSection,
                           lowerLimbBalanceAssessmentSection,
                           lowerLimbExtremityFunction,
                           lowerLimbPediatricExtremityFunction,
                           upperLimbPediatricExtremityFunction,
                           upperLimbExtremityFunction,
                           upperLimbExtremityFinalScoreFunction,
                           facialDisabiltyPhysicalFunction,
                           facialDisabilitySocialFunction,
                           facialDisabilityIndexFunction,
                           lowerLimbRiskFallsSection]
        for (Section form : forms) {
            form.setScore();
        }
    }

    static
    private List<BahmniObservation> getAllGroupMembersWithConcept(String conceptName, Collection<BahmniObservation> observations) {
        List<BahmniObservation> groupMembers = new ArrayList<>();
        for (BahmniObservation observation : observations) {
            if (conceptName.equalsIgnoreCase(observation.getConcept().getName())) {
                groupMembers.add(observation);
            }
        }
        return groupMembers
    }

    static def calculateBMIAndSave(BahmniObservation baselineForm, String heightConcept, String weightConcept, String bmiDataConcept, String bmiConcept) {
        Collection<BahmniObservation> observations = baselineForm.getGroupMembers()
        BahmniObservation heightObservation = find(heightConcept, observations, null)
        BahmniObservation weightObservation = find(weightConcept, observations, null)
        BahmniObservation bmiDataObservation = find(bmiDataConcept, observations, null)
        BahmniObservation bmiObservation = bmiDataObservation ? find(bmiConcept, bmiDataObservation.getGroupMembers(), null) : null

        if ((heightObservation && heightObservation.voided) || (weightObservation && weightObservation.voided)) {
            voidObs(bmiDataObservation)
            voidObs(bmiObservation)
            return
        }
        if (hasValue(heightObservation) && hasValue(weightObservation)) {
            Double height = heightObservation.getValue() as Double
            Double weight = weightObservation.getValue() as Double
            Date obsDatetime = getDate(weightObservation) != null ? getDate(weightObservation) : getDate(heightObservation)

            bmiDataObservation = bmiDataObservation ?: createObs(bmiDataConcept, baselineForm, null, obsDatetime) as BahmniObservation
            bmiObservation = bmiObservation ?: createObs(bmiConcept, bmiDataObservation, null, obsDatetime) as BahmniObservation;
            def bmi = calculateBMI(height, weight)
            bmiObservation.setValue(bmi);
        }
    }

    private static Date getDate(BahmniObservation observation) {
        return hasValue(observation) && !observation.voided ? observation.getObservationDateTime() : null;
    }

    private static boolean hasValue(BahmniObservation observation) {
        return observation != null && observation.getValue() != null && !StringUtils.isEmpty(observation.getValue().toString());
    }

    private static void voidObs(BahmniObservation bmiObservation) {
        if (hasValue(bmiObservation)) {
            bmiObservation.voided = true
        }
    }

    static BahmniObservation createObs(String conceptName, BahmniObservation parent, BahmniEncounterTransaction encounterTransaction, Date obsDatetime) {
        def concept = Context.getConceptService().getConceptByName(conceptName)
        BahmniObservation newObservation = new BahmniObservation()
        newObservation.setConcept(new EncounterTransaction.Concept(concept.getUuid(), conceptName))
        newObservation.setObservationDateTime(obsDatetime);
        parent == null ? encounterTransaction.addObservation(newObservation) : parent.addGroupMember(newObservation)
        return newObservation
    }

    static def Double calculateBMI(Double height, Double weight) {
        if (height == ZERO) {
            throw new IllegalArgumentException("Please enter Height greater than zero")
        } else if (weight == ZERO) {
            throw new IllegalArgumentException("Please enter Weight greater than zero")
        }
        Double heightInMeters = height / 100;
        Double value = weight / (heightInMeters * heightInMeters);
        return roundOffToTwoDecimalPlaces(value);
    };

    static Double roundOffToTwoDecimalPlaces(Double value) {
        return new BigDecimal(value).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
    }

    static BahmniObservation find(String conceptName, Collection<BahmniObservation> observations, BahmniObservation parent) {
        for (BahmniObservation observation : observations) {
            if (conceptName.equalsIgnoreCase(observation.getConcept().getName())) {
                return observation;
            }
            BahmniObservation matchingObservation = find(conceptName, observation.getGroupMembers(), observation)
            if (matchingObservation) return matchingObservation;
        }
        return null
    }

}

