class ApplicationsMailer < ApplicationMailer

  def application_submission(user, venue)
    @user = user
    @venue = venue
    # make sure all venues have an email on file, or adjust this to account for lack of an address
    mail(to: @venue.email, subject: "#{@user.first_name} #{@user.last_name} has submitted an application to work for your venue")
    mail(to: @user.email, subject: "Your application has been submitted to #{@venue.name}")
  end

end
