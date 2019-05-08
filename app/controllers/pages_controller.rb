require 'open-uri'

class PagesController < InheritedResources::Base

  def index
    @page = Page.find_by_name(params[:page])
  end

  # def about
  #   @page = Page.find_by_name('О нас')
  # end

  def calculator
    @page = Page.find_by_name('Калькулятор')
  end

  def delivery
    @page = Page.find_by_name('Доставка и оплата')
  end

  def contacts
    @page = Page.find_by_name('Контакты')
  end

  def sitemap
    file = open("https://#{ENV['DIGITALOCEAN_SPACE']}.ams3.cdn.digitaloceanspaces.com/sitemap.xml")
    render xml: file
  end

  private

  def page_params
    params.require(:page).permit(:name, :description, :title, :body)
  end
end

