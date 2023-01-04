@RestResource(urlMapping='/ContactManagement/*')
global class ConsumerDetailApi {
    @HttpGet
    global static Case getConsumer()
    {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        res.addHeader('Content-Type', 'application/json');
        string email;
        if(req.params.get('email') != null)
        {
        email =req.params.get('email');
        }
       Case result =[select Contact.Name,Contact.Email,CaseNumber From Case Where Contact.Email='siva@apitest12.com'];        
        return result;
    }
        
        
    }