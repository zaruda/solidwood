class CatalogController < ApplicationController
  def index
    @products = if params[:filter] === 'service'
      Service.all
    else
      ProductType.active
                end

    @page = Page.find_by_name('Каталог')
  end
end
