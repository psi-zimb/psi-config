import org.bahmni.module.bahmnicore.service.impl.BahmniBridge
import org.openmrs.*
import org.bahmni.module.elisatomfeedclient.api.elisFeedInterceptor.ElisFeedEncounterInterceptor;import java.util.Locale
import java.util.Set
import org.openmrs.api.OrderContext;
import org.openmrs.api.context.Context;
import org.openmrs.api.db.hibernate.DbSessionFactory;
import org.hibernate.FlushMode;



public class CreatinineUpdate implements ElisFeedEncounterInterceptor {
    public static final String CREATININE_TEST_NAME_1STVISIT = "Creatinine (1st Visit)";
    public static final String CREATINIE_CLEARANCE_TEST_NAME_1STVISIT = "Creatinine Clearance (1st Visit)";
    public static final String CREATININE_TEST_NAME_16WEEKS = "Creatinine (16 Weeks)";
    public static final String CREATINIE_CLEARANCE_TEST_NAME_16WEEKS = "Creatinine Clearance (16 Weeks)";
    public static final String CREATININE_TEST_NAME_24WEEKS = "Creatinine (24 Weeks)";
    public static final String CREATINIE_CLEARANCE_TEST_NAME_24WEEKS = "Creatinine Clearance (24 Weeks)";
    public static final String CREATININE_TEST_NAME_48WEEKS = "Creatinine (48 Weeks)";
    public static final String CREATINIE_CLEARANCE_TEST_NAME_48WEEKS = "Creatinine Clearance (48 Weeks)";
    public static final String CREATININE_TEST_NAME_6MONTHLY = "Creatinine (6 Monthly)";
    public static final String CREATINIE_CLEARANCE_TEST_NAME_6MONTHLY = "Creatinine Clearance (6 Monthly)";
    public static final String CREATININE_TEST_NAME_YEARLY = "Creatinine (Yearly)";
    public static final String CREATINIE_CLEARANCE_TEST_NAME_YEARLY = "Creatinine Clearance (Yearly)";
    public static final String CREATININE_TEST_NAME_BASELINE = "Creatinine (Baseline)";
    public static final String CREATINIE_CLEARANCE_TEST_NAME_BASELINE = "Creatinine Clearance (Baseline)";
    public static final String CREATININE_TEST_NAME_CHEMISTRY = "Creatinine (Chem)";
    public static final String CREATINIE_CLEARANCE_TEST_NAME_CHEMISTRY = "Creatinine Clearance (Chem)";
    public static final String CREATININE_TEST_NAME_UNE = "Creatinine (UnE)";
    public static final String CREATINIE_CLEARANCE_TEST_NAME_UNE = "Creatinine Clearance (UnE)";
    public static final String WEIGHT_CONCEPT_NAME = "WEIGHT";
    public BahmniBridge bahmniBridge;

    public void run(Set<Encounter> encounters) {
        DbSessionFactory sessionFactory = Context.getRegisteredComponent("dbSessionFactory", DbSessionFactory.class);
        FlushMode flushMode = sessionFactory.getCurrentSession().getFlushMode();
        sessionFactory.getCurrentSession().setFlushMode(FlushMode.MANUAL);
        try {
            Obs creatinine1stVisitObs = getCreatinineObs1stVisit(encounters);
            Obs creatinine16WeeksObs = getCreatinineObs16Weeks(encounters);
            Obs creatinine24WeeksObs = getCreatinineObs24Weeks(encounters);
            Obs creatinine48WeeksObs = getCreatinineObs48Weeks(encounters);
            Obs creatinine6MonthlyObs = getCreatinineObs6Monthly(encounters);
            Obs creatinineYearlyObs = getCreatinineObsYearly(encounters);
            Obs creatinineBaselineObs = getCreatinineObsBaseline(encounters);
            Obs creatinineChemistryObs = getCreatinineObsChemistry(encounters);
            Obs creatinineUnEObs = getCreatinineObsUnE(encounters);

        } finally {
            sessionFactory.getCurrentSession().setFlushMode(flushMode)
        }
    }

