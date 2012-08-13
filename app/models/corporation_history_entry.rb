class CorporationHistoryEntry
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Globalize
  include Mongoid::Reorder
                       
  translates do
    field :title
    field :year
    field :text
    fallbacks_for_empty_translations!
  end
end
