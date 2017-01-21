class Player < ApplicationRecord
  validates :name, length: { in: 3..20 }
end
