class CreateProductspurchaseds < ActiveRecord::Migration[6.0]
  def change
    create_table :productspurchaseds do |t|
      t.references :buyer, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
