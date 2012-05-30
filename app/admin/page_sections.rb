ActiveAdmin.register PageSection do
  menu false

  controller do
    actions :all, :except => [:new, :destroy, :show]
  end

  index do
    column :name do |section|
      if section.default_image_url
        link_to "#{section.page.name}: (Image) #{section.english_title}", edit_admin_page_section_path(section)
      else
        link_to "#{section.page.name}: #{section.english_title}", edit_admin_page_section_path(section)
      end
    end
  end

  show :title => :name do
    panel("Section Details") do
      attributes_table_for resource, :id, :name
    end
  end

  form do |f|
    f.inputs do
      f.input :english_title

      if f.object.default_image_url
        f.input :default_image_url,   :input_html => { :readonly => "readonly" }

        f.object.default_image_url.index("images/")

        if f.object.default_image_url.index("images/") != nil
          f.input :english_image
          f.input :arabic_image
        end
      else
        f.input :english_text,        :as         => :text,
                                      :input_html => { :rows => 8 }
        f.input :arabic_title
        f.input :arabic_text,         :as         => :text,
                                      :input_html => { :rows => 8 }
      end
    end

    f.buttons
  end
end
