class Client
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Globalize
  include Mongoid::Reorder
  
  translates do
    field :title
    field :description
    fallbacks_for_empty_translations!
  end
  mount_uploader  :image, ClientImageUploader
end