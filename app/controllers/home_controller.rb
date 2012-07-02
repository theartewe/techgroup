class HomeController < WebsiteController
  def index
    @slides = Slide.all
    @companies = Company.all
  end
  
  def inject_current_page
  end
  
end
