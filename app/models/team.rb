# == Schema Information
# Schema version: 20081212154123
#
# Table name: teams
#
#  id            :integer(4)      not null, primary key
#  name          :string(255)
#  basecamp_name :string(255)
#

class Team < ActiveRecord::Base

end
