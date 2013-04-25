class User < ActiveRecord::Base
  attr_accessible :name, :role, :address
end
