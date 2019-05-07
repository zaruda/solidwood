# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = ENV['HOST']
SitemapGenerator::Sitemap.compress = false

SitemapGenerator::Sitemap.public_path = 'tmp/'
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'

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

end
