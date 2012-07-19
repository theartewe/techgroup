class Company
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Globalize
  include Mongoid::Slug
  
  has_many :company_sections
  
  translates do
    field :title
    field :description
  end
  
  field :url
  field :phone
  field :fax
  field :email
  
  mount_uploader :logo, CompanyLogoUploader
  mount_uploader :banner, CompanyBannerUploader
  mount_uploader :brochure, CompanyBrochureUploader
  
  slug :title
   
  validates_presence_of :title, :description, :logo
  
end
