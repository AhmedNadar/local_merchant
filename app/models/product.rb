class Product < ActiveRecord::Base

	# override ActiveRecord method to handel removing $ from price at the Getter.
	def price=(input)
		input.delete!("$")
		super
	end

	#validations
	validates_presence_of :title, :description, :image_url, :price 
	validates_numericality_of :price
end
