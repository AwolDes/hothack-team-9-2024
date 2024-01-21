class AddUserIdToTours < ActiveRecord::Migration[7.1]
  def up
    add_column :tours, :user_id, :integer
    # Tour.update_all(user_id: 1)
    add_foreign_key :tours, :users
    change_column_null :tours, :user_id, false
  end

  def down
    remove_column :tours, :user_id
  end
end
