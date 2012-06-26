ActiveAdmin.register PortfolioOperation, :as=> "Operation" do
  menu :parent 	=> "Portfolio"

  index do
    column :id do |obj|
      link_to obj.id, edit_admin_operation_path(obj)
    end
    column :title do |obj|
      link_to obj.title, edit_admin_operation_path(obj)
    end
  end

  form do |f|
    f.inputs do
      f.input :title, :required => true
      f.input :description, :required => true
      f.input :image, :as => :file, :required => true
    end
    f.buttons
  end
  
  show :title => :title do
    h1 do 
      resource.title
    end
    div :id => "description" do 
      resource.description
    end
    div do
      img :src=>resource.image.thumbnail
    end
  end
end
