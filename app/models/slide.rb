class Slide
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Globalize
  
  translates do
    field :text
  end

end
