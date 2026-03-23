class Admin::ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_products_path, notice: "Product created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @products = Product.order(created_at: :desc)
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to admin_products_path, notice: "Product updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def add_to_cart
    product = Product.find(params[:id])
    current_cart.add_product_to_cart(product)
    redirect_back fallback_location: products_path, notice: "成功加入購物車"
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :quantity, :price)
  end
end
