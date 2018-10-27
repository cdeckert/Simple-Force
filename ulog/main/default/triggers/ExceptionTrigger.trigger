trigger ExceptionTrigger on Exception__e (after insert)
{
    List<String> fields = new List<String>{
        'Cause__c', 'LineNumber__c', 
        'Message__c', 'StackTraceString__c', 'TypeName__c'};
    List< ULog__c> newLogs = new List<ULog__c>();
    for(Exception__e e : trigger.new)
    {
        ULog__c l = new ULog__c();
        for(String f : fields)
        {
            l.put(f, e.get(f));
        }
        newLogs.add(l);
    }
    System.debug('*****');
    Database.insert(newLogs);
}