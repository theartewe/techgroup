ActiveAdmin.register Company do
  menu :parent 	=> "Company"
  
  controller do
    defaults :finder => :find_by_slug
  end
  
  index do 
    column :title do |obj|
      link_to obj.title, edit_admin_company_path(obj)
    end
    column :description
    column :logo do |obj|
      image_tag obj.logo
    end
    column :url
  end

  form do |f|
    f.inputs do
      f.input :title, :required => true
      f.input :description, :as => :text, :required => true
      f.input :logo, :as => :file, :required => true
      f.input :url, :required => true
    end
    f.buttons
  end

  show :title => :title do
    h1 resource.title
    div resource.description
    div resource.description
    div do
      img :src=>resource.logo
    end
    div resource.url
  end
end
