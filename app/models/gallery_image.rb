class GalleryImage
  include Mongoid::Document
  include Mongoid::Timestamps

  field           :title

  mount_uploader  :image,
                  GalleryImageUploader

  validates_presence_of :title, :image

  default_scope order_by(:created_at => :desc)
end