# == Schema Information
# Schema version: 20081214090133
#
# Table name: rotas
#
#  id         :integer(4)      not null, primary key
#  service_id :integer(4)
#  team_id    :integer(4)
#  created_at :datetime
#  updated_at :datetime
#  format_id  :integer(4)
#

class Rota < ActiveRecord::Base
  belongs_to :service
  belongs_to :team
  belongs_to :rota_format
  has_many :participations, :attributes => true, :discard_if => :blank?
  has_many :users, :through => :participations
  has_many :positions, :through => :rota_format
  
  #validates_presence_of :service_id, :team_id
  #validates_uniqueness_of :service_id, :scope => :team_id
  
  named_scope :future, :include => :service, :conditions => ["services.start_at > ?", Time.now]
end
