class Tagging < ActiveRecord::Base
  
  belongs_to :page, touch: true
  belongs_to :tag
  
end
