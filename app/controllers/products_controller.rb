class ProductsController < ApplicationController

  def index
    @products = ProductType.all
    @order_item = current_order.order_items.new
  end

  def show
    add_breadcrumb "Главная", '/'
    add_breadcrumb "Каталог", '/catalog/product'
    add_breadcrumb "Продукция", '/catalog/product'

    @product_type = ProductType.friendly.find(params[:id])

    add_breadcrumb @product_type.name, product_path(@product_type)

    @order_item = current_order.order_items.new

  end
end
