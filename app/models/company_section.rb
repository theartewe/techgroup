class CompanySection
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Globalize
  include Mongoid::Slug
  
  belongs_to :company

  has_many :company_subsections

  translates do
    field :title
    field :description
  end

  slug :title

  validates_presence_of :title, :description

end
