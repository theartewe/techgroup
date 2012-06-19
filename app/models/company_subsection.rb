class CompanySubsection
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Globalize
  
  translates do
    field :slug
    field :title
    field :excerpt
    field :body
  end
  
end
