class CorporationController < WebsiteController
  def index
    @objects = CorporationHistoryEntry.all
  end
  
  def board_of_directors
    @objects = Director.all
  end
  
  def ceo_message
     
  end
  
  def clients
    @objects = Client.all
  end
  
  def corporate_partners
    
  end
  
end
