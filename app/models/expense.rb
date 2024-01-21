class Expense < ApplicationRecord
  include Groupdate
  belongs_to :tour


  require 'csv'

  def self.import(file)
    records = []
    CSV.foreach(file.path, headers: true) do |row|
      values = row.to_h.map{|key, val| val}
      record = {
        date: values[0],
        city: values[1],
        cost: values[2],
        state: values[3],
        category: values[4],
        tour_id: values[5],
        created_at: Time.zone.now,
        updated_at: Time.zone.now
      }
      records << record
    end
    
    Expense.insert_all(records)
    return records.count
  end

end
