module ProductsHelper
	
	# price helper method
	def print_price(price)
		number_to_currency price
	end

	# stock helper
	def display_stock(stock, requested = 1)
		if stock == 0
			content_tag :span, "Out of Stock"
		elsif requested < stock
			"there is enough stock to fulfll the order "
		else
		 content_tag(:span, "Insufficient stock (#{stock})", class: "low_stock")
		end
	end
end
