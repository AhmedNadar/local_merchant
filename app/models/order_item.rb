class OrderItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order

  def subtotal
    product.price * quantity
  end
end
