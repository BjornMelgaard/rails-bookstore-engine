class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include Rectify::ControllerHelpers
  include Shopper::CurrentOrder

  def current_customer
    Customer.create(email: 'email')
  end
  alias current_user current_customer
  helper_method :current_customer

  def fast_authenticate_customer!
    true
  end

  def root
    render 'root/index'
  end
end
