class OrderItem < ActiveRecord::Base
  belongs_to :prodcut
  belongs_to :cart
end
