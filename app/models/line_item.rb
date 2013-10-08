class LineItem < ActiveRecord::Base
  belongs_to :prodcut
  belongs_to :cart
end
