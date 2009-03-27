# == Schema Information
# Schema version: 20090325162553
#
# Table name: users
#
#  id                  :integer(4)      not null, primary key
#  login               :string(255)     default(""), not null
#  crypted_password    :string(255)     default(""), not null
#  password_salt       :string(255)     default(""), not null
#  persistence_token   :string(255)     default(""), not null
#  single_access_token :string(255)     default(""), not null
#  perishable_token    :string(255)     default(""), not null
#  login_count         :integer(4)      default(0), not null
#  last_request_at     :datetime
#  current_login_at    :datetime
#  last_login_at       :datetime
#  current_login_ip    :string(255)
#  last_login_ip       :string(255)
#  email               :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#  first_name          :string(255)
#  surname             :string(255)
#  phone               :string(255)
#

require 'digest/sha1'
require 'basecamp'

class User < ActiveRecord::Base
  acts_as_authentic :transition_from_restful_authentication => true, :crypto_provider => Authlogic::CryptoProviders::BCrypt, :validate_email_field => false
  
  has_and_belongs_to_many :roles
  has_many :participations
  has_many :unavailabilities
  has_many :rotas, :through => :participations
  has_and_belongs_to_many :positions
  has_and_belongs_to_many :locations

  #attr_accessible :login, :name, :password, :password_confirmation, :email
  
  def name
    if first_name.nil? and surname.nil?
      login.titleize
    else
      [first_name, surname].join(" ")
    end
  end
  
  def self.basecamp_authenticate(login, password)
    u = find(:first, :conditions => { :login => login })
    if u.nil?
      if is_waca?(login, password)
        u = User.create!(:login => login, :password => password, :password_confirmation => password)
      end
    end
    u
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
  
  def is_admin?
    true
  end

end
