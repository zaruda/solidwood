module Wizard
  module Order
    STEPS = %w(step1 step2 thanks).freeze

    class Base
      include ActiveModel::Model
      attr_accessor :order

      delegate *::Order.attribute_names.map { |attr| [attr, "#{attr}="] }.flatten, to: :order

      def initialize(order_attributes)
        @order = ::Order.new(order_attributes)
      end
    end

    class Step1 < Base

    end

    class Step2 < Step1
      validates :name, presence: true
      validates :phone_number, presence: true
      validates :email, presence: true, format: { with: /@/ }
    end

    class Thanks < Base

    end

  end
end