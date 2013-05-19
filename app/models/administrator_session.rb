class AdministratorSession < ActiveRecord::Base
  attr_accessible :access_token, :administrator

  belongs_to :customer

  before_create :generate_access_token

  def generate_access_token
    begin
      self.access_token = SecureRandom.hex(32)
    end while self.class.where(access_token: access_token).exists?
  end
end
