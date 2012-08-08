class CompanySectionsController < WebsiteController
  
  def show
    @object           = CompanySection.find_by_slug!(params[:id])
    @sections         = @object.company.company_sections
    @folders          = @object.company_section_folders
    @company          = @object.company
    @current_section  = @object.slug
  end
  
  def inject_current_page
    @location = "our_companies"
  end
  
end
