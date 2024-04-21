public class DailyLeadProcessor implements Schedulable {
    public void execute(SchedulableContext ctx){
        List<Lead> l = [select id, LeadSource from Lead where LeadSource = null limit 200];
        for(Lead item: l){
            item.LeadSource = 'DreamForce';
        }
        update l;
    }
}