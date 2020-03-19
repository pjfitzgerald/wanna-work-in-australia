class ApplicationsMailer < ApplicationMailer
  PROD_PATH = "https://wwia.herokuapp.com/"
  DEV_PATH = "http://localhost:3000/"

  def application_submission_user_confirmation(user, job, opts={})
    @user = user
    @job = job
    @venue = @job.venue
    @sub_path = "users/#{@user.id}/applications"
    @applications_path = Rails.env.development? ? DEV_PATH : PROD_PATH 
    
    headers["Custom-header"] = "Bar"
    opts[:from] = 'WWIA@wwia.com'
    opts[:reply_to] = 'do-not-reply@wwia.com'

    # this attachment works
    attachments['stones_picture_test.jpg'] = File.read('app/assets/images/stones.jpg')

    # attachments["#{@user.first_name}'s resume"] = @application.resume

    mail(to: @user.email, subject: "Your application has been submitted to #{@venue.name}!")

  end

  def application_submission_to_venue(user, job, opts={})
    headers["Custom-header"] = "Bar"
    opts[:from] = 'WWIA@wwia.com'
    opts[:reply_to] = 'do-not-reply@wwia.com'
    
    @user = user
    @job = job
    @venue = @job.venue
    @sub_path = "users/#{@user.id}/applications"
    @applications_path = Rails.env.development? ? DEV_PATH : PROD_PATH 
    # make sure all venues have an email on file, or adjust this (below) to account for lack of an address
    mail(to: @venue.email, subject: "#{@user.first_name} #{@user.last_name} has submitted an application to work for your venue")
  end

end
