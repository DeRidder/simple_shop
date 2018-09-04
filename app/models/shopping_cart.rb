class ShoppingCart
  def initialize(token:)
    @token = token
  end

  def order
    @order ||= Order.find_or_create_by(token: @token)
  end

  def add_item(product_id:, quantity: 1)
    product = Product.find(product_id)

    order_item = order.order_items.find_or_create_by(
      product_id: product_id,
      price: product.price  
    )

    ActiveRecord::Base.transaction do
      order_item.update(
        quantity: order_item.quantity.to_f + quantity.to_f
      )
      update_total!
    end
  end

  def remove_item(id:)
    ActiveRecord::Base.transaction do
      order.order_items.destroy(id)
      update_total!
    end
  end

  def items_count
    order.order_items.sum(:quantity)
  end
   
  private

  def update_total!
    order.update(
      total: order.order_items.sum('quantity * price')
    )
  end
end