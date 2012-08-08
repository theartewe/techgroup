ActiveAdmin.register Company do
  menu :parent 	=> "Company", :priority => 1
  
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
    f.inputs "Details" do
      f.input :title, :required => true
      f.input :description, :as => :text, :required => true
      f.input :url, :required => true
    end
      
    f.inputs "Address 1" do
      f.input :contact_title
      f.input :address
      f.input :phone, :required => true
      f.input :fax
      f.input :email, :required => true
    end
      
    f.inputs "Address 2" do
      f.input :contact_title2
      f.input :address2
      f.input :phone2
      f.input :fax2
      f.input :email2
    end

    f.inputs "Address 3" do
      f.input :contact_title3
      f.input :address3
      f.input :phone3
      f.input :fax3
      f.input :email3
    end

    f.inputs "Map" do
      f.input :map_address
    end

    f.inputs "Assets" do
      f.input :logo, :as => :file, :required => true
      f.input :banner, :as => :file, :required => true
      f.input :brochure, :as => :file
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
