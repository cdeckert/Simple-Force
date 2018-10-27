public with sharing class ULog
{
    public static void log(Exception ex)
    {
        Exception__e e = new Exception__e();
        e.Cause__c = String.valueOf(ex.getCause());
        e.LineNumber__c = ex.getLineNumber();
        e.Message__c = ex.getMessage();
        e.StackTraceString__c = ex.getStackTraceString();
        // e.Exception__c = JSON.serialize(ex);
        e.TypeName__c = ex.getTypeName();
        EventBus.publish(e);
    }
}