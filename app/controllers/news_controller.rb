class NewsController < InheritedResources::Base
  add_breadcrumb "Главная", '/'

  before_action :set_item, only: [:show, :edit, :update, :destroy]

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

  def set_item
    @item = News.friendly.find(params[:id])
    redirect_to action: action_name, id: @item.friendly_id, status: 301 unless @item.friendly_id == params[:id]
  end

  def news_params
    params.require(:news).permit(:title, :intro, :body, :published_at)
  end
end

