Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Exceptions are handled by ErrorsController
  config.exceptions_app = self.routes

  # Enable redis
  # config.cache_store = :redis_cache_store, { url: ENV["REDISTOGO_URL"] }

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.seconds.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = true

  config.action_mailer.perform_caching = false

  config.action_mailer.delivery_method = :smtp

  config.action_mailer.smtp_settings = {
    address: ENV['SMTP_SERVER'],
    port: ENV['SMTP_PORT'],
    domain: ENV['SMTP_DOMAIN'],
    authentication: ENV['SMTP_AUTH'],
    user_name: ENV['SMTP_LOGIN'],
    password: ENV['SMTP_PASSWORD'],
    enable_starttls_auto: true,
    ssl: true,
    tls: true,
  }


  # paperclip settings
  config.paperclip_defaults = {
    storage: :s3,
    s3_credentials: {
      bucket: ENV['AWS_BUCKET'],
      access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      secret_access_key: ENV['AWS_ACCESS_SECRET_KEY'],
      s3_region: ENV['AWS_REGION'],
      s3_host_name: 's3-eu-central-1.amazonaws.com',
    },
    s3_host_alias: ENV['AWS_CLOUDFRONT'],
    url: ':s3_alias_url',
  }


  config.i18n.fallbacks = [I18n.default_locale]

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Store files locally.
  config.active_storage.service = :amazon

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Suppress logger output for asset requests.
  config.assets.quiet = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker
end
