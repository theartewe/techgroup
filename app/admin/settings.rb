ActiveAdmin.register Settings do
  index do
    column :settings do |obj|
      link_to "Settings", edit_admin_setting_path(obj)
    end
    default_actions
  end

  show do
    panel("Settings") do
      div :id => "ceo_message" do 
        resource.ceo_message
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :ceo_message, :as => :text
    end
    f.buttons
  end
end
