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
  
  mount_uploader :logo, CompanyLogoUploader
  
  slug :title
   
  validates_presence_of :title, :description, :logo
  
end
