class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Globalize

  field :language,      :default    => "English"
  field :slug
  field :title
  field :excerpt
  field :body
  field :categories
  field :published,     :type       => Boolean,
                        :default    => false
  field :date,          :type       => Date,
                        :default    => Date.today

  default_scope order_by(:date => :desc)
  scope :english,           where(:language => "English")
  scope :arabic,            where(:language => "Arabic" )
  scope :english_published, where(:language => "English").where(:published => true)
  scope :arabic_published,  where(:language => "Arabic" ).where(:published => true)

  paginates_per 4

  def category_objects(category_list)
      objects        = []
      categories_str = self.categories.to_s
      category_list.each do |category|
          if categories_str.include?("\"#{category.slug}\"")
              objects << category
          end
      end
      return objects
  end
end
