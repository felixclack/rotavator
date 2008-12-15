# == Schema Information
# Schema version: 20081212154123
#
# Table name: locations
#
#  id   :integer(4)      not null, primary key
#  name :string(255)
#

class Location < ActiveRecord::Base
  has_many :services, :attributes => true
  has_many :rotas, :through => :services
  has_and_belongs_to_many :users
  
end
