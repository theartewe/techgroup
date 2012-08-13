ActiveAdmin.register MediaObject do
  menu :parent 	=> "Media", :label => "Objects"
  
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
      f.input :created_at, :label => "Date", :input_html => { :class => "datepicker", :placeholder => "Click field to pick date" }
      f.input :pdf, :as => :file, :required => true
      f.input :image, :as => :file, :required => true
      f.input :read_more_title1
      f.input :read_more_link1
      f.input :read_more_title2
      f.input :read_more_link2
      f.input :read_more_title3
      f.input :read_more_link3
      f.input :published, :as => :boolean
    end
    f.buttons
  end

  show :title => :title do
    h1 resource.title
    div resource.description
    div resource.media_category.title
    div do
      resource.read_more_title1
      resource.read_more_link1
    end
    div do
      resource.read_more_title2
      resource.read_more_link2
    end
    div do
      resource.read_more_title3
      resource.read_more_link3
    end
    div do
      resource.pdf
    end
    div do
      img :src=>resource.image.thumbnail
    end
    div resource.published
  end
end
