module ApplicationHelper
  def number_to_currency(number, options = {})
    options[:locale] ||= I18n.locale
    super(number, options)
  end

  def title(title)
    content_for(:title) { title }
  end

  def description(text)
    content_for(:description) { text }
  end

  def image(url)
    content_for(:image) { url }
  end

end
