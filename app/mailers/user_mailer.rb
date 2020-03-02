class UserMailer < ApplicationMailer
  # default from: 'from@example.com'

  def welcome_email
    @user = current_user
    @url = 'https://wwia.herokuapp.com/'
    mail(to: @user.email, subject: 'Welcome to Wanna Work In Australia!')
  end
end
