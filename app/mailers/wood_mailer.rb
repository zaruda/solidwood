class WoodMailer < ApplicationMailer
  def new_order
    @order = params[:order]
    mail(to: ENV['EMAIL_TO'], subject: 'Поступил новый заказ!')
  end

  def callback
    @contact = params[:contact]
    mail(to: ENV['EMAIL_TO'], subject: 'Новая заявка')
  end
end
