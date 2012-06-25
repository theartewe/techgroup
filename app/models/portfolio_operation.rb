class PortfolioOperation
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Globalize
  
  translates do
    field :title
    field :description
    fallbacks_for_empty_translations!
  end
  mount_uploader  :image, PortfolioOperationImageUploader
end
