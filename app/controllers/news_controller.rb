class NewsController < InheritedResources::Base
  add_breadcrumb "Главная", '/'

  def index
    add_breadcrumb "Новости", news_index_path

    @news = News.published
    @page = Page.find_by_name('Новости')
  end

  def show
    add_breadcrumb "Новости", news_index_path

    @news = News.friendly.find(params[:id])

    add_breadcrumb @news.title.truncate_words(10), news_path(@news)


  end

  private

    def news_params
      params.require(:news).permit(:title, :intro, :body, :published_at)
    end
end

