# Preview all emails at http://localhost:3000/rails/mailers/applications_mailer
class ApplicationsMailerPreview < ActionMailer::Preview

  def application_submission
    ApplicationsMailer.application_submission(User.first, Job.first)
  end
end
