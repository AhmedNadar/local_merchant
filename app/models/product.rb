class Product < ActiveRecord::Base

	# override ActiveRecord method to handel removing $ from price at the Getter.
	def price=(input)
		input.delete!("$")
		super
	end

	#validations
	validates_presence_of :title, :description, :image_url, :price, :stock
	validates_numericality_of :price
	validates_numericality_of :stock, :greater_than_or_equal_to => 0
end
