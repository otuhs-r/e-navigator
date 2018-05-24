class AddColumnInterview < ActiveRecord::Migration[5.1]
  def up
    add_column :interviews, :user_id, :integer
    add_index :interviews, :id
    add_index :interviews, :user_id
  end

  def down
  end
end
