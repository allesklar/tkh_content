# this is needed for now to make mass assignment security compatible with the translation of globalize3
# Globalize::ActiveRecord::Translation.class_eval do
#   attr_accessible :locale
# end

class Tag < ActiveRecord::Base

  has_many :taggings, :dependent => :destroy
  has_many :pages, through: :taggings

  translates :name

  scope :alphabetically, -> { order('name') }

  def to_param
    name ? "#{id}-#{name.to_url}" : id
  end

  def self.with_taggings
    taggings = Tagging.select("DISTINCT tag_id")
    ids = taggings.map { |tagging| tagging.tag_id }
    tags = Tag.order('name').find(ids)
  end

end
