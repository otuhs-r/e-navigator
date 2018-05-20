class Interview < ApplicationRecord
  belongs_to :user 
  enum status: { Pending: 0, Accepted: 1, Rejected: 2 } 
end
