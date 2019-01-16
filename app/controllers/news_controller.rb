class NewsController < InheritedResources::Base

  def index
    @news = News.published
    @page = Page.find_by_name('news')
  end

  def show
    @news = News.friendly.find(params[:id])
  end

  private

    def news_params
      params.require(:news).permit(:title, :intro, :body, :published_at)
    end
end

