class CreateSidebarSnippets < ActiveRecord::Migration

  def self.up
    create_table :sidebar_snippets do |t|
      t.text :main_sidebar
      t.text :blog_sidebar
      t.timestamps
    end
    SidebarSnippet.create_translation_table! main_sidebar: :text, blog_sidebar: :text
    SidebarSnippet.create main_sidebar: '', blog_sidebar: ''
  end

  def self.down
    drop_table :sidebar_snippets
    SidebarSnippet.drop_translation_table!
  end
end
