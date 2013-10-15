class Product < ActiveRecord::Base

  #validations order is ipmortant for view 
  validates_uniqueness_of :title
  validates_length_of :title, :minimum => 5
  validates_presence_of :title, :description, :image, :price, :stock
  validates_numericality_of :price, :greater_than_or_equal_to => 0.01
  validates_numericality_of :stock, :greater_than_or_equal_to => 0
  # validates_format_of :image_url, :with => /\.(gif|jpg|png)\z/i

  before_destroy :ensure_not_accossiated_to_any_order_item   
  has_many :order_items
  belongs_to :users
  belongs_to :category
  mount_uploader :image, ImageUploader
  default_scope :order => 'title'

  def price=(input)
		input.delete!("$")
		super
  end
  
  def ensure_not_accossiated_to_any_order_item
    if order_items.empty?
      return true
    else
      errors.add :base, "You can not delete that becasue its assocciated to an item(s)."
      return false
    end
  end
end
