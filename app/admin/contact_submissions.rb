ActiveAdmin.register ContactSubmission, :as => "Contact" do
    index do
      column :from do |c|
        link_to "#{c.name} <#{c.email}>", "mailto:#{c.email}"
      end
      column "Date" do |c|
        c.created_at.strftime('%B %d, %Y')
      end
      column :message

      default_actions
    end

    show :title => :name do
      panel("Details") do
          attributes_table_for resource, :name, :email, :created_at
      end

      panel("Message") do
          resource.message
      end
    end

    form do |f|
      f.inputs do
        f.input :name
        f.input :email
        f.input :message, :as => :text
      end
      f.buttons
    end
end
