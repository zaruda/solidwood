class IndexController < ApplicationController


  def index
    # add_breadcrumb "Главная", :root_path

    @news = News.published.limit(3)
    @page = Page.find_by_name('Главная')
    # @products = Product.find(4)
  end
end
