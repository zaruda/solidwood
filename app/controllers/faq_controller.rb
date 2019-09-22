class FaqController < ApplicationController
  add_breadcrumb "Главная", '/'

  def index
    add_breadcrumb 'Вопросы и ответы', '/faq'

    @faqs = Faq.all

    @page = Page.find_by_name('FAQ')
  end
end
