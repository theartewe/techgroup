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
  
  field :contact_title
  field :address
  field :phone
  field :fax
  field :email
  
  field :contact_title2
  field :address2
  field :phone2
  field :fax2
  field :email2
  
  field :contact_title3
  field :address3
  field :phone3
  field :fax3
  field :email3
  
  field :map_address
  
  mount_uploader :logo, CompanyLogoUploader
  mount_uploader :banner, CompanyBannerUploader
  mount_uploader :brochure, CompanyBrochureUploader
  
  slug :title
   
  validates_presence_of :title, :description, :logo
  
end
