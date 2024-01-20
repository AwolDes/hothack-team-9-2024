class CreateExpenses < ActiveRecord::Migration[7.1]
  def change
    create_table :expenses do |t|
      t.date :date
      t.string :day
      t.string :city
      t.decimal :cost
      t.string :state
      t.string :category
      t.references :tour, null: false, foreign_key: true

      t.timestamps
    end
  end
end
