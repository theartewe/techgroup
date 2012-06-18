class Slide
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Globalize
  
  translates do
    field :title
  end
  
  mount_uploader  :image, SlideImageUploader

end
