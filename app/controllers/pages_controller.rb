require 'open-uri'

class PagesController < InheritedResources::Base
  add_breadcrumb "Главная", '/'

  def calculator
    add_breadcrumb 'Калькулятор', '/calculator'

    @page = Page.find_by_name('Калькулятор')
  end

  def delivery
    add_breadcrumb 'Доставка', '/delivery'

    @page = Page.find_by_name('Доставка и оплата')
  end

  def sitemap
    file = open("https://#{ENV['AWS_CLOUDFRONT']}/sitemaps/sitemap.xml")
    render xml: file
  end

  private

  def page_params
    params.require(:page).permit(:name, :description, :title, :body)
  end
end

