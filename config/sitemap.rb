# Set the host name for URL creation
require 'fog-aws'

SitemapGenerator::Sitemap.default_host = ENV['HOST']
SitemapGenerator::Sitemap.compress = false

SitemapGenerator::Sitemap.adapter = SitemapGenerator::S3Adapter.new({
                                                                        fog_provider: 'AWS',
                                                                        aws_access_key_id: ENV['DIGITALOCEAN_KEY_ID'],
                                                                        aws_secret_access_key: ENV['DIGITALOCEAN_SECRET'],
                                                                        fog_directory: ENV['DIGITALOCEAN_SPACE'],
                                                                        fog_region: 'ams3',
                                                                        fog_storage_options: {
                                                                            endpoint: 'https://ams3.digitaloceanspaces.com'
                                                                        }
                                                                    })

SitemapGenerator::Sitemap.sitemaps_host = "https://#{ENV['DIGITALOCEAN_SPACE']}.ams3.digitaloceanspaces.com"

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
