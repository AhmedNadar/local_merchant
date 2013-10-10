class ProductsController < ApplicationController

	before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
  	@products = Product.all
  	respond_to do |format|
  		format.html
  		format.json {render json: @products}
  	end
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
  	respond_to do |format|
	  	if@product.save
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
  	@product.destroy
	  respond_to do |format|
	 		format.html { redirect_to products_path}
    	format.json { head :no_content }
		end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_product
  	@product = Product.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  # This tells Rails to allow all four of our Product attributes to be mass-assign-able.
  def product_params
  	params.require(:product).permit(:title, :description, :price, :image_url, :stock )
  end
end
