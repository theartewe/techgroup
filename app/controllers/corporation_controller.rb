class CorporationController < WebsiteController
  def index
    @objects = CorporationHistoryEntry.all
    puts @objects
  end
  
  def board_of_directors
   
  end
  
  def ceo_message
     
  end
  
  def clients
     
  end
  
  def corporate_partners
     
  end
  
end
