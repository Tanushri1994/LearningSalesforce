trigger createChildContact on Account (after insert) {
//Create a child Contact record with same last name as account, when a new Account record is created with rating = Hot and Industry = Banking.
    List<Contact> contactList = new List<Contact>();
    for(Account acc : trigger.new){
        if(acc.Rating == 'Hot' && acc.Industry == 'Banking'){
            Contact cont = new Contact();             
            cont.AccountId = acc.id;
             cont.LastName = acc.Name;
                  
            contactList.add(cont);
        }
    }
    insert contactList;
}