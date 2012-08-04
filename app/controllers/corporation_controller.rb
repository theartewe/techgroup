class CorporationController < WebsiteController
  def index
    @objects = CorporationHistoryEntry.all
  end
  
  def board_of_directors
    @objects = Director.all
  end
  
  def ceo_message
    #@settings = Settings.first
  end
  
  def clients
    @objects = Client.all
  end
  
  def corporate_partners
    
  end
  
  def inject_current_page
    @location = "corporation"
  end
  
end
