# == Schema Information
# Schema version: 20081212154123
#
# Table name: unavailabilities
#
#  id         :integer(4)      not null, primary key
#  from       :datetime
#  to         :datetime
#  user_id    :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

class Unavailability < ActiveRecord::Base
  belongs_to :user
  
  named_scope :future, :conditions => ["unavailabilities.from > ?", Time.now], :order => "unavailabilities.from ASC"
end