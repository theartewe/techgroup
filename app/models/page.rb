class Page
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :path

  field :english_title
  field :english_description

  field :arabic_title
  field :arabic_description

  has_many :page_sections

  default_scope order_by(:path => :asc)

  def get_property(language, property)
    self[language + '_' + property]
  end
end
