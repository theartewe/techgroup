class PortfolioController < WebsiteController
  def index
    
  end
  
  def show
    
  end
  
  def projects
    @objects = PortfolioProject.all()
  end
  
  def operations
    @objects = PortfolioOperation.all()
  end
  
end