    private Obs getCreatinineObs1stVisit(Set<Encounter> encounters) {
        for (Encounter encounter : encounters) {
            for (Obs obs : encounter.getObs()) {
                if (obs.getOrder() != null && obs.getConcept().getFullySpecifiedName(Locale.ENGLISH).getName().equals(CREATININE_TEST_NAME_1STVISIT)) {

                    Concept creatinineClearanceRateConcept = BahmniBridge.create().getConcept(CREATINIE_CLEARANCE_TEST_NAME_1STVISIT);
                    Order order = new Order();
                    order.setOrderType(obs.getOrder().getOrderType());
                    order.setConcept(creatinineClearanceRateConcept);
                    order.setOrderer(obs.getOrder().getOrderer());
                    order.setCareSetting(obs.getOrder().getCareSetting());
                    order.setAccessionNumber(obs.getAccessionNumber());
                    order.setEncounter(encounter);
                    order.setPatient(obs.getOrder().getPatient());
                    encounter.addOrder(order);
                    Obs creatinineClearanceObs = getObs(obs, creatinineClearanceRateConcept,order);
                    if(creatinineClearanceObs != null){
                        Obs creatinineClearanceObsOne = getObs(obs, creatinineClearanceRateConcept,order);
                        creatinineClearanceObs.setValueNumeric(null);
                        creatinineClearanceObs.addGroupMember(creatinineClearanceObsOne);

                        Obs creatinineClearanceObsTwo = getObs(obs, creatinineClearanceRateConcept,order);
                        creatinineClearanceObsOne.setValueNumeric(null);
                        creatinineClearanceObsOne.addGroupMember(creatinineClearanceObsTwo)

                        encounter.addObs(creatinineClearanceObs);
                        encounter.addObs(creatinineClearanceObsOne);
                        encounter.addObs(creatinineClearanceObsTwo);
                    }
                    Context.getEncounterService().saveEncounter(encounter);
                    return creatinineClearanceObs;
                }
            }
        }
        return null;
    }

    private Obs getCreatinineObs16Weeks(Set<Encounter> encounters) {
        for (Encounter encounter : encounters) {
            for (Obs obs : encounter.getObs()) {
                if (obs.getOrder() != null && obs.getConcept().getFullySpecifiedName(Locale.ENGLISH).getName().equals(CREATININE_TEST_NAME_16WEEKS)) {

                    Concept creatinineClearanceRateConcept = BahmniBridge.create().getConcept(CREATINIE_CLEARANCE_TEST_NAME_16WEEKS);
                    Order order = new Order();
                    order.setOrderType(obs.getOrder().getOrderType());
                    order.setConcept(creatinineClearanceRateConcept);
                    order.setOrderer(obs.getOrder().getOrderer());
                    order.setCareSetting(obs.getOrder().getCareSetting());
                    order.setAccessionNumber(obs.getAccessionNumber());
                    order.setEncounter(encounter);
                    order.setPatient(obs.getOrder().getPatient());
                    encounter.addOrder(order);
                    Obs creatinineClearanceObs = getObs(obs, creatinineClearanceRateConcept,order);
                    if(creatinineClearanceObs != null){
                        Obs creatinineClearanceObsOne = getObs(obs, creatinineClearanceRateConcept,order);
                        creatinineClearanceObs.setValueNumeric(null);
                        creatinineClearanceObs.addGroupMember(creatinineClearanceObsOne);

                        Obs creatinineClearanceObsTwo = getObs(obs, creatinineClearanceRateConcept,order);
                        creatinineClearanceObsOne.setValueNumeric(null);
                        creatinineClearanceObsOne.addGroupMember(creatinineClearanceObsTwo)

                        encounter.addObs(creatinineClearanceObs);
                        encounter.addObs(creatinineClearanceObsOne);
                        encounter.addObs(creatinineClearanceObsTwo);
                    }
                    Context.getEncounterService().saveEncounter(encounter);
                    return creatinineClearanceObs;
                }
            }
        }
        return null;
    }

    private Obs getCreatinineObs24Weeks(Set<Encounter> encounters) {
        for (Encounter encounter : encounters) {
            for (Obs obs : encounter.getObs()) {
                if (obs.getOrder() != null && obs.getConcept().getFullySpecifiedName(Locale.ENGLISH).getName().equals(CREATININE_TEST_NAME_24WEEKS)) {

                    Concept creatinineClearanceRateConcept = BahmniBridge.create().getConcept(CREATINIE_CLEARANCE_TEST_NAME_24WEEKS);
                    Order order = new Order();
                    order.setOrderType(obs.getOrder().getOrderType());
                    order.setConcept(creatinineClearanceRateConcept);
                    order.setOrderer(obs.getOrder().getOrderer());
                    order.setCareSetting(obs.getOrder().getCareSetting());
                    order.setAccessionNumber(obs.getAccessionNumber());
                    order.setEncounter(encounter);
                    order.setPatient(obs.getOrder().getPatient());
                    encounter.addOrder(order);
                    Obs creatinineClearanceObs = getObs(obs, creatinineClearanceRateConcept,order);
                    if(creatinineClearanceObs != null){
                        Obs creatinineClearanceObsOne = getObs(obs, creatinineClearanceRateConcept,order);
                        creatinineClearanceObs.setValueNumeric(null);
                        creatinineClearanceObs.addGroupMember(creatinineClearanceObsOne);

                        Obs creatinineClearanceObsTwo = getObs(obs, creatinineClearanceRateConcept,order);
                        creatinineClearanceObsOne.setValueNumeric(null);
                        creatinineClearanceObsOne.addGroupMember(creatinineClearanceObsTwo)

                        encounter.addObs(creatinineClearanceObs);
                        encounter.addObs(creatinineClearanceObsOne);
                        encounter.addObs(creatinineClearanceObsTwo);
                    }
                    Context.getEncounterService().saveEncounter(encounter);
                    return creatinineClearanceObs;
                }
            }
        }
        return null;
    }

