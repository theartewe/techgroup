ActiveAdmin.register MediaCategory, :as => "Category" do
  menu :parent 	=> "Media"

  actions :all, :except => [:show]
  
  controller do
    defaults :finder => :find_by_slug
  end
  
  index :as => :reorder_table do
    column :title do |obj|
      link_to obj.title, edit_admin_media_category_path(obj)
    end

    default_actions
  end

  form do |f|
    f.inputs "Category Details" do
      f.input :title, :required => true
    end
    f.buttons
  end

  collection_action :reorder, :method => :put do
    render :text => resource_class.reorder_objects(params[:ids])
  end
end
