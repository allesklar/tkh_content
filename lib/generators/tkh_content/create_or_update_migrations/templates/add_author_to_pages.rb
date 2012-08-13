class AddAuthorToPages < ActiveRecord::Migration
  def change
    add_column :pages, :author_id, :integer
    add_index :pages, :author_id
  end
end
