ActiveAdmin.register Director, :as=>"Directors" do
  menu :parent 	=> "Corporation"

  controller do
    defaults :finder => :find_by_slug
  end
  
  index do 
    column :name do |obj|
      link_to obj.name, edit_admin_director_path(obj)
    end
    column :title
    column :description
    column :image do |obj|
      img :src=>obj.image.thumbnail
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
end
