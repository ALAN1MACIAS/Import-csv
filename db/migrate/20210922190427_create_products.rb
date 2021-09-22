class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :description
      t.integer :price
      t.integer :total

      t.timestamps
    end
  end
end
