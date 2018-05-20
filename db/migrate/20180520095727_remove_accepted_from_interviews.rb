class RemoveAcceptedFromInterviews < ActiveRecord::Migration[5.1]
  def change
    remove_column :interviews, :accepted, :boolean
  end
end
