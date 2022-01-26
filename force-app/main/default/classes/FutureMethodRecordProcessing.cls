global class FutureMethodRecordProcessing {

    @future
    public static void processRecords()
    {   
        // UpdateContactAddresses uca = new UpdateContactAddresses();
        //Id batchId = Database.executeBatch(uca);
        System.debug('Inside future context');
    }
}