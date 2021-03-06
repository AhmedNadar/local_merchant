module ProductsHelper
	
	# price helper method
	def print_price(price)
		number_to_currency price
	end

	# stock helper
	def display_stock(stock, requested = 1)
		if stock == 0
			content_tag :span, "Out of Stock"
		elsif stock >= requested
			content_tag :span, "In stock (#{stock}) "
		else
			content_tag :span, "Insufficient stock (#{stock})"
		end
	end
end
