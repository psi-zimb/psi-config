import org.bahmni.module.bahmnicore.service.impl.BahmniBridge
import org.openmrs.*
import org.bahmni.module.elisatomfeedclient.api.elisFeedInterceptor.ElisFeedEncounterInterceptor;import java.util.Locale
import java.util.Set
import org.openmrs.api.OrderContext;
import org.openmrs.api.context.Context;
import org.openmrs.api.db.hibernate.DbSessionFactory;
import org.hibernate.FlushMode;



public class CreatinineUpdate implements ElisFeedEncounterInterceptor {
    public static final String CREATININE_TEST_NAME_16WEEKS = "Creatinine (16 Weeks)";
    public static final String CREATINIE_CLEARANCE_TEST_NAME_16WEEKS = "Creatinine Clearance (16 Weeks)";
    public static final String CREATININE_TEST_NAME_48WEEKS = "Creatinine (48 Weeks)";
    public static final String CREATINIE_CLEARANCE_TEST_NAME_48WEEKS = "Creatinine Clearance (48 Weeks)";
    public static final String WEIGHT_CONCEPT_NAME = "WEIGHT";
    public BahmniBridge bahmniBridge;

    public void run(Set<Encounter> encounters) {
        DbSessionFactory sessionFactory = Context.getRegisteredComponent("dbSessionFactory", DbSessionFactory.class);
        FlushMode flushMode = sessionFactory.getCurrentSession().getFlushMode();
        sessionFactory.getCurrentSession().setFlushMode(FlushMode.MANUAL);
        try {
            Obs creatinine16WeeksObs = getCreatinineObs16Weeks(encounters);
            Obs creatinineObs = getCreatinineObs48Weeks(encounters);
        } finally {
            sessionFactory.getCurrentSession().setFlushMode(flushMode)
        }


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
