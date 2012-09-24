# this is needed for now to make mass assignment security compatible with the translation of globalize3
Globalize::ActiveRecord::Translation.class_eval do
  attr_accessible :locale
end

class Tag < ActiveRecord::Base
  
  attr_accessible :name
  
  has_many :taggings
  has_many :pages, through: :taggings
  
  translates :name
  
  scope :alphabetically, order('name')
    
  def to_param
    name ? "#{id}-#{name.to_url}" : id
  end
  
end


