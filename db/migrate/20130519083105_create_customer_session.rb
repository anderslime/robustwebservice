class CreateCustomerSession < ActiveRecord::Migration
  def change
    create_table :customer_sessions do |t|
      t.string :access_token, :null => false
      t.integer :customer_id, :null => false

      t.timestamps
    end

    add_index :customer_sessions, :customer_id
  end
end
