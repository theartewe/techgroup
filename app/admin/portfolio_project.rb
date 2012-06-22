ActiveAdmin.register PortfolioProject, :as=> "Project" do
  menu :parent 	=> "Portfolio"

   controller do
    defaults :finder => :find_by_slug
  end
  
  index do
    column :id do |obj|
      link_to obj.id, edit_admin_portfolio_project_path(obj)
    end
    column :title do |obj|
      link_to obj.title, edit_admin_portfolio_project_path(obj)
    end
    column :client
    column :image do |obj|
      img :src=>obj.image.thumbnail
    end
  end

  form do |f|
    f.inputs do
      f.input :title, :required => true
      f.input :client, :required => true
      f.input :consultant, :required => true
      f.input :main_contractor, :required => true
      f.input :sub_contractors, :as=>:text,  :required => true
      f.input :project_worth, :required => true
      f.input :location, :required => true
      f.input :image, :as => :file, :required => true
    end
    f.buttons
  end
  
  show :title => :title do
    h1 do 
      resource.title
    end
    div :id => "client" do 
      resource.client
    end
    div :id => "consultant" do
      resource.consultant
    end
    div :id => "main_contractor" do
      resource.main_contractor
    end
    div :id => "sub_contractors" do
      resource.sub_contractors
    end
    div :id => "project_worth" do
      resource.project_worth
    end
    div :id => "location" do
      resource.location
    end
    div do
      img :src=>resource.image.thumbnail
    end
  end
end