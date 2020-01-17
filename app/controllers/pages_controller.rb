require 'open-uri'

class PagesController < InheritedResources::Base

  def calculator
    @page = Page.find_by_name('Калькулятор')
  end

  def delivery
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

