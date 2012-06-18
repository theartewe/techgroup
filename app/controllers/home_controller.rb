class HomeController < WebsiteController
  def index
    @slides = Slide.all()
  end
end
