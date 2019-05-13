class CatalogController < ApplicationController
  add_breadcrumb "Главная", '/'
  add_breadcrumb "Каталог", '/catalog/product'

  def index

    filter_map = {
      service: "Услуги",
      product: "Продукция"
    }

    filter = params[:filter]

    add_breadcrumb filter_map[:"#{filter}"], "/catalog/#{filter}"

    @products = if filter === 'service'
      Service.all
    else
      ProductType.all
                end

    @page = Page.find_by_name('Каталог')
  end
end
