class CompanySubsectionItem
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Globalize
  include Mongoid::Slug

  belongs_to :company_subsection

  translates do
    field :title
    field :description
  end

  slug :title

  mount_uploader  :image,
                  CompanySubsectionItemImageUploader

  validates_presence_of :title, :description
  
end