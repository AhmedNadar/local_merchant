class OrderItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order

  validates_numericality_of :quantity, :greater_than => 0

  def subtotal
    product.price.to_s.to_d * quantity.to_s.to_d
  end
end
