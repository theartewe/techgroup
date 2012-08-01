class Settings
  include Mongoid::Document
  include Mongoid::Globalize
  
  translates do
    field :ceo_message
  end
  
end
