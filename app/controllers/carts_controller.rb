class CartsController < ApplicationController

  def show
    add_breadcrumb "Главная", '/'
    add_breadcrumb "Корзина", '/checkout/step1'

    @order_items = current_order.order_items
  end
end
