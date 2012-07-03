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
    field :image_caption
    field :read_more_title1
    field :read_more_title2
    field :read_more_title3
    fallbacks_for_empty_translations!
  end
  
  field :read_more_link1
  field :read_more_link2
  field :read_more_link3
  
  mount_uploader  :image, MediaObjectImageUploader               
  mount_uploader  :pdf, MediaObjectPdfUploader
  
  slug :title
  
end
