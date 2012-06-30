ActiveAdmin::Dashboards.build do

  # Define your dashboard sections here. Each block will be
  # rendered on the dashboard in the context of the view. So just
  # return the content which you would like to display.
  
  # == Contact Submission Dashboard Section
  section "Contact Submissions" do
    ul do
      #ContactSubmission.unread.collect do |submission|
      ContactSubmission.all.collect do |s|
        li do
          link_to "#{s.name} <#{s.email}>", admin_contact_path(s)
        end
      end
    end
  end

end
