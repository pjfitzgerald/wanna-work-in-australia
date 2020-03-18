require 'test_helper'

class ApplicationsMailerTest < ActionMailer::TestCase

  # test "app_mailer" do
  #   email = ApplicationsMailer.application_submission("test@test.com", Job.find(336))
  #   assert_emails 1 do 
  #     email.deliver_now
  #   end
  # end


  def test_application_submission
    user = User.find_by(email: "test@test.com")
    email = ApplicationsMailer.application_submission(user, Job.first)
    assert !ActionMailer::Base.deliveries.empty?
  end

end
