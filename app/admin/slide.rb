ActiveAdmin.register Slide do

  controller do
    actions :all, :except => [:new, :destroy, :show]
  end

  index do
    column :name do |slide|
      link_to slide.text, edit_admin_slide_path(slide)
    end
  end

  show :title do
    div :id => "title" do
        h1 resource.title
    end
    div :id => "excerpt_html" do
        resource.excerpt.html_safe
    end
  end

  form do |f|
    f.inputs do

    end

    f.buttons
  end
end
