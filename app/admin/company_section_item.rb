ActiveAdmin.register CompanySectionItem do
  menu false

   controller do
    def create
      create! do |format|
        format.html { redirect_to admin_company_section_folder_path(resource.company_section_folder) }
      end
    end

    def update
      update! do |format|
        format.html { redirect_to admin_company_section_folder_path(resource.company_section_folder) }
      end
    end

    def destroy
      destroy! do |format|
        format.html { redirect_to admin_company_section_folder_path(resource.company_section_folder) }
      end
    end

    defaults :finder => :find_by_slug
  end

  form do |f|
    f.inputs "Details" do
      f.input :title, :required => true
      f.input :description, :as => :text, :required => true, :input_html => {:class => "redactor"}
      f.input :image, :as => :file, :required => true
      f.input :company_section_folder, :required => true, :as => :select, :collection => CompanySectionFolder.order_by("title ASC").all
    end
    f.buttons do
      f.commit_button
    end
  end

  show :title => :title do
    h1 resource.title
    div resource.description
    div do
      img :src=>resource.image.thumbnail
    end
  end

  collection_action :reorder, :method => :put do
    render :text => resource_class.reorder_objects(params[:ids])
  end
end
