@RestResource(urlMapping='/ContactCase/*')
global class GetcaseApi {
 @HttpGet
  global static List<Case> getConsumer()
    {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        res.addHeader('Content-Type', 'application/json');
        string email;
        if(req.params.get('email')!= null)
        {
        email =req.params.get('email');
        }
        case[]result=[select Id,Contact.Name,Contact.Email,CaseNumber,Origin From Case Where  Contact.Email='siva@apitest12.com' ];
        return result;   
       
    }
    
}