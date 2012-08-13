ActiveAdmin.register Client do
  menu :parent 	=> "Corporation", :label => "Clients' Portfolio"
  
  index do 
    column :title do |obj|
      link_to obj.title, edit_admin_client_path(obj)
    end
    column :description
    column :image do |obj|
      img :src=>obj.image.thumbnail
    end
  end

  form do |f|
    f.inputs do
      f.input :title, :required => true
      f.input :description, :as => :text, :required => true
      f.input :image, :as => :file, :required => true
    end
    f.buttons
  end

  show :title => :title do
    h1 resource.title
    div resource.description
    div do
     img :src=>resource.image.thumbnail
    end
  end
end
