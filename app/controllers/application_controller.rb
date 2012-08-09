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
  
  unless Rails.application.config.consider_all_requests_local
    rescue_from Exception, with: :render_500
    rescue_from ActionController::RoutingError, with: :render_404
    rescue_from ActionController::UnknownController, with: :render_404
    rescue_from ::AbstractController::ActionNotFound, with: :render_404
    rescue_from ActiveRecord::RecordNotFound, with: :render_404
  end

  protected

  def render_404(exception)
    @not_found_path = exception.message
    respond_to do |format|
      format.html { render template: 'errors/404', layout: 'layouts/application', status: 404 }
      format.all { render nothing: true, status: 404 }
    end
  end

  def render_500(exception)
    logger.fatal(exception)
    respond_to do |format|
      format.html { render template: 'errors/500', layout: 'layouts/application', status: 500 }
      format.all { render nothing: true, status: 500}
    end
  end
  
end
