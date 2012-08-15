# this is needed for now to make mass assignment security compatible with the translation of globalize3
Globalize::ActiveRecord::Translation.class_eval do
  attr_accessible :locale
end

class Page < ActiveRecord::Base
  
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  
  attr_accessible :title, :short_title, :description, :body, :blog_post, :for_blog
  
  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :body
  validates_presence_of :author_id
  
  translates :title, :description, :body
    
  def to_param
    title ? "#{id}-#{title.to_url}" : id
  end

  scope :by_recent, :order => 'updated_at desc'
  
end
