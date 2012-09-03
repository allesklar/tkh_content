class CreateComments < ActiveRecord::Migration
  
  def self.up
    create_table :comments do |t|
      t.text :body
      t.integer :page_id
      t.integer :author_id
      t.string :locale
      t.string :status, :default => 'pending'
      t.timestamps
    end
    add_index :comments, :page_id
    add_index :comments, :author_id
    add_index :comments, :locale
    add_index :comments, :status
  end
  
  def self.down
    drop_table :comments
    remove_index :comments, :page_id
    remove_index :comments, :author_id
    remove_index :comments, :locale
    remove_index :comments, :status
  end
end
