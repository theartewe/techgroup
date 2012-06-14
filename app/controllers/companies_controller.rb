class CompaniesController < InheritedResources::Base
  def index
    @objects  = Company.all
  end
end
