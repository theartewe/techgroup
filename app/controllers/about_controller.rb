class AboutController < WebsiteController
  def index
    @clients = @sections.values[2..13]
  end
end
