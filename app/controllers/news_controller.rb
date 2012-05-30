class NewsController < WebsiteController
    before_filter :set_categories

    def set_categories
        @categories = Category.all()
    end

    def index
        if @arabic
            @posts  = Post.arabic_published().page(params[:page])
        else
            @posts  = Post.english_published().page(params[:page])
        end
    end

    def show
        @post   = Post.first(conditions: { slug:  params[:slug], language: @language.capitalize })

        raise ActionController::RoutingError.new('Not Found') unless @post

        @title  = "#{@post.title} - Levant Digital"
    end

    def category
        slug        = params[:category]
        @category   = @categories.select{ |c| c.slug == slug }.first()
        raise ActionController::RoutingError.new('Not Found') unless @category

        if @arabic
            @posts      = @category.arabic_posts(params[:page])
            @category   = @category.arabic_title
        else
            @posts      = @category.english_posts(params[:page])
            @category   = @category.english_title
        end

        @title      = "#{@category} - Levant Digital"
        render 'index'
    end

    def search
        q       = params[:q]
        @search = q

        if @arabic
            @query  = Post.arabic_published()
        else
            @query  = Post.english_published()
        end

        #
        # NOTE: According to this:
        #       http://www.mongodb.org/display/DOCS/Full+Text+Search+in+Mongo
        #
        # There is no easy way to implement full text query in mongo without
        # workarounds. So for now we are doing a few queries for each key and
        # then merging results.
        #
        ids  = []
        keys = q.split(' ')
        keys.each do |key|
            #
            # This regex is looking for a given substring, not a single word.
            #
            query = @query.any_of({ title:      Regexp.new(key, true) },
                                  { excerpt:    Regexp.new(key, true) },
                                  { body:       Regexp.new(key, true) }).only(:id)
            new_ids = query.collect{ |p| p.id.to_s }
            ids += new_ids
        end

        #
        # This is logical AND search implementation.
        # In the result are only posts which have every key from the query.
        #
        counters   = Hash.new(0)
        ids.each{ |id| counters[id] += 1 }
        result_ids = counters.keys.select{ |key| counters[key] == keys.size }.uniq

        @posts = @query.find(result_ids)#.page(params[:page])
        @title = "Search - Levant Digital"
        render 'index'
    end
end
