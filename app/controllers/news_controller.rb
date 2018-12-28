class NewsController < InheritedResources::Base

  def index
    @news = News.published
  end

  def show
    @news = News.friendly.find(params[:id])
  end

  private

    def news_params
      params.require(:news).permit(:title, :intro, :body, :published_at)
    end
end

