# == Schema Information
# Schema version: 20081003121500
#
# Table name: rotas
#
#  id         :integer(11)     not null, primary key
#  service_id :integer(11)
#  team_id    :integer(11)
#  created_at :datetime
#  updated_at :datetime
#

class Rota < ActiveRecord::Base
  belongs_to :service
  belongs_to :team
  has_many :participations
  has_many :users, :through => :participations
  has_many :positions, :through => :participations
  
  validates_presence_of :service_id, :team_id
end
