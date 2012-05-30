class ContactController < WebsiteController
    def submit
        contact = ContactSubmission.new
        contact.name    = params[:name]
        contact.email   = params[:email]
        contact.country = params[:country]
        contact.message = params[:message]
        contact.save

        render :text => "okay"
    end
end
