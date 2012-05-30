ActiveAdmin.register Page do
  controller do
    actions :all, :except => [:new, :destroy]
  end

  index do
    column :name do |page|
      link_to page.name, admin_page_path(page)
    end
    column :path do |page|
      link_to page.path, page.path, html_options = { :title => page.name, :target => "_blank" }
    end
  end

  show :title => :name do
    panel("Page Details") do
      attributes_table_for resource, :id, :name, :path,
                                     :english_title, :english_description,
                                     :arabic_title, :arabic_description
    end

    resource.page_sections.each do |section|
      if not section.default_image_url
          panel(section.english_title) do
            # Page section update URL
            url = edit_admin_page_section_path(section)
            url.gsub!('/edit', '.json')

            active_admin_form_for(section, :url => url, :html => {:class => "inline_form"}) do |f|
              f.inputs do
                f.input :english_title
                f.input :english_text,        :as         => :text,
                                              :input_html => { :rows => 8 }
                f.input :arabic_title
                f.input :arabic_text,         :as         => :text,
                                              :input_html => { :rows => 8 }
              end
              f.buttons do
                f.commit_button
              end
            end
          end
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :english_title
      f.input :english_description
      f.input :arabic_title
      f.input :arabic_description
    end
    f.buttons
  end
end
