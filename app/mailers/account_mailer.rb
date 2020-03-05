class AccountMailer < Devise::Mailer
  helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
  default template_path: 'devise/mailer' # to make sure that your mailer uses the devise views
  # default from: "example@example.com"

  
  def confirmation_instructions(record, token, opts={})
    headers["Custom-header"] = "Bar"
    opts[:from] = 'WWIA@wwia.com'
    opts[:reply_to] = 'do-not-reply@wwia.com'
    super
  end
  
  
  # require 'sendgrid-ruby'
  # include SendGrid

  # using SendGrid's Ruby Library
  # https://github.com/sendgrid/sendgrid-ruby
  
  # from = SendGrid::Email.new(email: 'test@example.com')
  # to = SendGrid::Email.new(email: 'patrick.fitzgerald29@gmail.com')
  # subject = 'Sending with Twilio SendGrid is Fun'
  # content = SendGrid::Content.new(type: 'text/plain', value: 'and easy to do anywhere, even with Ruby')
  
  # mail = SendGrid::Mail.new(from, subject, to, content)
  
  # sg = SendGrid::API.new(api_key: Rails.application.credentials.sendgrid[:wwia_sendgrid_api_key])
  # response = sg.client.mail._('send').post(request_body: mail.to_json)
  
  # puts response.status_code
  # puts response.body
  # # puts response.parsed_body     # results in duplicate email being sent, don't know why
  # puts response.headers


end