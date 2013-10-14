class UserMailer < ActionMailer::Base
  def registration_confirmation(user)

  	@user = user
  	mail(:to => user.email, :subject => "Welcome to localmerchant", :from => "support@localmerchant.com")
  end

  def order_confirmation(user, order)
  	@user = user
  	@order = order
  	mail(:to => user.email, :subject => "Order confirmation", :from => "support@localmerchant.com")
  end

  def print_price(price)
		number_to_currency price
	end
end
