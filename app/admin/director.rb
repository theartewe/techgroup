ActiveAdmin.register Director, :as=>"Directors" do
  menu :parent 	=> "Corporation"

  controller do
    defaults :finder => :find_by_slug
  end
  
  index do 
    column "" do |obj|
      image_tag obj.image.thumbnail
    end
    column :name do |obj|
      "#{link_to(obj.name, edit_admin_director_path(obj))}<br/>#{obj.title}".html_safe
    end
    column :description
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
