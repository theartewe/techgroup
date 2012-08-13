class Slide
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Globalize
  include Mongoid::Reorder

  translates do
    field :title
  end
  
  mount_uploader  :image, SlideImageUploader

end
