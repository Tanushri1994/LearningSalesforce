trigger setIndustryOnAccountCreation on Account (before insert) {
    for(Account acc : trigger.new){
        if(acc.Rating == 'warm'){
            acc.Industry='Banking';
        }
    }
}