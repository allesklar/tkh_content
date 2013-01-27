class CreateContacts < ActiveRecord::Migration
  
  def self.up
    create_table :contacts do |t|
      t.string :sender_name
      t.string :sender_email
      t.text :body
      
      t.timestamps
    end
    add_index :contacts, :updated_at
  end
  
  def self.down
    drop_table :contacts
    remove_index :contacts, :updated_at
  end
  
end
