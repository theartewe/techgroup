class CompanySubsection
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Globalize
  include Mongoid::Slug

  belongs_to :company_section

  translates do
    field :title
    field :text
  end

  slug :title

  mount_uploader  :image,
                  CompanySubsectionImageUploader

  validates_presence_of :title, :text
  
end
