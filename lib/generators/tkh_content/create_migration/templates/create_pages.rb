class CreatePages < ActiveRecord::Migration
  
  def self.up
    create_table :users do |t|
      t.string :title
      t.text :description
      t.text :body
      t.boolean :for_blog, default: false
      t.datetime  :published_at

      t.timestamps
    end
    Page.create_translation_table! :title => :string, :description => :text, :body => :text
  end
  
  def self.down
    drop_table :users
  end
end
