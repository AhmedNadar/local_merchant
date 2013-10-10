module ProductsHelper
	
	# price helper method
	def print_price(price)
		number_to_currency price
	end

	# stock helper
	def display_stock(stock)
		if stock > 0
			content_tag :span, "In stock " + stock.to_s
		else
			content_tag :span, "Out of stock"
		end
	end
end
