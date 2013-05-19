class Order < ActiveRecord::Base
  belongs_to :customer

  has_many :quantities

  validates_presence_of :customer, :date, :paymentinfo

  def as_json(options = {})
    attributes.merge(
      :products => quantities.map {|q|
        {
          id: q.product.id,
          name: q.product.name,
          quantity: q.quantity
        }
      }
    )
  end
end
