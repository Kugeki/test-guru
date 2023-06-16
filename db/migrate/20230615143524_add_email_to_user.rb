class AddEmailToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :email, :string
    change_column_null :users, :email, false, "example@example.com"
  end
end
