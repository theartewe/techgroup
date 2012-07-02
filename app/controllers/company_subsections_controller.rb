class CompanySubsectionsController < WebsiteController
  
  def show
    @object = CompanySubsection.find_by_slug!(params[:id])
    @items = @object.company_subsection_items
  end
  
  def inject_current_page
    @location = "our_companies"
  end
  
end