class PagesController < InheritedResources::Base

  def index
    @page = Page.find_by_name(params[:page])
  end

  def about
    @page = Page.find_by_name('about')
  end

  def calculator
    # add_breadcrumb "Калькулятор объемов", '/calculator'

  end

  def delivery

  end

  def contacts

  end

  private

  def page_params
    params.require(:page).permit(:name, :title, :body)
  end
end

