class Customer < ActiveRecord::Base
  has_secure_password

  attr_accessible :address, :email, :name, :password, :password_confirmation

  validates_presence_of :email
  validates_uniqueness_of :email
end
