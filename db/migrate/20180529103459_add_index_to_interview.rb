class AddIndexToInterview < ActiveRecord::Migration[5.1]
  def change
    add_index :interviews, [:user_id, :scheduled_datetime], unique: true
  end
end
