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

class User < ActiveRecord::Base
  include Authentication
  include Authentication::ByPassword
  include Authentication::ByCookieToken
  include Authorization::AasmRoles

  validates_format_of :name, :with => RE_NAME_OK, :message => MSG_NAME_BAD, :allow_nil => true
  validates_length_of :name, :maximum => 100
  validates_presence_of :login
  validates_length_of :login, :within => 3..100 #r@a.wk
  validates_uniqueness_of :login, :case_sensitive => false
  #validates_format_of :email, :with => RE_EMAIL_OK, :message => MSG_EMAIL_BAD
  
  # Relationships
  has_and_belongs_to_many :roles
  has_many :participations
  has_and_belongs_to_many :positions
  has_and_belongs_to_many :locations

  # HACK HACK HACK -- how to do attr_accessible from here?
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  attr_accessible :login, :name, :password, :password_confirmation

  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  #
  # uff.  this is really an authorization, not authentication routine.  
  # We really need a Dispatch Chain here or something.
  # This will also let us return a human error message.
  #
  def self.authenticate(email, password)
    u = find_in_state :first, :active, :conditions => { :email => email } # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end
  
  def self.basecamp_authenticate(login, password)
    p = Person.new
    u = find_in_state :first, :active, :conditions => { :login => login } # need to get the salt
    if u.nil?
      if p.is_waca?(login, password)
        u = User.create!(:login => login, :password => password, :password_confirmation => password)
        u.register!
        u.activate!
      end
    end
    u && u.authenticated?(password) ? u : nil
  end
  
  # Check if a user has a role.
  def has_role?(role)
    list ||= self.roles.map(&:name)
    list.include?(role.to_s) || list.include?('admin')
  end

  protected
    
  def make_activation_code
    self.deleted_at = nil
    self.activation_code = self.class.make_token
  end
end
