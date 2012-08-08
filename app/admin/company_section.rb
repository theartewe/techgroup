ActiveAdmin.register CompanySection do
  menu :parent 	=> "Company", :priority => 2

   controller do
    defaults :finder => :find_by_slug
  end
  
  index do 
    column :title do |obj|
      link_to obj.title, edit_admin_company_section_path(obj)
    end
    column :description
    column :company
  end

  form do |f|
    f.inputs do
      f.input :title, :required => true
      f.input :description, :as => :text, :required => true
      f.input :company, :required => true, :as => :select, :collection => Company.order_by("title ASC").all
    end
    f.buttons
  end

  show :title => :title do
    h1 resource.title
    div resource.description
    div resource.company
  end


end
