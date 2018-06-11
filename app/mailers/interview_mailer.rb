class InterviewMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def approve(applicant:, interviewer:)
    @applicant = applicant
    @interviewer = interviewer
    mail(subject: '面接時間が確定しました', to: [@applicant.email, @interviewer.email])
  end

  def request_to(interviewer:, from:)
    @applicant = from
    mail(subject: '面接希望日が決まりました', to: interviewer.email)
  end
end
