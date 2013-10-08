class Product < ActiveRecord::Base

  default_scope :order => 'title'

	# override ActiveRecord method to handel removing $ from price at the Getter.
	def price=(input)
		input.delete!("$")
		super
	end

	#validations order is ipmortant for view 
  validates_uniqueness_of :title
  validates_length_of :title, :minimum => 13
	validates_presence_of :title, :description, :image_url, :price, :stock
	validates_numericality_of :price, :greater_than_or_equal_to => 0.01
	validates_numericality_of :stock, :greater_than_or_equal_to => 0
  validates_format_of :image_url, :with => %r{\.(gif|jpg|png)z}i
end
