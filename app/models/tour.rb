class Tour < ApplicationRecord
  has_many :expenses, dependent: :destroy
end
