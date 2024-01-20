class Expense < ApplicationRecord
  include Groupdate
  belongs_to :tour
end
