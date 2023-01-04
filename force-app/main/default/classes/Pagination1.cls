public class Pagination1 {
private integer totalRecs =0;
private integer offsetsize =0;
private integer limitsize=5;
    
    public Pagination1()
    {
        totalRecs = [select count()from account];
    }
 public list<account> getacclist()
    {
        List<account> acc = Database.Query('SELECT Name,website,AnnualRevenue,description, Type FROM account LIMIT'+LimitSize+'OFFSET'+Offsetsize);
                      return acc;         
    }
           public void previous()
   {
       Offsetsize =OffsetSize-Limitsize;
    }
      public void next()
      {
          Offsetsize =OffsetSize+Limitsize;
         }                                        
    
        
        }