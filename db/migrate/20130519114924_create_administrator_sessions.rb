class CreateAdministratorSessions < ActiveRecord::Migration
  def change
    create_table :administrator_sessions do |t|
      t.string :access_token, :null => false
      t.integer :administrator_id, :null => false

      t.timestamps
    end

    add_index :administrator_sessions, :administrator_id
  end
end
