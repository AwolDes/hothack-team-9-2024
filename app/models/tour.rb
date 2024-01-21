class Tour < ApplicationRecord
  has_many :expenses, dependent: :destroy

  def total_cost
    ap self.expenses
    self.expenses.where.not(cost: nil).map(&:cost)&.sum
  end
end
