# == Schema Information
# Schema version: 20081003121500
#
# Table name: services
#
#  id          :integer(11)     not null, primary key
#  start_at    :datetime
#  location_id :integer(11)
#

class Service < ActiveRecord::Base
  belongs_to :location
  has_many :rotas
  
  named_scope :future, :conditions => ["services.start_at > ?", Time.now]
end