    private Obs getCreatinineObs48Weeks(Set<Encounter> encounters) {
        for (Encounter encounter : encounters) {
            for (Obs obs : encounter.getObs()) {
                if (obs.getOrder() != null && obs.getConcept().getFullySpecifiedName(Locale.ENGLISH).getName().equals(CREATININE_TEST_NAME_48WEEKS)) {

                    Concept creatinineClearanceRateConcept = BahmniBridge.create().getConcept(CREATINIE_CLEARANCE_TEST_NAME_48WEEKS);
                    Order order = new Order();
                    order.setOrderType(obs.getOrder().getOrderType());
                    order.setConcept(creatinineClearanceRateConcept);
                    order.setOrderer(obs.getOrder().getOrderer());
                    order.setCareSetting(obs.getOrder().getCareSetting());
                    order.setAccessionNumber(obs.getAccessionNumber());
                    order.setEncounter(encounter);
                    order.setPatient(obs.getOrder().getPatient());
                    encounter.addOrder(order);
                    Obs creatinineClearanceObs = getObs(obs, creatinineClearanceRateConcept,order);
                    if(creatinineClearanceObs != null){
                        Obs creatinineClearanceObsOne = getObs(obs, creatinineClearanceRateConcept,order);
                        creatinineClearanceObs.setValueNumeric(null);
                        creatinineClearanceObs.addGroupMember(creatinineClearanceObsOne);

                        Obs creatinineClearanceObsTwo = getObs(obs, creatinineClearanceRateConcept,order);
                        creatinineClearanceObsOne.setValueNumeric(null);
                        creatinineClearanceObsOne.addGroupMember(creatinineClearanceObsTwo)

                        encounter.addObs(creatinineClearanceObs);
                        encounter.addObs(creatinineClearanceObsOne);
                        encounter.addObs(creatinineClearanceObsTwo);
            }
                        Context.getEncounterService().saveEncounter(encounter);
                        return creatinineClearanceObs;
                }
            }
        }
        return null;
    }

    private Obs getCreatinineObs6Monthly(Set<Encounter> encounters) {
        for (Encounter encounter : encounters) {
            for (Obs obs : encounter.getObs()) {
                if (obs.getOrder() != null && obs.getConcept().getFullySpecifiedName(Locale.ENGLISH).getName().equals(CREATININE_TEST_NAME_6MONTHLY)) {

                    Concept creatinineClearanceRateConcept = BahmniBridge.create().getConcept(CREATINIE_CLEARANCE_TEST_NAME_6MONTHLY);
                    Order order = new Order();
                    order.setOrderType(obs.getOrder().getOrderType());
                    order.setConcept(creatinineClearanceRateConcept);
                    order.setOrderer(obs.getOrder().getOrderer());
                    order.setCareSetting(obs.getOrder().getCareSetting());
                    order.setAccessionNumber(obs.getAccessionNumber());
                    order.setEncounter(encounter);
                    order.setPatient(obs.getOrder().getPatient());
                    encounter.addOrder(order);
                    Obs creatinineClearanceObs = getObs(obs, creatinineClearanceRateConcept,order);
                    if(creatinineClearanceObs != null){
                        Obs creatinineClearanceObsOne = getObs(obs, creatinineClearanceRateConcept,order);
                        creatinineClearanceObs.setValueNumeric(null);
                        creatinineClearanceObs.addGroupMember(creatinineClearanceObsOne);

                        Obs creatinineClearanceObsTwo = getObs(obs, creatinineClearanceRateConcept,order);
                        creatinineClearanceObsOne.setValueNumeric(null);
                        creatinineClearanceObsOne.addGroupMember(creatinineClearanceObsTwo)

                        encounter.addObs(creatinineClearanceObs);
                        encounter.addObs(creatinineClearanceObsOne);
                        encounter.addObs(creatinineClearanceObsTwo);
            }
                        Context.getEncounterService().saveEncounter(encounter);
                        return creatinineClearanceObs;
                }
            }
        }
        return null;
    }

