class Seller < ApplicationRecord
  has_many :productsseller, dependent: :delete_all
end
