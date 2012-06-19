ActiveAdmin.register CompanySection do
  menu :parent 	=> "Company"

   controller do
    defaults :finder => :find_by_slug
  end
  
  index do 
    column :title do |obj|
      link_to obj.title, edit_admin_company_section_path(obj)
    end
    column :text
  end

  form do |f|
    f.inputs do
      f.input :title, :required => true
      f.input :text, :as => :text, :required => true
    end
    f.buttons
  end

  show :title => :title do
    h1 resource.title
    div resource.text
  end


end
