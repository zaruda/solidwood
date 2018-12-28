class WoodMailer < ApplicationMailer
  def send_invoice
    # @user = params[:subscriber]
    # mail(to: @user.email, subject: '')
  end

  def new_order
    @mail = params[:mail]
    mail(to: ENV['EMAIL_DESTINATION'], subject: 'New contact email!')
  end
end
