# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = ENV['HOST']
SitemapGenerator::Sitemap.compress = false

SitemapGenerator::Sitemap.create do
  @news = News.published

  @products = ProductType.all

  add '/delivery'
  add '/calculator'
  add '/catalog'
  add '/catalog/service'
  add '/catalog/product'

  @products.each do |product|
    add product_path(product),
        lastmod: product.updated_at,
        priority: 0.7
  end

  add '/news'
  @news.each do |post|
    add news_path(post),
        lastmod: post.updated_at
  end

  add '/contacts'
  add '/checkout/step1'
  add '/checkout/step2'
  add '/checkout/thanks'

  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
end
