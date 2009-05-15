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
  belongs_to :user, :dependent => :destroy
  
  validates_presence_of :user_id, :from, :to
  validate :from_is_in_future, :to_is_in_future, :to_is_greater_than_from
  validates_uniqueness_of :from, :scope => [:user_id]
  validates_uniqueness_of :to, :scope => [:user_id]
  
  named_scope :future, :conditions => ["unavailabilities.from > ?", Time.now], :order => "unavailabilities.from ASC"
  
  protected
    def from_is_in_future
      errors.add("from", "From date should be in the future") unless from > Time.now
    end
    
    def to_is_in_future
      errors.add("to", "To date should be in the future") unless self.to > Time.now unless to.nil?
    end
    
    def to_is_greater_than_from
      errors.add_to_base("To date should be after from date") unless to > from
    end
  
end