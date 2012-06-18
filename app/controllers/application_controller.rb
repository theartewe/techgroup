class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_locale
  
  def set_locale
    if request.path.starts_with?("/admin")
      if params[:locale] && I18n.available_locales.include?(params[:locale].to_sym)
         cookies['locale'] = { :value => params[:locale], :expires => 1.year.from_now }
         I18n.locale = params[:locale].to_sym
       elsif cookies['locale'] && I18n.available_locales.include?(cookies['locale'].to_sym)
         I18n.locale = cookies['locale'].to_sym
       end
    else
      I18n.locale = params[:locale] || I18n.default_locale
    end
  end
end
