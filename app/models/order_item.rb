class OrderItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order

  def subtotal
    product.price.to_s.to_d * quantity.to_s.to_d
  end
end
