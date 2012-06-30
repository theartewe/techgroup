class HomeController < WebsiteController
  def index
    @slides = Slide.all
    @companies = Company.all
  end
end
