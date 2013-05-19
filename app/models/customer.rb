class Customer < ActiveRecord::Base
  has_secure_password

  attr_accessible :address, :email, :name, :password, :password_confirmation

  validates_presence_of :email, :password_digest
  validates_uniqueness_of :email

  def as_json(options = {})
    attributes.except("password_digest")
  end
end
