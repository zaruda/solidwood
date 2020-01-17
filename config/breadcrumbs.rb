crumb :root do
  link "Главная", root_path
end

crumb :contacts do
  link "Контакты", '/contacts'
end

crumb :catalog do |is_service_catalog|
  link "Каталог", '/catalog/product'

  if is_service_catalog
    link "Услуги", '/catalog/service'
  else
    link "Продукция", '/catalog/product'
  end
end

crumb :product do |product|
  link product.name, product_path(product)

  parent :catalog
end

crumb :cart do
  link "Корзина", '/checkout/step1'
end

crumb :faq do
  link 'Вопросы и ответы', '/faq'
end

crumb :news do
  link "Новости", news_index_path
end

crumb :news_item do |news|
  link news.title.truncate_words(10), news_path(news)

  parent :news
end

crumb :calculator do
  link 'Калькулятор', '/calculator'
end

crumb :delivery do
  link 'Доставка', '/delivery'
end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).