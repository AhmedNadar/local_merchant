class LineItemController < ApplicationController
  
  before_action :set_item, only: [:show, :new, :update, :destroy]
  def index
    @line_items = LineItem.all
    respond_to do |format|
      format.html
      format.json { render json: @line_items}
    end
  end

  def new
    @line_item = LineItem.new
  end

  def edit
    
  end

  def show
    
  end

  def create

  end

  def update
    
  end

  def destroy
    
  end

  private
  def set_item
    @line_items = LineItem.find(params[:id])
  end

  def item_params
    params.require(:line_item).permit(:product_id, :cart_id)
  end

end
