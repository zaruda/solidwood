class IndexController < ApplicationController
  def index
    @news = News.published
    @products = Product.find(4)
  end
end
