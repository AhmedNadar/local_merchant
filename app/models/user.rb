class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email, :first_name, :last_name, :username
  validates_uniqueness_of :email, :username

  has_many :products
  has_many :addresses
  has_many :orders
  
  def name
    return "#{first_name} #{last_name}"
  end

  def current_cart
    self.orders.where(status: nil).first_or_create
  end
end
