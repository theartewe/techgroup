class PageSection
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Globalize

  belongs_to :page

  field :name
  
  translates do
    field :title, type: String
    field :text, type: String
    fallbacks_for_empty_translations!
  end

  mount_uploader  :english_image, SectionImageUploader
  mount_uploader  :arabic_image, SectionImageUploader

  field :default_image_url

  default_scope order_by([[:page_id, :asc], [:name, :asc]])

end
