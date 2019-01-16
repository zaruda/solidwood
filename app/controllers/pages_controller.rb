class PagesController < InheritedResources::Base

  def index
    @page = Page.find_by_name(params[:page])
  end

  def about
    @page = Page.find_by_name('about')
  end

  def calculator
    @page = Page.find_by_name('calculator')
    # add_breadcrumb "Калькулятор объемов", '/calculator'
  end

  def delivery
    @page = Page.find_by_name('delivery')
  end

  def contacts
    @page = Page.find_by_name('contact')
  end

  private

  def page_params
    params.require(:page).permit(:name, :description, :title, :body)
  end
end

