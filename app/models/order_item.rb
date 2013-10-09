class OrderItem < ActiveRecord::Base
  belongs_to :prodcut
  belongs_to :order
end
