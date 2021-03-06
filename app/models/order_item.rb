class OrderItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order

  validates_numericality_of :quantity, :greater_than => 0
  validates_presence_of :order_id, :product_id

  def subtotal
    Product.find(self.product_id).price.to_s.to_d * quantity.to_s.to_d
  end
end
