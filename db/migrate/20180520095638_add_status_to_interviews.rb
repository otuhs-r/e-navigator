class AddStatusToInterviews < ActiveRecord::Migration[5.1]
  def change
    add_column :interviews, :status, :integer 
  end
end