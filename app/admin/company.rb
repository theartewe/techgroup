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
      f.input :phone, :required => true
      f.input :fax
      f.input :email, :required => true
      f.input :logo, :as => :file, :required => true
      f.input :banner, :as => :file, :required => true
      f.input :brochure, :as => :file
      f.input :url, :required => true
    end
    f.buttons
  end

  show :title => :title do
    h1 resource.title
    div resource.description
    div do
      img :src=>resource.logo
    end
    div do
      img :src=>resource.banner.banner
    end
    div resource.url
  end
  
  #why here? I don't have a better place yet
  collection_action :change_locale, :method => :get do
    
  end
end
