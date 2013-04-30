class Quantity < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  attr_accessible :quantity
end
