class FaqController < ApplicationController
  def index
    @faqs = Faq.all

    @page = Page.find_by_name('FAQ')
  end
end
