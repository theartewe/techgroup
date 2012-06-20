class CompanySubsectionsController < WebsiteController
  def show
    @object = CompanySubsection.find_by_slug!(params[:id])
    #@subsections = @object.company_subsections
  end
end