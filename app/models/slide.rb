class Slide
  include Mongoid::Document
  include Mongoid::Timestamps

  field :english_text1
  field  :arabic_text1

  field :english_text2
  field  :arabic_text2

  field :english_text3
  field  :arabic_text3

  field :english_text4
  field  :arabic_text4

  field :english_text5
  field  :arabic_text5

  def get_property(language, property)
    self[language + '_' + property]
  end
end
