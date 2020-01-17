class ContactsController < ApplicationController
  def index
    @page = Page.find_by_name('Контакты')
    render 'pages/contacts'
  end

  def create
    @contact = Contact.new(contacts_params)
    if @contact.save!
      WoodMailer.with(contact: @contact).callback.deliver_now
      render json: { status: :created }
    end
  end

  private

  def contacts_params
    params.require(:contact).permit(:phone, :name)
  end
end
