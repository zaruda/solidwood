class ProductsController < ApplicationController
  def index

    @products = ProductType.all
    @order_item = current_order.order_items.new
  end

  def show
    @product_type = ProductType.find(params[:id])
    @order_item = current_order.order_items.new

  end
end
