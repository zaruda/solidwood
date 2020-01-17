class NewsController < InheritedResources::Base
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @news = News.published
    @page = Page.find_by_name('Новости')
  end

  def show
    @news = News.friendly.find(params[:id])
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

