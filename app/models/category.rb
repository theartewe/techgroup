class Category
    include Mongoid::Document

    field :slug
    field :english_title
    field :arabic_title

    default_scope order_by(:english_title => :asc)

    def english_posts(page)
        Post.english_published().where(categories: self.slug).page(page)
    end

    def arabic_posts(page)
        Post.arabic_published().where(categories: self.slug).page(page)
    end
end
