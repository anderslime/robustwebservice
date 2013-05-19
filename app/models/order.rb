class Order < ActiveRecord::Base
  belongs_to :customer

  has_many :quantities

  validates_presence_of :customer, :date, :paymentinfo
end
