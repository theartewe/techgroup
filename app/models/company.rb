class Company
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Globalize
  include Mongoid::Slug
  
  #has_many :company_sections
  
  translates do
    field :title
    field :description
  end
  
  field :url
  
  slug :title
  
  mount_uploader  :logo, CompanyLogoUploader
  
  validates_presence_of :title, :description, :logo
  
end
