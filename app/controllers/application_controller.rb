class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order, :setting, :product_types, :services
  before_action :redirect_www_to_non_www

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

  def redirect_www_to_non_www
    domain_parts = request.host.split('.')
    if domain_parts.first == 'www'
      redirect_to(request.original_url.gsub('www.', ''), status: 301) and nil
    end
  end


  protected

  def setting
    @settings = Rails.cache.fetch('settings', :expires_in => 10.minutes) do
      Setting.first
    end
  end
  
  def services
    @services = Service.all
  end

  def product_types
    @product_types = ProductType.active
  end

end
