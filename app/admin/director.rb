ActiveAdmin.register Director, :as => "Directors" do
  menu :parent 	=> "Corporation"

  actions :all, :except => [:show, :new, :create, :destroy]

  controller do
    defaults :finder => :find_by_slug
  end
  
  index :as => :reorder_table do 
    column "" do |obj|
      image_tag obj.image.thumbnail
    end
    column :name do |obj|
      "<p>#{link_to(obj.name, edit_admin_director_path(obj))}<br/>#{obj.title}</p>#{obj.description}".html_safe
    end
  end

  form do |f|
    f.inputs do
      f.input :name, :required => true
      f.input :title, :required => true
      f.input :description, :as => :text
      f.input :image, :as => :file, :required => true
    end
    f.buttons
  end

  show :title => :title do
    h1 resource.name
    div resource.title
    div resource.description
    div do
      img :src=>resource.image.thumbnail
    end
  end

  collection_action :reorder, :method => :put do
    render :text => resource_class.reorder_objects(params[:ids])
  end
end
