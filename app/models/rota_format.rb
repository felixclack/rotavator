# == Schema Information
# Schema version: 20090325162553
#
# Table name: rota_formats
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class RotaFormat < ActiveRecord::Base
  has_and_belongs_to_many :positions
  has_many :rotas
  
  validates_uniqueness_of :name
end
