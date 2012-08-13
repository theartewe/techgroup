ActiveAdmin.register Company do
  menu :label => "Companies"
  
  controller do
    defaults :finder => :find_by_slug
  end
  
  index :as => :reorder_table do
    column :company do |o|
      link_to admin_company_path(o) do
        image_tag o.logo
      end
    end
    column :description do |o|
      html = ""
      html << o.description
      html << "<br/>"
      html << link_to( o.url, o.url, :target => "_blank")
      html.html_safe
    end
    column "" do |o|
      link_to("Edit",     edit_admin_company_path(o), :class => "member_link") +
      link_to("Delete",   admin_company_path(o), :method => :delete, :confirm => "Are you sure?", :class => "member_link")
    end
  end

  form do |f|
    f.inputs "Details" do
      f.input :title, :required => true
      f.input :description, :as => :text, :required => true
      f.input :url, :required => true
    end

    f.inputs "Address 1" do
      f.input :contact_title
      f.input :address, :required => true
      f.input :phone, :required => true
      f.input :fax
      f.input :email, :required => true
    end

    f.inputs "Address 2" do
      f.input :contact_title2
      f.input :address2
      f.input :phone2
      f.input :fax2
      f.input :email2
    end

    f.inputs "Address 3" do
      f.input :contact_title3
      f.input :address3
      f.input :phone3
      f.input :fax3
      f.input :email3
    end

    f.inputs "Map" do
      f.input :map_address
    end

    f.inputs "Logo" do
      f.input :logo,        :as => :file, :label => "SVG Logo", :required => true, :hint => f.object.logo.to_s
      f.input :logo_image,  :as => :file, :label => "PNG Logo", :required => true, :hint => f.object.logo_image.to_s
    end
    
    f.inputs "Assets" do
      f.input :banner,      :as => :file, :required => true
      f.input :brochure,    :as => :file
    end
    f.buttons
  end

  show :title => :title do
    ul :id => "company_section_page", :class => "show-page index_as_reorder_table" do
      li :class => "links" do
        ( link_to("All Companies", admin_companies_path) +
          " / #{company.title}" ).html_safe
      end
      li :class => "table-caption" do
        h3 "Sections"
      end
      li do
        if company.company_sections.size > 0
          table_for(company.company_sections, {:id => "company_sections", :class => "index_table company_sections reorder"}) do |t|
            t.column :title do |o|
              link_to o.title,  admin_company_section_path(o)
            end
            t.column :description

            t.column "" do |p|
              link_to("Edit",     edit_admin_company_section_path(p), :class => "member_link") +
              link_to("Delete",   admin_company_section_path(p),      :class => "member_link", :method => :delete, :confirm => "Are you sure?")
            end
          end
        else
          p "No sections for this company."
        end
      end
      li :class => "table-caption" do
        h3 "Certs Logos"
      end
      li do
        if company.company_cert_logos.size > 0
          table_for(company.company_cert_logos, {:id => "company_certs_logos", :class => "index_table reorder"}) do |t|
            t.column :logo do |o|
              image_tag o.image.cert_logo
            end
            t.column "" do |p|
              link_to("Edit",     edit_admin_company_cert_logo_path(p), :class => "member_link") +
              link_to("Delete",   admin_company_cert_logo_path(p),      :class => "member_link", :method => :delete, :confirm => "Are you sure?")
            end
          end
        else
          p "No certs logos for #{company.title}."
        end
      end
    end
  end

  action_item :only => :show do
    link_to('New Company Section', new_admin_company_section_path + "?company_id=#{resource.id}")
  end

  action_item :only => :show do
    link_to('New Cert Logo', new_admin_company_cert_logo_path + "?company_id=#{resource.id}")
  end

  #why here? I don't have a better place yet
  collection_action :change_locale, :method => :get do
  end

  collection_action :reorder, :method => :put do
    render :text => resource_class.reorder_objects(params[:ids])
  end
end
