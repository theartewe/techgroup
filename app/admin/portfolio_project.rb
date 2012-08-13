ActiveAdmin.register PortfolioProject, :as=> "Project" do
  menu :parent 	=> "Portfolio"

  actions :all, :except => [:show]

  index :as => :reorder_table do
    column "" do |obj|
      image_tag obj.image.thumbnail
    end
    column :title do |obj|
      "#{link_to(obj.title, edit_admin_project_path(obj))}<br/>#{obj.client}".html_safe
    end

    default_actions
  end

  form do |f|
    f.inputs "Project Details" do
      f.input :title, :required => true
      f.input :client, :required => true
      f.input :consultant, :required => true
      f.input :main_contractor, :required => true
      f.input :sub_contractors, :as=>:text,  :required => true
      f.input :project_worth, :required => true
      f.input :location, :required => true
      f.input :image, :as => :file, :required => true
    end
    f.buttons
  end

  collection_action :reorder, :method => :put do
    render :text => resource_class.reorder_objects(params[:ids])
  end  
end