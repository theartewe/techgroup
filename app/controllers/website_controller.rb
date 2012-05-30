class WebsiteController < ApplicationController
  before_filter :set_language
  before_filter :set_path
  before_filter :get_page
  before_filter :set_page_attributes
  before_filter :set_ar
  before_filter :set_services
  before_filter :set_address

  private

  #
  # Set language var based on url:
  #   default is english;
  #   arabic starts with /ar;
  #
  def set_language
    if request.path.starts_with?("/ar")
        @language   = "arabic"
        @arabic     = true
        I18n.locale = "ar"
    else
        @language   = "english"
        I18n.locale = "en"
    end
  end

  def set_path
    @path   = request.path
    @path   = @path[3..-1] if @arabic
    @path   = "/" if @path.empty?
  end

  #
  # Get the page with multilanguage settings
  #
  def get_page
    if @path.starts_with?("/news")
      @page = Page.first(conditions: {:path => "/news"})
    else
      @page = Page.first(conditions: {:path => @path})
    end
  end

  def set_page_attributes
    return if @page.nil?

    #
    # Page meta information: title and description
    #
    @title          = @page.get_property(@language, 'title')
    @title          = "#{@title} - Levant Digital" unless @page.name == "Home"
    @description    = @page.get_property(@language, 'description')

    #
    # Location and service are used to highlight navigation menu
    #
    @location   = @path.split("/")[1]

    if @location.nil?
      @location = "home"
    elsif @location == "services"
      @service  = @path.split("/")[2]
    end

    #
    # Page content sections
    #
    @sections = {}
    @page.page_sections.each do |s|
      @sections[s.name] = { :title      => s.get_property(@language, 'title').html_safe,
                            :text       => s.get_property(@language, 'text').html_safe,
                            :image_url  => s.default_image_url }
    end
  end

  def set_ar
    @ar = ""
    @ar = "/ar" if @arabic
  end

  def set_services
    @service_pages = Page.all(sort:[:created_at, :asc]).select{|s| s.path.starts_with?('/services/')}
    @services = @service_pages.collect do |sp|
      label = sp.get_property(@language, 'title')
      label = label.gsub(' ', ' <br/>').html_safe unless @arabic
      { :path      => sp.path,
        :title     => sp.get_property(@language, 'title'),
        :text      => sp.get_property(@language, 'description'),
        :label     => label,
        :icon_name => sp.english_title.gsub(' ', '_').downcase,
        :class     => sp.english_title.split(' ')[0].downcase }
    end
  end

  def set_address
      address_section = PageSection.first(conditions: { name: "02-address" })
      line1 = address_section.get_property(@language, "title")
      line2 = address_section.get_property(@language, "text")
      @address = "<li><strong>#{line1}</strong></li>#{line2}".html_safe
  end
end
