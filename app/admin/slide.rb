ActiveAdmin.register Slide do

  actions :all, :except => [:show]

  index  :as => :reorder_table do
    column "" do |slide|
      image_tag slide.image.thumb, :size => "290x156"
    end
    column :name do |slide|
      link_to slide.title, edit_admin_slide_path(slide)
    end
    default_actions
  end

  show do
    div :id => "title" do
      h1 resource.title
    end
    div :id => "image" do
      img :src => resource.image.full
    end
  end

  form do |f|
    f.inputs do
      f.input :title, :required => true
      f.input :image, :as => :file, :required => true
    end

    f.buttons
  end

  collection_action :reorder, :method => :put do
    render :text => resource_class.reorder_objects(params[:ids])
  end
end
