class CompaniesController < WebsiteController
  def index
    @objects  = Company.all
  end
end
