ActiveAdmin.register CorporationHistoryEntry, :as => "History Entries" do
  menu :parent 	=> "Corporation", :label => "History"
  
  index do 
    column :title do |obj|
      link_to obj.title, edit_admin_history_entry_path(obj)
    end
    column :year
    column :text
  end

  form do |f|
    f.inputs do
      f.input :title, :required => true
      f.input :year, :required => true
      f.input :text, :required => true
    end
    f.buttons
  end

  show do
    h1 resource.title
    div resource.year
    div resource.text
  end
end
