# == Schema Information
# Schema version: 20081003121500
#
# Table name: teams
#
#  id            :integer(11)     not null, primary key
#  name          :string(255)
#  basecamp_name :string(255)
#

class Team < ActiveRecord::Base

end
