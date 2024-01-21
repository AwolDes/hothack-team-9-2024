class Tour < ApplicationRecord
  has_many :expenses, dependent: :destroy

  def total_cost
    self.expenses.map(&:cost).sum
  end
end
