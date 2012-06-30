ActiveAdmin.register Slide do

  index do
    column :name do |slide|
      link_to slide.title, edit_admin_slide_path(slide)
    end
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
end
