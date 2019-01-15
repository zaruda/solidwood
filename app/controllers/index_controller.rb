class IndexController < ApplicationController


  def index
    # add_breadcrumb "Главная", :root_path

    @news = News.published.limit(3)
    # @products = Product.find(4)
  end
end
