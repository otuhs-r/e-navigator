class AddDefaultToInterviews < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:interviews, :status, 0)
  end
end
