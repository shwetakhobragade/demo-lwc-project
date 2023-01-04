public class MyPage_Controller {
public PageReference savemethod()
{
    PageReference pgref =new PageReference('http://www.google.com');
    return pgref;
}
}