class PortfolioController < WebsiteController
  def index
    
  end
  
  def show
    
  end
  
  def projects
    @objects = Project.all()
  end
  
  def operations
    @objects = Project.all()
  end
  
end
