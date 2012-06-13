class MediaCategory
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Globalize
  include Mongoid::Slug
  
  has_many :media_objects
  
  translates do
    field :title
  end
  
  slug :title
  
  
end
