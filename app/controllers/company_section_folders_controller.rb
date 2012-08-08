class CompanySectionFoldersController < WebsiteController
  
  def show
    @object           = CompanySectionFolder.find_by_slug!(params[:id])

    @items            = @object.company_section_items
    @company          = @object.company_section.company
    @current_section  = @object.company_section.slug    
    
    @sections         = @company.company_sections
  end
  
  def inject_current_page
    @location = "our_companies"
  end
  
end
