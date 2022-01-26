public class AnimalLocator{
    public static String getAnimalNameById(Integer x){
        String name='';
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + x);
        req.setMethod('GET');
        
        HttpResponse res = http.send(req);
        if (res.getStatusCode() == 200) {
            Map<String, Object> results = (Map<String, Object>)JSON.deserializeUntyped(res.getBody());
            System.debug(results);
            Map<String, Object> animal = (Map<String, Object>) results.get('animal');
           name= (String)animal.get('name');
            System.debug(name);
            
        }
        return name;
    }
}