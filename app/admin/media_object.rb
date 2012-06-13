ActiveAdmin.register MediaObject do
  menu :parent 	=> "Media"
  
  controller do
    defaults :finder => :find_by_slug
  end
  
  index do 
    column :title do |obj|
      link_to obj.title, edit_admin_media_object_path(obj)
    end
    column :description
    column :media_category
    column :published do |obj|
      status_tag (obj.published ? "Published" : "Draft"), (obj.published? ? :ok : :error)
    end
  end

  form do |f|
    f.inputs do
      f.input :title, :required => true
      f.input :description, :as => :text, :required => true
      f.input :media_category, :required => true, :as => :select, :collection => MediaCategory.order_by("title ASC").all
      f.input :published, :as => :boolean
    end
    f.buttons
  end

  show :title => :title do
    h1 resource.title
    div resource.description
    div resource.media_category.title
    div resource.published
  end
end
