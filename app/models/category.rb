class Category < ActiveRecord::Base
	has_many :products

	CATEGORIES = ["food", "shoes", "clothes", "toronto"]
end
