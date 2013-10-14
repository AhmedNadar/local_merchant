class Order < ActiveRecord::Base
  
  has_many :order_items, dependent: :destroy
  belongs_to :address


  def total
    self.order_items.map do |i| 
      i.subtotal 
    end.sum
  end
end
