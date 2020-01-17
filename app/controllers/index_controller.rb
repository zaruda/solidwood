class IndexController < ApplicationController

  def index
    @news = News.published.limit(3)
    @page = Page.find_by_name('Главная')
  end
end
