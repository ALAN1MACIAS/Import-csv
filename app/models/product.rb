class Product < ApplicationRecord
  has_many :productsseller
  has_many :productspurchased
end
