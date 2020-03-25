class ApplicationsMailer < ApplicationMailer
  PROD_PATH = "https://wwia.herokuapp.com/"
  DEV_PATH = "http://localhost:3000/"

  def application_submission_user_confirmation(application, opts={})
    @application = application
    @user = @application.traveller
    @job = @application.job
    @venue = @job.venue

    # for construction of the link in the email
    @sub_path = "users/#{@user.id}/applications"
    @applications_path = Rails.env.development? ? DEV_PATH : PROD_PATH 
    
    headers["Custom-header"] = "Bar"
    opts[:from] = 'WWIA@wwia.com'
    opts[:reply_to] = 'do-not-reply@wwia.com'

    # attach resume
    attachments["resume"] = @application.resume.download
    
    mail(to: @user.email, subject: "Your application has been submitted to #{@venue.name}!")
    
  end
  
  def application_submission_to_venue(application, opts={})
    @application = application
    @user = @application.traveller
    @job = @application.job
    @venue = @job.venue
    
    @sub_path = "users/#{@user.id}/applications"
    @applications_path = Rails.env.development? ? DEV_PATH : PROD_PATH 
    
    headers["Custom-header"] = "Bar"
    opts[:from] = 'WWIA@wwia.com'
    opts[:reply_to] = 'do-not-reply@wwia.com'
    
    attachments["applicant_resume"] = @application.resume.download
    # make sure all venues have an email on file, or adjust below to account for lack of an address
    mail(to: @venue.email, subject: "#{@user.first_name} #{@user.last_name} has submitted an application to work for #{@venue.name}")
end

end

