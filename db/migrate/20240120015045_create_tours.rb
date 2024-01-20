class CreateTours < ActiveRecord::Migration[7.1]
  def change
    create_table :tours do |t|
      t.string :name
      t.date :start_date
      t.date :finish_date
      t.float :budget

      t.timestamps
    end
  end
end
