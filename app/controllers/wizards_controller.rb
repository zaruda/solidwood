class WizardsController < ApplicationController
  before_action :load_order_wizard, except: %i(validate_step)

  def validate_step
    current_step = params[:current_step]

    @order_wizard = wizard_order_for_step(current_step)
    @order_wizard.order.attributes = order_wizard_params || {}
    session[:order_attributes] = @order_wizard.order.attributes

    if @order_wizard.valid?
      next_step = wizard_order_next_step(current_step)
      create if next_step == 'thanks'

      redirect_to action: next_step
    else
      render current_step
    end
  end

  def create

    if current_order.update(
      name: @order_wizard.order.name,
      email: @order_wizard.order.email,
      phone_number: @order_wizard.order.phone_number,
      total: current_order.subtotal,
      order_status_id: 2
    )

      WoodMailer.with(order: current_order).new_order.deliver_now
      session[:order_attributes] = nil
      session[:order_id] = nil

    end

  end

  private

  def load_order_wizard
    @order_wizard = wizard_order_for_step(action_name)
    @order_items = current_order.order_items
    @order = current_order
  end

  def wizard_order_next_step(step)
    Wizard::Order::STEPS[Wizard::Order::STEPS.index(step) + 1]
  end

  def wizard_order_for_step(step)
    raise InvalidStep unless step.in?(Wizard::Order::STEPS)

    "Wizard::Order::#{step.camelize}".constantize.new(session[:order_attributes])
  end

  def order_wizard_params
    params.require(:order_wizard).permit(:email, :name, :phone_number) if params[:order_wizard].present?
  end

  class InvalidStep < StandardError; end
end