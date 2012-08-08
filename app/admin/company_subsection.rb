ActiveAdmin.register CompanySubsection do
  menu :parent 	=> "Company", :priority => 3

   controller do
    defaults :finder => :find_by_slug
  end
  
  index do 
    column :title do |obj|
      link_to obj.title, edit_admin_company_subsection_path(obj)
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
      f.input :company_section, :required => true, :as => :select, :collection => CompanySection.order_by("title ASC").all
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
