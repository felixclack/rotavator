# == Schema Information
# Schema version: 20081003121500
#
# Table name: participations
#
#  id          :integer(11)     not null, primary key
#  state       :string(255)
#  user_id     :integer(11)
#  rota_id     :integer(11)
#  position_id :integer(11)
#  created_at  :datetime
#  updated_at  :datetime
#

class Participation < ActiveRecord::Base
  include AASM
  
  belongs_to :user
  belongs_to :position
  belongs_to :rota
  
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
