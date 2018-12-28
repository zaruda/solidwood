class PagesController < InheritedResources::Base

  def index
    @page = Page.find_by_name(params[:page])
  end

  def about
    @page = Page.find_by_name('about')
  end

  def catalog

  end

  private

    def page_params
      params.require(:page).permit(:name, :title, :body)
    end
end

