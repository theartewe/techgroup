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
  
end
