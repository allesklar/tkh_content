class MakeCommentsPolymorphic < ActiveRecord::Migration

  def self.up
    add_column :comments, :commentable_type, :string
    add_column :comments, :commentable_id, :integer
    add_index :comments, :commentable_id

    Comment.all.each do |comment|
      unless comment.page_id.blank?
        comment.commentable_type = 'Page'
        comment.commentable_id = comment.page_id
        comment.save
      end
    end

    # Clean up comment table. The index is removed automatically
    remove_column :comments, :page_id

  end

  def self.down
    add_column :comments, :page_id
    add_index :comments, :page_id

    Comment.all.each do |comment|
      if comment.commentable_type == 'Page'
        comment.page_id = comment.commentable_id
        comment.save
      end
    end

    remove_column :comments, :commentable_type, :string
    remove_column :comments, :commentable_id, :integer

  end
end
