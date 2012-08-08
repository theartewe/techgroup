class CompanySectionsController < WebsiteController
  
  def show
    @object           = CompanySection.find_by_slug!(params[:id])
    @sections         = @object.company.company_sections
    @items            = @object.company_section_items
    @company          = @object.company
    @current_section  = @object.slug
  end
  
  def inject_current_page
    @location = "our_companies"
  end
  
end
