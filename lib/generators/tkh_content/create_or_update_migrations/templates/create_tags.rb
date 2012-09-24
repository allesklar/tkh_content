class CreateTags < ActiveRecord::Migration
  
  def self.up
    create_table :tags do |t|
      t.string :name
      t.timestamps
    end
    add_index :tags, :name
    Tag.create_translation_table! :name => :string
  end
  
  def self.down
    drop_table :tags
    remove_index :tags, :name
    Tag.drop_translation_table!
  end
end
