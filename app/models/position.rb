# == Schema Information
# Schema version: 20081212154123
#
# Table name: positions
#
#  id   :integer(4)      not null, primary key
#  name :string(255)
#

class Position < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_and_belongs_to_many :rota_formats
  has_many :participations

end
