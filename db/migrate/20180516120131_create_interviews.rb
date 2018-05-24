class CreateInterviews < ActiveRecord::Migration[5.1]
  def change
    create_table :interviews do |t|
      t.datetime :scheduled_datetime
      t.boolean :accepted

      t.timestamps
    end
  end
end
