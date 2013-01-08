class AddVariousIndicesToPages < ActiveRecord::Migration
  
  def self.up
    add_index :pages, :updated_at
    add_index :pages, :for_blog
    add_index :pages, :title
  end
  
  def self.down
    remove_index :pages, :updated_at
    remove_index :pages, :for_blog
    remove_index :pages, :title
  end
end
