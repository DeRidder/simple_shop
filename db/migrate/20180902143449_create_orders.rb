class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :iban
      t.decimal :total, null: false, default: 0, precision: 6, scale: 2

      t.timestamps
    end
  end
end
