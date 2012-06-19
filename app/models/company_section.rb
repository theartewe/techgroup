class CompanySection
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Globalize
  include Mongoid::Slug
  
  belongs_to :company

  has_many :company_sections

  translates do
    field :title
    field :text
  end

  slug :title

  validates_presence_of :title, :text

end
