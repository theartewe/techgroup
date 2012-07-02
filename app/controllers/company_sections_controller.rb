class CompanySectionsController < WebsiteController
  
  def show
    @object = CompanySection.find_by_slug!(params[:id])
    @subsections = @object.company_subsections
  end
  
  def inject_current_page
    @location = "our_companies"
  end
  
end