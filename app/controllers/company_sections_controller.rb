class CompanySectionsController < WebsiteController
  def show
    @object = CompanySection.find_by_slug!(params[:id])
    @subsections = @object.company_subsections
  end
end