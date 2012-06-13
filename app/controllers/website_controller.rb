class WebsiteController < ApplicationController
  before_filter :set_language

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

end
