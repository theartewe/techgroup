class PageSection
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :page

  field :name

  field :english_title
  field :english_text
  mount_uploader  :english_image, SectionImageUploader

  field :arabic_title
  field :arabic_text
  mount_uploader  :arabic_image, SectionImageUploader

  field :default_image_url

  default_scope order_by([[:page_id, :asc], [:name, :asc]])

  def get_property(language, property)
    self[language + '_' + property]
  end
end
