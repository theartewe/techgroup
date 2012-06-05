ActiveAdmin.register Post do
    menu :parent 	=> "Media"

    scope :all, :default => true
    scope :english
    scope :arabic

    index do
        column "Title" do |post|
            link_to post.title, admin_post_path(post)
        end
        column :language
        column :state do |post|
            status_tag (post.published ? "Published" : "Draft"), (post.published? ? :ok : :error)
        end
        column :date

        default_actions
    end

    form do |f|
        f.inputs "Details" do
            f.input :language,  :as         => :radio,
                                :collection => ["English", "Arabic"]
            f.input :title
            f.input :slug
            categories = Category.all.collect{|c| [c.english_title, c.slug] }
            f.input :categories, :as            => :select,
                                 :input_html    => { :multiple => true },
                                 :collection    => categories,
                                 :include_blank => false,
                                 :hint          => "(Hold Command key on Mac or Ctrl key on Windows to select several items)"
            f.input :published, :as => :boolean
            f.input :date
        end
        f.inputs "Content" do
            f.input :excerpt,    :as => :text,
                                 :input_html    => { :class => "editor" }

            #div :class => "gallery" do
            #end

            f.input :body,       :as => :text,
                                 :input_html    => { :class => "editor" }
        end
        f.buttons
    end

    show :title => :title do
        panel("Details") do
            attributes_table_for resource, :id, :language, :title, :slug, :categories, :published, :date
        end
        panel("Post") do
            div :id => "post_preview" do
                div :id => "title_value" do
                    h1 resource.title
                end
                div :id => "excerpt_html" do
                    resource.excerpt.html_safe
                end
                div :id => "body_html" do
                    resource.body.html_safe
                end
            end
        end
    end
end
