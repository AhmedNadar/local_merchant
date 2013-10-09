class LineItemsController < ApplicationController
  
  before_action :set_item, only: [:show, :new, :update, :destroy]

  def index
    @line_items = LineItem.all
  end

  def new
    @line_item = LineItem.new
  end

  def edit
  end

  def show
  end

  def create
    @cart = current_cart
    product = Product.find(item_params)
    @line_item = @cart.line_items.build(:product => product)

    if @line_item.save
      redirect_to(@line_item.cart,:notice => 'Item saved successfully.') 
    else
       render 'new'  
    end
  end

  def update
    if @line_item.upadte_attributes(params[:line_item])
      redirect_to @line_item, notice: "Item was updated"
    else
      render "edit"
    end
  end

  def destroy
    @line_item.destroy
    redirect_to line_item_url
  end

  private
  def set_item
    @line_item = LineItem.find(params[:id])
  end

  def item_params
    params.require(:line_item).permit(:product_id, :cart_id)
  end

end
