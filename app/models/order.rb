class Order < ActiveRecord::Base
  
  has_many :order_items, dependent: :destroy
  belongs_to :address
  belongs_to :user
  validates_presence_of :order_items
  validate :has_items, on: :update


  def has_items
    unless self.order_items.count > 0
      errors.add(:order_items, "Must have item before checking out!")
    end
  end


  def total
    self.order_items.map do |i| 
      i.subtotal 
    end.sum
  end
end
