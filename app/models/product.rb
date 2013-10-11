class Product < ActiveRecord::Base

  mount_uploader :image, ImageUploader
 	# override ActiveRecord method to handel removing $ from price at the Getter.
	def price=(input)
		input.delete!("$")
		super
	end
  
  # order by title
  default_scope :order => 'title'
  
  has_many :order_items
  belongs_to :users
  
  # ensure that there are no order items referencing this product before deletng product
  before_destroy :ensure_not_accossiated_to_any_order_item    
  def ensure_not_accossiated_to_any_order_item
    if order_items.empty?
      return true
    else
      errors.add :base, "You can not delete that becasue its assocciated to an item(s)."
      return false
    end
  end

	#validations order is ipmortant for view 
  validates_uniqueness_of :title
  validates_length_of :title, :minimum => 5
	validates_presence_of :title, :description, :image_url, :price, :stock
	validates_numericality_of :price, :greater_than_or_equal_to => 0.01
	validates_numericality_of :stock, :greater_than_or_equal_to => 0
  validates_format_of :image_url, :with => /\.(gif|jpg|png)\z/i
end
