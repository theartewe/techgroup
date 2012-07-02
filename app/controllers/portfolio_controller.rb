class PortfolioController < WebsiteController
  def index
    @active_page = "overview"
  end
  
  def projects
    @objects = PortfolioProject.all()
  end
  
  def operations
    @objects = PortfolioOperation.all()
  end
  
  def inject_current_page
    @location = "portfolio"
  end
  
end
