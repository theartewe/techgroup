class MediaController < WebsiteController
    before_filter :set_categories

    def set_categories
      @media_categories = MediaCategory.all()
    end

    def index
      @objects  = MediaObject.is_published().page(params[:page])
    end

    def show
      @object   = MediaObject.find_by_slug!(params[:slug])
      @title  = "#{@post.title} - Tech Group"
    end

    def category
      @category   = MediaCategory.find_by_slug!(params[:category])
      @objects    = MediaObject.is_published().where(:media_category_id=>@category._id).page(params[:page])
      @title      = "#{@category.title} - Tech Group"
      render 'index'
    end

    def search
      q       = params[:q]
      @search = q
      @query  = MediaObject.is_published()
        
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
          query = @query.any_of({ title:        Regexp.new(key, true) },
                                { description:  Regexp.new(key, true) }).only(:id)
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

      @objects = @query.find(result_ids)#.page(params[:page])
      @title = "Search - Tech Group"
      render 'index'
    end
end
