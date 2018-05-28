class Interview < ApplicationRecord
  belongs_to :user 
  enum status: { pending: 0, accepted: 1, rejected: 2 }

  def committed?
    self.status != 'pending'
  end

  def future?
    self.scheduled_datetime.future?
  end
end
