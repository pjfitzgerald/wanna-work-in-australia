require 'test_helper'

class ApplicationsMailerTest < ActionMailer::TestCase

  def test_application_submission
    user = User.find_by(email: "test@test.com")
    email = ApplicationsMailer.application_submission(user, Job.first)
    assert !ActionMailer::Base.deliveries.empty?
  end
  # test "the truth" do
  #   assert true
  # end
end
