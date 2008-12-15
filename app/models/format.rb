# == Schema Information
# Schema version: 20081214090133
#
# Table name: formats
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Format < ActiveRecord::Base
  has_and_belongs_to_many :positions
  has_many :rotas
end
