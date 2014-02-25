# this is needed for now to make mass assignment security compatible with the translation of globalize3
# Globalize::ActiveRecord::Translation.class_eval do
#   attr_accessible :locale
# end

class Contact < ActiveRecord::Base

  validates_presence_of :sender_name
  validates :sender_email, :presence => true, :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :on => :create }
  validates_presence_of :body

  scope :by_recent, -> { order('updated_at desc') }

end
