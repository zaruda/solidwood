class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order, :setting

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end



  protected

  def setting
    @settings = Rails.cache.fetch('settings', :expires_in => 10.minutes) do
      Setting.first
    end
  end

end
