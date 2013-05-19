class Quantity < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  attr_accessible :quantity, :order_id, :product_id

  validates_presence_of :order_id, :product_id, :quantity
end
