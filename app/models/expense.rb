class Expense < ApplicationRecord
  belongs_to :tour
end

require 'csv'

def self.import(file)

  CSV.foreach(file.path, headers: true) do |row|
    expenses.create! row.to_hash
  end

end
