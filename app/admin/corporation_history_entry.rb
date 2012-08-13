ActiveAdmin.register CorporationHistoryEntry, :as => "Entry" do
  menu :parent 	=> "Corporation", :label => "History"

  actions :all, :except => [:show]
  
  index :as => :reorder_table do 
    column :year
    column :title
    #column :text

    default_actions
  end

  form do |f|
    f.inputs "Entry Details" do
      f.input :title, :required => true
      f.input :year,  :required => true
      #f.input :text,  :required => true
    end
    f.buttons
  end

  collection_action :reorder, :method => :put do
    render :text => resource_class.reorder_objects(params[:ids])
  end
end