    private Obs getCreatinineObsYearly(Set<Encounter> encounters) {
        for (Encounter encounter : encounters) {
            for (Obs obs : encounter.getObs()) {
                if (obs.getOrder() != null && obs.getConcept().getFullySpecifiedName(Locale.ENGLISH).getName().equals(CREATININE_TEST_NAME_YEARLY)) {

                    Concept creatinineClearanceRateConcept = BahmniBridge.create().getConcept(CREATINIE_CLEARANCE_TEST_NAME_YEARLY);
                    Order order = new Order();
                    order.setOrderType(obs.getOrder().getOrderType());
                    order.setConcept(creatinineClearanceRateConcept);
                    order.setOrderer(obs.getOrder().getOrderer());
                    order.setCareSetting(obs.getOrder().getCareSetting());
                    order.setAccessionNumber(obs.getAccessionNumber());
                    order.setEncounter(encounter);
                    order.setPatient(obs.getOrder().getPatient());
                    encounter.addOrder(order);
                    Obs creatinineClearanceObs = getObs(obs, creatinineClearanceRateConcept,order);
                    if(creatinineClearanceObs != null){
                        Obs creatinineClearanceObsOne = getObs(obs, creatinineClearanceRateConcept,order);
                        creatinineClearanceObs.setValueNumeric(null);
                        creatinineClearanceObs.addGroupMember(creatinineClearanceObsOne);

                        Obs creatinineClearanceObsTwo = getObs(obs, creatinineClearanceRateConcept,order);
                        creatinineClearanceObsOne.setValueNumeric(null);
                        creatinineClearanceObsOne.addGroupMember(creatinineClearanceObsTwo)

                        encounter.addObs(creatinineClearanceObs);
                        encounter.addObs(creatinineClearanceObsOne);
                        encounter.addObs(creatinineClearanceObsTwo);
            }
                        Context.getEncounterService().saveEncounter(encounter);
                        return creatinineClearanceObs;
                }
            }
        }
        return null;
    }

    private Obs getCreatinineObsBaseline(Set<Encounter> encounters) {
        for (Encounter encounter : encounters) {
            for (Obs obs : encounter.getObs()) {
                if (obs.getOrder() != null && obs.getConcept().getFullySpecifiedName(Locale.ENGLISH).getName().equals(CREATININE_TEST_NAME_BASELINE)) {

                    Concept creatinineClearanceRateConcept = BahmniBridge.create().getConcept(CREATINIE_CLEARANCE_TEST_NAME_BASELINE);
                    Order order = new Order();
                    order.setOrderType(obs.getOrder().getOrderType());
                    order.setConcept(creatinineClearanceRateConcept);
                    order.setOrderer(obs.getOrder().getOrderer());
                    order.setCareSetting(obs.getOrder().getCareSetting());
                    order.setAccessionNumber(obs.getAccessionNumber());
                    order.setEncounter(encounter);
                    order.setPatient(obs.getOrder().getPatient());
                    encounter.addOrder(order);
                    Obs creatinineClearanceObs = getObs(obs, creatinineClearanceRateConcept,order);
                    if(creatinineClearanceObs != null){
                        Obs creatinineClearanceObsOne = getObs(obs, creatinineClearanceRateConcept,order);
                        creatinineClearanceObs.setValueNumeric(null);
                        creatinineClearanceObs.addGroupMember(creatinineClearanceObsOne);

                        Obs creatinineClearanceObsTwo = getObs(obs, creatinineClearanceRateConcept,order);
                        creatinineClearanceObsOne.setValueNumeric(null);
                        creatinineClearanceObsOne.addGroupMember(creatinineClearanceObsTwo)

                        encounter.addObs(creatinineClearanceObs);
                        encounter.addObs(creatinineClearanceObsOne);
                        encounter.addObs(creatinineClearanceObsTwo);
            }
                        Context.getEncounterService().saveEncounter(encounter);
                        return creatinineClearanceObs;
                }
            }
        }
        return null;
    }

