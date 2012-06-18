class CorporationHistoryEntry
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Globalize
                       
  translates do
    field :title
    field :year
    field :text
    fallbacks_for_empty_translations!
  end
end
