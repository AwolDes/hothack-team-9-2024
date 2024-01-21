class Tour < ApplicationRecord
  has_many :expenses, dependent: :destroy

  def total_cost
    self.expenses.where.not(cost: nil).map(&:cost)&.sum
  end
end
