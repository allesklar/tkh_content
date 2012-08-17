# this is needed for now to make mass assignment security compatible with the translation of globalize3
Globalize::ActiveRecord::Translation.class_eval do
  attr_accessible :locale
end

class Page < ActiveRecord::Base
  
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  
  attr_accessible :title, :short_title, :description, :body, :for_blog, :parent_id
  
  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :body
  validates_presence_of :author_id
  
  translates :title, :short_title, :description, :body
    
  def to_param
    title ? "#{id}-#{title.to_url}" : id
  end

  scope :by_recent, order('updated_at desc')
  scope :for_blog, where('for_blog = ?', true)
  scope :not_for_blog, where('for_blog = ?', false)
  scope :published, where('published_at IS NOT ?', nil)
  scope :by_recently_published, order('published_at desc')
  # tree scopes
  scope :orphans, where('parent_id IS ?', nil)
  scope :with_parent_id, lambda { |id| where('parent_id = ?', id) }
  
  def nickname
    short_title || title
  end
  
  def orphan?
    parent_id == nil
  end
  
  def has_children?
    Page.with_parent_id(id).count >= 1
  end
  
  def children
    Page.with_parent_id(id)
  end
  
  def parent
    Page.find(parent_id)
  end
  
  def has_siblings?
    Page.with_parent_id(parent_id).count >= 1
  end
  
  def siblings
    Page.with_parent_id(parent_id)
  end
  
end
