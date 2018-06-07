class NotificationMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def send_reminder_to(applicant:, interviewer:)
    @applicant = applicant
    @interviewer = interviewer
    mail(subject: '面接時間が確定しました', to: [@applicant.email, @interviewer.email])
  end

  def send_request_to(interviewer:, from:)
    @applicant = from
    mail(subject: '面接希望日が決まりました', to: interviewer.email)
  end
end
