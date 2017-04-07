module Shopper
  module CurrentOrder
    extend ActiveSupport::Concern

    KEY = :current_order_id

    included do
      helper_method :current_order
    end

    def current_order
      @current_order ||= Shopper::Order.find(get_id)
    rescue ActiveRecord::RecordNotFound
      create_current_order
    end

    def create_current_order
      @current_order = create_order
      set_id(@current_order.id)
      @current_order
    end

    private

    # show_me_the_cookies can`t operate with signed cookies
    def use_signed
      !Rails.env.test?
    end

    def get_id
      use_signed ? cookies.signed[KEY] : cookies[KEY]
    end

    def set_id(id)
      hash = { value: id, expires: Shopper.expires_after.from_now }
      if use_signed
        cookies.signed[KEY] = hash
      else
        cookies[KEY] = hash
      end
    end

    def create_order
      Shopper::Order.create
    end
  end
end
