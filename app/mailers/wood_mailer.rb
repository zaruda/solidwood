class WoodMailer < ApplicationMailer

  def new_order
    @mail = params[:mail]
    mail(to: ENV['EMAIL_DESTINATION'], subject: 'Поступил новый заказ!')
  end

  def callback
    p params
    @mail = params[:mail]
    mail(to: 'zaruda46@gmail.com', subject: 'Новая заявка!')
  end
end
