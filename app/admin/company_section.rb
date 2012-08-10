ActiveAdmin.register CompanySection do
  menu false

  controller do
    def create
      create! do |format|
        format.html { redirect_to admin_company_path(resource.company) }
      end
    end

    def update
      update! do |format|
        format.html { redirect_to admin_company_path(resource.company) }
      end
    end

    def destroy
      destroy! do |format|
        format.html { redirect_to admin_company_path(resource.company) }
      end
    end

    defaults :finder => :find_by_slug
  end

  form do |f|
    f.inputs "Details" do
      f.input :title, :required => true
      f.input :description, :as => :text, :required => true
      f.input :company, :required => true, :as => :select, :collection => Company.order_by("title ASC").all
    end
    f.buttons do
      f.commit_button
    end
  end

  show :title => :title do
    ul :id => "company_section_page", :class => "show-page index_as_reorder_table" do
      li :class => "links" do
         ( link_to("All Companies", admin_companies_path) +
           " / " + link_to(company_section.company.title, admin_company_path(company_section.company)) +
           " / #{company_section.title}" ).html_safe
      end
      li :class => "table-caption" do
        h3 "Folders"
      end
      li do
        if company_section.company_section_folders.size > 0
          table_for(company_section.company_section_folders, {:id => "company_section_folders", :class => "index_table reorder"}) do |t|
            t.column "" do |o|
              link_to admin_company_section_folder_path(o) do
                image_tag o.image.thumbnail
              end
            end

            t.column "Folder Details" do |o|
              "<p><strong>#{link_to o.title, admin_company_section_folder_path(o)}</strong></p><p>#{o.description}</p>".html_safe
            end

            t.column "" do |o|
              link_to("Edit",   edit_admin_company_section_folder_path(o),  :class => "member_link") +
              link_to("Delete", admin_company_section_folder_path(o),       :class => "member_link", :method => :delete, :confirm => "Are you sure?")
            end
          end
        else
          p "No folders for this company section."
        end
      end
    end
  end

  action_item :only => :show do
    link_to('New Company Section Folder', new_admin_company_section_folder_path + "?company_section_id=#{resource.id}")
  end

  collection_action :reorder, :method => :put do
    render :text => resource_class.reorder_objects(params[:ids])
  end
end
