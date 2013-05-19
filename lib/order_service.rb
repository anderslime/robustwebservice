class OrderService
  attr_reader :product_ids, :order_params_input, :customer

  def initialize order_params_input, customer
    @product_ids        = order_params_input[:product_ids]
    @order_params_input = order_params_input.except(:product_ids) || {}
    @customer           = customer
  end

  def create
    order.quantities << quantities
    order.save
    order
  end

  private

  def quantities
    product_ids.uniq.map do |product_id|
      quantity = product_ids.count(product_id)
      Quantity.new(quantity: quantity, product_id: product_id)
    end
  end

  def order
    @order ||= Order.new(order_params)
  end

  def order_params
    order_params_input.merge(
      customer: customer,
      date: order_params_input[:date] || Time.now
    )
  end
end
