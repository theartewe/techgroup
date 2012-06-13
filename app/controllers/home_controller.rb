class HomeController < WebsiteController
  def index

    language  = "english"
    @slides = Slide.all.collect do |s|
        { :text1 => s.get_property(language, "text1").html_safe,
          :text2 => s.get_property(language, "text2").html_safe,
          :text3 => s.get_property(language, "text3").html_safe,
          :text4 => s.get_property(language, "text4").html_safe,
          :text5 => s.get_property(language, "text5").html_safe }
    end
  end
end
