class ProductsController < ApplicationController

	before_action :set_product, only: [:show, :edit, :update, :destroy]
  #before_filter :require_login, :only => @product

  def index

  	# @products = Product.where(user_id: current_user.id)
    @products = current_user.products
    # @products = Product.search(params[:search])
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
    @product.user = current_user
  	respond_to do |format|
	  	if@product.save
        params[:product][:user_id] = current_user.id
	  		format.html { redirect_to @product, notice: 'Product weas successfully created.' }
	  		format.json { render action: 'show', status: :created, location: @product }
	  	else
	  		format.html { render action: 'new' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
	  	end
  	end
  end

  def update
  	respond_to do |format|
  		if @product.update(product_params)
  			format.html { redirect_to @product, notice: 'product was successfully updated.' }
  			format.json { head :no_content }
  		else
  			format.html { render action: 'edit' }
  			format.json { render json: @product.errors, status: :unprocessable_entity}
   		end
  	end
  end

  def destroy
  end

  def shoes
    @products = Product.where("category_name = ?", "shoes")
  end

  def foods
    @products = Product.where("category_name = ?", "food")
  end

  def clothes
    @products = Product.where("category_name = ?", "clothes")
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_product
  	@product = Product.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  # This tells Rails to allow all four of our Product attributes to be mass-assign-able.
  def product_params
  	params.require(:product).permit(:title, :description, :price, :image, :stock, :category_name, :search )
  end
end