    private Obs getCreatinineObsChemistry(Set<Encounter> encounters) {
        for (Encounter encounter : encounters) {
            for (Obs obs : encounter.getObs()) {
                if (obs.getOrder() != null && obs.getConcept().getFullySpecifiedName(Locale.ENGLISH).getName().equals(CREATININE_TEST_NAME_CHEMISTRY)) {

                    Concept creatinineClearanceRateConcept = BahmniBridge.create().getConcept(CREATINIE_CLEARANCE_TEST_NAME_CHEMISTRY);
                    Order order = new Order();
                    order.setOrderType(obs.getOrder().getOrderType());
                    order.setConcept(creatinineClearanceRateConcept);
                    order.setOrderer(obs.getOrder().getOrderer());
                    order.setCareSetting(obs.getOrder().getCareSetting());
                    order.setAccessionNumber(obs.getAccessionNumber());
                    order.setEncounter(encounter);
                    order.setPatient(obs.getOrder().getPatient());
                    encounter.addOrder(order);
                    Obs creatinineClearanceObs = getObs(obs, creatinineClearanceRateConcept,order);
                    if(creatinineClearanceObs != null){
                        Obs creatinineClearanceObsOne = getObs(obs, creatinineClearanceRateConcept,order);
                        creatinineClearanceObs.setValueNumeric(null);
                        creatinineClearanceObs.addGroupMember(creatinineClearanceObsOne);

                        Obs creatinineClearanceObsTwo = getObs(obs, creatinineClearanceRateConcept,order);
                        creatinineClearanceObsOne.setValueNumeric(null);
                        creatinineClearanceObsOne.addGroupMember(creatinineClearanceObsTwo)

                        encounter.addObs(creatinineClearanceObs);
                        encounter.addObs(creatinineClearanceObsOne);
                        encounter.addObs(creatinineClearanceObsTwo);
            }
                        Context.getEncounterService().saveEncounter(encounter);
                        return creatinineClearanceObs;
                }
            }
        }
        return null;
    }

    private Obs getCreatinineObsUnE(Set<Encounter> encounters) {
        for (Encounter encounter : encounters) {
            for (Obs obs : encounter.getObs()) {
                if (obs.getOrder() != null && obs.getConcept().getFullySpecifiedName(Locale.ENGLISH).getName().equals(CREATININE_TEST_NAME_UNE)) {

                    Concept creatinineClearanceRateConcept = BahmniBridge.create().getConcept(CREATINIE_CLEARANCE_TEST_NAME_UNE);
                    Order order = new Order();
                    order.setOrderType(obs.getOrder().getOrderType());
                    order.setConcept(creatinineClearanceRateConcept);
                    order.setOrderer(obs.getOrder().getOrderer());
                    order.setCareSetting(obs.getOrder().getCareSetting());
                    order.setAccessionNumber(obs.getAccessionNumber());
                    order.setEncounter(encounter);
                    order.setPatient(obs.getOrder().getPatient());
                    encounter.addOrder(order);
                    Obs creatinineClearanceObs = getObs(obs, creatinineClearanceRateConcept,order);
                    if(creatinineClearanceObs != null){
                        Obs creatinineClearanceObsOne = getObs(obs, creatinineClearanceRateConcept,order);
                        creatinineClearanceObs.setValueNumeric(null);
                        creatinineClearanceObs.addGroupMember(creatinineClearanceObsOne);

                        Obs creatinineClearanceObsTwo = getObs(obs, creatinineClearanceRateConcept,order);
                        creatinineClearanceObsOne.setValueNumeric(null);
                        creatinineClearanceObsOne.addGroupMember(creatinineClearanceObsTwo)

                        encounter.addObs(creatinineClearanceObs);
                        encounter.addObs(creatinineClearanceObsOne);
                        encounter.addObs(creatinineClearanceObsTwo);
            }
                        Context.getEncounterService().saveEncounter(encounter);
                        return creatinineClearanceObs;
                }
            }
        }
        return null;
    }

    private Obs getObs(Obs obs, Concept creatinineClearanceRateConcept, Order order) {

        this.bahmniBridge = BahmniBridge.create().forPatient(obs.getPerson().getUuid());
        Obs weighttval=bahmniBridge.latestObs(WEIGHT_CONCEPT_NAME);
    if (weighttval == null)
        return null;
        Integer personage = obs.getPerson().getAge();
        String gender = obs.getPerson().getGender();
        double CreatinineClearanceRate = 0.0;

        if (gender.equals('M')) {
            CreatinineClearanceRate = (double)Math.round((1.23 * (140 - personage) * weighttval.getValueNumeric()) / obs.getValueNumeric());
        } else if (gender.equals('F')) {
            CreatinineClearanceRate = (double)Math.round((1.04 * (140 - personage) * weighttval.getValueNumeric()) / obs.getValueNumeric());
        }


        Obs creatinineClearanceObs = new Obs();
        creatinineClearanceObs.setConcept(creatinineClearanceRateConcept);
        creatinineClearanceObs.setValueNumeric(CreatinineClearanceRate);
        creatinineClearanceObs.setOrder(order);
        return creatinineClearanceObs;
    }

}
