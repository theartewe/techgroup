class CompanySectionsController < WebsiteController
  def show
    @object = CompanySection.find_by_slug!(params[:id])
    @subsections = @object.company_subsections
    render 'companies/show_section'
  end
end
