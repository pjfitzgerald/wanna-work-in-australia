class ApplicationsMailer < ApplicationMailer

  def application_submission(user, job)
    @user = user
    @job = job
    @venue = @job.venue
    @applications_path = "/users/#{@user.id}/applications"
    # make sure all venues have an email on file, or adjust this to account for lack of an address
    # mail(to: @venue.email, subject: "#{@user.first_name} #{@user.last_name} has submitted an application to work for your venue")
    mail(to: @user.email, subject: "Your application has been submitted to #{@venue.name}!")
  end

  def sendgrid_test
    # using SendGrid's Ruby Library
    # https://github.com/sendgrid/sendgrid-ruby
    require 'sendgrid-ruby'
    include SendGrid
    
    from = SendGrid::Email.new(email: 'test@example.com')
    to = SendGrid::Email.new(email: 'patrick.fitzgerald29@gmail.com')
    subject = 'Sending with Twilio SendGrid is Fun'
    content = SendGrid::Content.new(type: 'text/plain', value: 'and easy to do anywhere, even with Ruby')
    mail = SendGrid::Mail.new(from, subject, to, content)
    
    sg = SendGrid::API.new(api_key: Rails.application.credentials.sendgrid[:wwia_sendgrid_api_key])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    puts response.status_code
    puts response.body
    puts response.parsed_body
    puts response.headers
  end
end
