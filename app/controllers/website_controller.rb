class WebsiteController < ApplicationController
  
  before_filter :inject_current_page

  private

  #
  # Set language var based on url:
  #   default is english;
  #   arabic starts with /ar;
  #

end
