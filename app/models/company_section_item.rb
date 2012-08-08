class CompanySectionItem
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Globalize
  include Mongoid::Slug

  belongs_to :company_section

  translates do
    field :title
    field :description
  end

  slug :title

  mount_uploader  :image,
                  CompanySectionItemImageUploader

  validates_presence_of :title, :description
end
