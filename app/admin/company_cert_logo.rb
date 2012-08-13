ActiveAdmin.register CompanyCertLogo do
  menu false
  
  controller do
    def create
      create! do |format|
        format.html { redirect_to admin_company_path(resource.company) }
      end
    end

    def update
      update! do |format|
        format.html { redirect_to admin_company_path(resource.company) }
      end
    end

    def destroy
      destroy! do |format|
        format.html { redirect_to admin_company_path(resource.company) }
      end
    end
  end
  
  form do |f|
    f.inputs "Image" do
      f.input :image,   :required => true
      f.input :company, :required => true
    end
    f.buttons do
      f.commit_button
    end
  end

  collection_action :reorder, :method => :put do
    render :text => resource_class.reorder_objects(params[:ids])
  end
end
