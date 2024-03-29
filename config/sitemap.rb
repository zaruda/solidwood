# Set the host name for URL creation
require 'aws-sdk'

SitemapGenerator::Sitemap.default_host = ENV['HOST']
SitemapGenerator::Sitemap.compress = false

SitemapGenerator::Sitemap.adapter = SitemapGenerator::AwsSdkAdapter.new(ENV['AWS_BUCKET'],
                                                                        aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
                                                                        aws_secret_access_key: ENV['AWS_ACCESS_SECRET_KEY'],
                                                                        aws_region: ENV['AWS_REGION']
)

SitemapGenerator::Sitemap.sitemaps_host = "https://#{ENV['AWS_CLOUDFRONT']}"

SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'

SitemapGenerator::Sitemap.create do

  @news = News.published

  @products = ProductType.active

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
