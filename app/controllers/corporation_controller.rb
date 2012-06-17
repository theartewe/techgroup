class CorporationController < WebsiteController
  def index
     @objects = CorporationHistoryEntry.all()
  end
end
