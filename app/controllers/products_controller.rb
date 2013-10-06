class ProductsController < ApplicationController

	before_action :set_product, only:[:show, :update, :edit, :destroy]

  def index
  	@products = Product.all
  end

  def show
  end

  def new
  	@product = Product.new
  end

  def edit
  end

  def create
  	@product = Product.new(product_params)
	  	if@product.save
	  		redirect_to @product, notice: 'Product weas successfully created.'
	  	else
	  		render :new
	  	end
  end

  def update
  		if @product.update(product_params)
  			redirect_to @product, notice: 'product was successfully uopdated.'
  		else
  			render :edit
  		end
  end

  def destroy
  	@product.destroy
  	redirect_to products_url
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_product
  	@product = Product.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  # This tells Rails to allow all four of our Product attributes to be mass-assign-able.
  def product_params
  	params.require(:product).permit(:title, :description, :price, :image_url )
  end
end
