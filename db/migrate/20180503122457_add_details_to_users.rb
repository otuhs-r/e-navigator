class AddDetailsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :user_name, :string
    add_column :users, :birth_day, :date
    add_column :users, :gender, :integer
    add_column :users, :school_name, :string
  end
end
