class AddNullConstraintsToQuantities < ActiveRecord::Migration
  def change
    remove_column :quantities, :product_id
    remove_column :quantities, :order_id
    add_column :quantities, :product_id, :integer, :null => false
    add_column :quantities, :order_id, :integer, :null => false
  end
end
