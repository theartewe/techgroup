class LocaleController < WebsiteController
  
  def change_locale
    return_path = request.env["HTTP_REFERER"] || countries_path
    if params[:locale] && I18n.available_locales.include?(params[:locale].to_sym)
      begin
        #try to match a locale in the url
        if return_path.match /http:\/\/[\w|:|.]+\/([\w]{2})(\/|$)/
          return_path.gsub!(/http:\/\/[\w|:|.]+\/(?<locale>[\w]{2})(\/|$)/, '\1/%s/' % params[:locale])
        else
        #no locale? put one in
          puts "no match"
          root_path = return_path.match(/http:\/\/[\w|:|.]+\/([\w]+).*/)[1]
          return_path = return_path.gsub(root_path, params[:locale]+"/"+root_path)
        end
      rescue
        #fallback to /countries
        return_path = countries_path
      end
    end
    return redirect_to(return_path, :locale=>params[:locale])
  end
  
  def inject_current_page
  end
  
end
