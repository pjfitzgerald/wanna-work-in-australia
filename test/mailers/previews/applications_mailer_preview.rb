# Preview all emails at http://localhost:3000/rails/mailers/applications_mailer
class ApplicationsMailerPreview < ActionMailer::Preview

  def application_submission_user_confirmation
    ApplicationsMailer.application_submission_user_confirmation(User.first, Job.first)
  end
end
