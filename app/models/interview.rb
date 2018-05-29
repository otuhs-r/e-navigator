class Interview < ApplicationRecord
  belongs_to :user 
  enum status: { pending: 0, accepted: 1, rejected: 2 }
  validates :user_id, uniqueness: { scope: [:scheduled_datetime] }

  def committed?
    self.status != 'pending'
  end

  def future?
    self.scheduled_datetime.future?
  end
end
