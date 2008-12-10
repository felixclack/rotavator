# == Schema Information
# Schema version: 20081003121500
#
# Table name: users
#
#  id                        :integer(11)     not null, primary key
#  name                      :string(100)     default("")
#  email                     :string(100)
#  crypted_password          :string(40)
#  salt                      :string(40)
#  remember_token            :string(40)
#  activation_code           :string(40)
#  state                     :string(255)     default("passive")
#  remember_token_expires_at :datetime
#  activated_at              :datetime
#  deleted_at                :datetime
#  created_at                :datetime
#  updated_at                :datetime
#  login                     :string(255)
#

require 'digest/sha1'
require 'basecamp'

class User < ActiveRecord::Base
  acts_as_authentic :transition_from_restful_authentication => true, :crypto_provider => Authlogic::CryptoProviders::BCrypt
  
  has_and_belongs_to_many :roles
  has_many :participations
  has_many :rotas, :through => :participations
  has_and_belongs_to_many :positions
  has_and_belongs_to_many :locations

  attr_accessible :login, :name, :password, :password_confirmation, :email
  
  def self.basecamp_authenticate(login, password)
    u = find(:first, :conditions => { :login => login })
    if u.nil?
      if is_waca?(login, password)
        u = User.create!(:login => login, :password => password, :password_confirmation => password)
      end
    end
    u
  end
  
  def has_role?(role)
    list ||= self.roles.map(&:name)
    list.include?(role.to_s) || list.include?('admin')
  end
  
  def rotas_available_for
    self.locations.map do |location|
      location.rotas.future.map{|r| ["#{r.service.start_at} #{location.name}", r.id] }.flatten
    end
  end
  
  def locations_available_for
    self.locations.map {|location| location.name}.compact.uniq.join(", ")
  end
  
  def positions_available_for
    self.positions.map {|position| position.name}.compact.uniq.join(", ")
  end
  
  def upcoming_positions
    self.participations.future.confirmed
  end
  
  def pending_positions
    self.participations.future.assigned
  end
  
  def self.is_waca?(login, password)
    Basecamp.establish_connection!("xcelchurch.seework.com", login, password)
    check_for_project_name("WACA+MEDIA")
  end
  
  def self.check_for_project_name(name)
    b = Basecamp.new
    b.projects.map{|a| a["name"] }.include? name
  end

end
