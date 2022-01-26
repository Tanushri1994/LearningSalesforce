public with sharing class accExtensionController {
        public Account acc;
        
    public accExtensionController(ApexPages.StandardController controller) {
        this.acc = (Account)controller.getRecord();
         acc.ownerId= userInfo.getUserId();
    }


    public PageReference Save(){
            upsert acc;
             PageReference pnext = new PageReference('/apex/OutputAccountDetail?id='+acc.id);
             pnext.setRedirect(true);
            return pnext;
    }
    
    public PageReference saveAndNew(){
    upsert acc;
    PageReference pnext = new PageReference('/apex/HelloWorld2');
    pnext.setRedirect(true);
    return pnext;
    }
}