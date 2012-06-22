class CompanySubsectionsController < WebsiteController
  def show
    @object = CompanySubsection.find_by_slug!(params[:id])
    @items = @object.company_subsection_items
  end
end