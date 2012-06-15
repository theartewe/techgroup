class CorporationHistoryEntry
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Globalize
                       
  translates do
    field :year
    field :description
  end
end
