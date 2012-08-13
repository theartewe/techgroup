class CompanyCertLogo
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Reorder
  
  belongs_to :company
  mount_uploader :image, CompanyCertLogoUploader
  
  validates_presence_of :image
end