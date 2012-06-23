class Director
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Globalize
  include Mongoid::Slug

  translates do
    field :title
    field :description
  end

  slug :title

  mount_uploader  :image,
                  DirectorImageUploader

  validates_presence_of :title, :description
  
end
