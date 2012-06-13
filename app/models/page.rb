class Page
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Globalize
  
  field :name
  field :path
  
  translates do
    field :title
    field :description
    fallbacks_for_empty_translations!
  end

  has_many :page_sections

  default_scope order_by(:path => :asc)

  def get_property(language, property)
    self[language + '_' + property]
  end
end
