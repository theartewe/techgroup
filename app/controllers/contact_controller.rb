class ContactController < WebsiteController
  
  def submit
      contact = ContactSubmission.new
      contact.name      = params[:name]
      contact.email     = params[:email]
      contact.telephone = params[:telephone]
      contact.message   = params[:message]
      contact.save

      render :text => "okay"
  end
  
  def inject_current_page
    @location = "contact"
  end

end
