class PortfolioProject
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Globalize
  include Mongoid::Reorder
  
  translates do
    field :title
    field :client
    field :consultant
    field :main_contractor
    field :sub_contractors
    field :project_worth
    field :location
    fallbacks_for_empty_translations!
  end
  
  mount_uploader  :image, PortfolioProjectImageUploader
end