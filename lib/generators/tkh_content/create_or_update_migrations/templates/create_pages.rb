class CreatePages < ActiveRecord::Migration
  
  def self.up
    create_table :pages do |t|
      t.string :title
      t.text :description
      t.text :body
      t.boolean :for_blog, default: false
      t.datetime  :published_at
      t.timestamps
    end
    add_index :pages, :published_at
    Page.create_translation_table! :title => :string, :short_title => :string, :description => :text, :body => :text
  end
  
  def self.down
    drop_table :pages
    Page.drop_translation_table!
    remove_index :pages, :published_at
  end
end
