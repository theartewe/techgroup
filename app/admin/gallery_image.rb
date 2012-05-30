ActiveAdmin.register GalleryImage, :as => "Image" do
  index :as => :block do |image|
    div :for => image do
      link_to(image_tag(image.image.try(:thumbnail).try(:url)), admin_image_path(image))
    end
  end

  form do |f|
    f.inputs do
      f.input :title, :required => true
      f.input :image
    end
    f.buttons
  end

  show :title => :title do |i|
    panel "Image" do
        attributes_table_for i do
          row("Title")    { i.title  }
          row("URL")      { link_to i.image.try(:optimized).try(:url), i.image.try(:optimized).try(:url) }
          row("Image")    { image_tag(i.image.try(:optimized).try(:url)) }
        end
    end
  end
end
