

//+------------------------------------------------------------------+
void OnStart()
  {
//---

      int currentTime = TimeCurrent();
      int currentHour = TimeHour(currentTime);
      int currentMinute = TimeMinute(currentTime); 
      int startofday = currentTime - (currentHour*3600 + currentMinute*60);
      
      for (int i = OrdersTotal() -1 ; i >= 0 ; i--)
      {
            if (OrderSelect(i,SELECT_BY_POS)) 
            {
               if (OrderType() ==  0) 
               {
                  if (OrderOpenTime() > startofday) 
                  {
                     if ( !OrderClose(OrderTicket(),OrderLots(),Bid,0,clrGreen) ) { Alert("ORDER CLOSE ERROR : " + GetLastError() ); }
                  }
               }  
            }
      }
      
}      
//+------------------------------------------------------------------+
