class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  enum gender: { male: 0, female: 1 }
  has_many :interviews, dependent: :destroy

  def age
    (Date.today.to_s(:number).to_i - birth_day.to_s(:number).to_i) / 10000
  end

  def interview_datetime
    accepted_interview = interviews.find_by(status: :accepted)
    accepted_interview.scheduled_datetime if accepted_interview
  end

  def reject_interviews_except(excepted_interview)
    interviews.each do |interview|
      unless interview == excepted_interview
        interview.update(status: :rejected)
      end
    end
  end
end
