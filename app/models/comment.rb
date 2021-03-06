# this is needed for now to make mass assignment security compatible with the translation of globalize3
# Globalize::ActiveRecord::Translation.class_eval do
#   attr_accessible :locale
# end

class Comment < ActiveRecord::Base

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :commentable, polymorphic: true

  validates_presence_of :commentable_type, :commentable_id, :author_id, :body

  scope :showable, -> { where('status = ? OR status = ?', 'pending', 'accepted') }
  scope :pending, -> { where('status = ?', 'pending') }
  scope :accepted, -> { where('status = ?', 'accepted') }
  scope :blocked, -> { where('status = ?', 'blocked') }
  scope :for_locale, lambda { |locale| where('locale = ?', locale) }
  scope :by_recent, -> { order('updated_at desc') }
  scope :by_created, -> { order('created_at') }
  scope :by_recently_created, -> { order('created_at desc') }

end
