# == Schema Information
# Schema version: 20081212154123
#
# Table name: participations
#
#  id          :integer(4)      not null, primary key
#  state       :string(255)
#  user_id     :integer(4)
#  rota_id     :integer(4)
#  position_id :integer(4)
#  created_at  :datetime
#  updated_at  :datetime
#

class Participation < ActiveRecord::Base
  include AASM
  
  belongs_to :user
  belongs_to :position
  belongs_to :rota
  
  named_scope :future, :include => [:rota => :service], :conditions => ["services.start_at > ?", Time.now]
  named_scope :assigned, :conditions => {:state => "assigned"}
  named_scope :confirmed, :conditions => {:state => "confirmed"}
  
  aasm_column :state
  aasm_initial_state :assigned
  aasm_state :assigned
  aasm_state :confirmed
  aasm_state :declined
  
  aasm_event :confirm do
    transitions :to => :confirmed, :from => [:assigned, :declined]
  end
  
  aasm_event :decline do
    transitions :to => :declined, :from => [:assigned, :confirmed]
  end
  
end
