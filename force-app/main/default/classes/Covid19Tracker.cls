public class Covid19Tracker {

    public static void getCovidDate()
    {
        string baseURL = 'https://icanhazdadjoke.com/';
        HTTPRequest request = new HTTPRequest();
        request.setEndpoint(baseURL);
        request.setMethod('GET');
        request.setHeader('Accept','text/plain');
         
        Http h = new Http();
        HttpResponse response = h.send(request);
        System.debug('Response :'+response.getBody());
    }
}