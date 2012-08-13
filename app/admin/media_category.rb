ActiveAdmin.register MediaCategory do
  menu :parent 	=> "Media", :label => "Categories"
  
  controller do
    defaults :finder => :find_by_slug
  end
  
  index do 
    column :title do |obj|
      link_to obj.title, edit_admin_media_category_path(obj)
    end
  end

  form do |f|
    f.inputs do
      f.input :title, :required => true
    end
    f.buttons
  end

  show :title => :title do
    h1 resource.title
  end
end
