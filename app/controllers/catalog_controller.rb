class CatalogController < ApplicationController
  def index
    p params[:filter]
    @products = Product.all
    @order_item = current_order.order_items.new
  end
end
