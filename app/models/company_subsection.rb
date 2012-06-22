class CompanySubsection
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Globalize
  include Mongoid::Slug

  belongs_to :company_section
  
  has_many :company_subsection_items

  translates do
    field :title
    field :description
  end

  slug :title

  mount_uploader  :image,
                  CompanySubsectionImageUploader

  validates_presence_of :title, :description
  
end