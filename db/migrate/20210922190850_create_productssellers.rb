class CreateProductssellers < ActiveRecord::Migration[6.0]
  def change
    create_table :productssellers do |t|
      t.references :seller, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
