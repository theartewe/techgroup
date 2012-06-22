class MediaObject
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Globalize
  include Mongoid::Slug
  
  belongs_to :media_category
  
  scope :is_published, where(:published => true)
  
  field :published,     :type       => Boolean,
                        :default    => false            
  translates do
    field :title
    field :description
    fallbacks_for_empty_translations!
  end
  
  slug :title
  
end
