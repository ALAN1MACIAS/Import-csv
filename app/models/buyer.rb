class Buyer < ApplicationRecord
  has_many :productspurchased, dependent: :delete_all
end
