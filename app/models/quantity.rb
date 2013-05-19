class Quantity < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  attr_accessible :quantity, :order, :product

  validates_presence_of :product, :order, :quantity
end
