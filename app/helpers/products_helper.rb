module ProductsHelper
	
	def print_price(price)
		number_to_currency price
	end

	def display_stock(stock)
		if stock > 0
			content_tag :span, "In Stock " + stock.to_s
			# <span>In Stock (##)</span>
		else
			content_tag :span, "Out of Stock"
			# <span>Out of Stock</span>
		end
	end
end
