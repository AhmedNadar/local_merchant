module ProductsHelper
	
	# price helper method
	def print_price(price)
		number_to_currency price
	end

	# stock helper
	def display_stock(stock, requested = 1 )
		if stock < 0
			content_tag :span, "Out of Stock"
			# <span>Out of Stock</span>
		elsif @order_items.quantity >= requested
			content_tag :span, "In Stock " + stock.to_s				
		else @order_items.quantity <= requested
			content_tag :span, "Insufficient stock (#{stock})"
			# <span>In Stock (##)</span>
		end
	end
end
