class Product < ApplicationRecord
  require 'csv'

  has_many :productsseller, dependent: :delete_all
  has_many :productspurchased, dependent: :delete_all

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |name_buyer, description, price, total, address_seller, name_seller|
      buyer = Buyer.find_by_name(name_buyer[1])
      buyer = Buyer.create!(name: name_buyer[1]) if buyer.nil?

      product = Product.find_by_description(description[1])
      if product.nil?
        product = Product.create!(description: description[1], price: price[1], total: total[1])
      else
        product.update(total: (product.total + total[1].to_i))
      end

      seller = Seller.find_by_name(name_seller[1])
      seller = Seller.create!(name: name_seller[1], address: address_seller[1]) if seller.nil?

      Productspurchased.create!(buyer_id: buyer.id, product_id: product.id)
      Productsseller.create!(seller_id: seller.id, product_id: product.id)
    end
  end
end
