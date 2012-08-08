ActiveAdmin.register CompanySectionFolder do
  menu false

   controller do
    def create
      create! do |format|
        format.html { redirect_to admin_company_section_path(resource.company_section) }
      end
    end

    def update
      update! do |format|
        format.html { redirect_to admin_company_section_path(resource.company_section) }
      end
    end

    def destroy
      destroy! do |format|
        format.html { redirect_to admin_company_section_path(resource.company_section) }
      end
    end

    defaults :finder => :find_by_slug
  end

  form do |f|
    f.inputs "Details" do
      f.input :title, :required => true
      f.input :description, :as => :text, :required => true
      f.input :image, :as => :file, :required => true
      f.input :company_section, :required => true, :as => :select, :collection => CompanySection.order_by("title ASC").all
    end
    f.buttons do
      f.commit_button
    end
  end

  show :title => :title do
    ul :id => "company_section_page", :class => "show-page index_as_reorder_table" do
      li :class => "links" do
         ( link_to("All Companies", admin_companies_path) +
           " / " + link_to(company_section_folder.company_section.company.title, admin_company_path(company_section_folder.company_section.company)) +
           " / " + link_to(company_section_folder.company_section.title, admin_company_section_path(company_section_folder.company_section)) +
           " / #{company_section_folder.title}" ).html_safe
      end
      li do
        if company_section_folder.company_section_items.size > 0
          table_for(company_section_folder.company_section_items, {:id => "company_section_items", :class => "index_table reorder"}) do |t|
            t.column "" do |o|
              img :src=>o.image.thumbnail
            end

            t.column "Item Details" do |o|
              "<p><strong>#{o.title}</strong></p><p>#{o.description}</p>".html_safe
            end

            t.column "" do |o|
              link_to("Edit",   edit_admin_company_section_item_path(o),  :class => "member_link") +
              link_to("Delete", admin_company_section_item_path(o),       :class => "member_link", :method => :delete, :confirm => "Are you sure?")
            end
          end
        else
          p "No items for this company section folder."
        end
      end
    end
  end

  action_item :only => :show do
    link_to('New Company Section Item', new_admin_company_section_item_path + "?company_section_folder_id=#{resource.id}")
  end


  collection_action :reorder, :method => :put do
    render :text => resource_class.reorder_objects(params[:ids])
  end
end
