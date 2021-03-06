# == Schema Information
# Schema version: 20081212154123
#
# Table name: services
#
#  id          :integer(4)      not null, primary key
#  start_at    :datetime
#  location_id :integer(4)
#

class Service < ActiveRecord::Base
  belongs_to :location
  has_many :rotas
  
  validates_uniqueness_of :start_at, :scope => :location_id, :message => "There is already a service at this location with the same start time."
  
  named_scope :future, :conditions => ["services.start_at > ?", Time.now], :order => "start_at ASC"
end
