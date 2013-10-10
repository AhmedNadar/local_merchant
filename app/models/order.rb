class Order < ActiveRecord::Base
  has_many :order_items, :dependent => :destroy

  def total
    order_items.subtotal.sum 
  end
end
