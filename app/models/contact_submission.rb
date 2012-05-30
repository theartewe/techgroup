class ContactSubmission
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :email
  field :country
  field :message

  validates_presence_of :name, :email, :country, :message
  default_scope order_by(:created_at => :desc)

  def self.unread
    self.all
  end
end
