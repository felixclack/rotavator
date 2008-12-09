# == Schema Information
# Schema version: 20081003121500
#
# Table name: positions
#
#  id   :integer(11)     not null, primary key
#  name :string(255)
#

class Position < ActiveRecord::Base
  has_and_belongs_to_many :users
end
