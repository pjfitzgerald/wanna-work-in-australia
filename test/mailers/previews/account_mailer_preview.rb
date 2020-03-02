# Preview emails at http://localhost:3000/rails/mailers/account_mailer
class AccountMailerPreview < ActionMailer::Preview

  def confirmation_instructions
    AccountMailer.confirmation_instructions(User.first, "faketoken", {})
  end

  # In order to control which queue name the mailer queues up new email:
  # def deliver_later
  #  Devise::Mailer.delay(queue: 'my_queue').send(...)
  # end
  
end