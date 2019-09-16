class ProductsController < ApplicationController

  before_action :set_item, only: [:show, :edit, :update, :destroy]

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

  private

  def set_item
    @item = ProductType.friendly.find(params[:id])
    redirect_to action: action_name, id: @item.friendly_id, status: 301 unless @item.friendly_id == params[:id]
  end

end
