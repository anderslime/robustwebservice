class CreateQuantities < ActiveRecord::Migration
  def change
    create_table :quantities do |t|
      t.integer :quantity
      t.references :order
      t.references :product

      t.timestamps
    end
    add_index :quantities, :order_id
    add_index :quantities, :product_id
  end
end
