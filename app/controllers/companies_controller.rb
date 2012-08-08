class CompaniesController < WebsiteController
  
  def index
    @objects = Company.all
  end
  
  def show
    @object           = Company.find_by_slug!(params[:id])
    @sections         = @object.company_sections
    @current_section  = ""
  end
  
  def inject_current_page
    @location = "our_companies"
  end
  
end
