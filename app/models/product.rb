class Product < ActiveRecord::Base
	validates_numericality_of :price

	# override ActiveRecord method to handel removing $ from price at the Getter.
	def price=(input)
		input.delete!("$")
		super
	end
end
