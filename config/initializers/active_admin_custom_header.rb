require "active_admin"
require 'cgi'

module ActiveAdmin
  module Views
    #custom override to switch the locale
    
    # Renderer for the header of the application. Includes the page
    # title, global navigation and utility navigation.
    class HeaderRenderer < ::ActiveAdmin::Renderer
      def to_html
        title + global_navigation + locale_nav + utility_navigation
      end

      protected
      
      def locale_nav
        languages = [
          {:title=>"English",:code=>"en"},
          {:title=>"Arabic",:code=>"ar"}
        ]
        
        div :id => "locale_nav" do
          a :href=>"#" do
            "Locale: %s" % I18n.locale
          end
          ul :id => "locale_options" do
            languages.each do |l|
              li do
                link_to(l[:title], request.env['PATH_INFO']+"?locale="+l[:code])
              end
            end
          end #end ul
        end #end div
      end #end method
 
    end
    
  end
end