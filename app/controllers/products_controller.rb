class ProductsController < ApplicationController
  before_action :set_product, only: %i[edit update destroy]
  before_action :set_product_seller_buyer, only: %i[show]

  def import
    Product.import(params[:file])
    redirect_to root_url, notice: 'Activity data imported!'
  end

  def index
    @products = Product.all
  end

  def show; end

  def new
    @product = Product.new
  end

  def edit; end

  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def set_product_seller_buyer
    @product = Product.find(params[:id])
    @sellers = Productsseller.where(product_id: params[:id]).includes(:seller)
    @buyers = Productspurchased.where(product_id: params[:id]).includes(:buyer)
  end

  def product_params
    params.require(:product).permit(:description, :price, :total)
  end
end
