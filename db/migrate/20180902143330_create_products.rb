class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price, null: false, default: 0, precision: 6, scale: 2
      t.references :brand, foreign_key: true

      t.timestamps
    end
  end
end
