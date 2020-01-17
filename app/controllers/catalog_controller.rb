class CatalogController < ApplicationController
  def index
    @products = if params[:filter] === 'service'
      Service.all
    else
      ProductType.all
                end

    @page = Page.find_by_name('Каталог')
  end
end
