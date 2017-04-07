module Shopper
  class CheckoutController < ShopperController
    include Shopper::CheckoutWizard

    before_action :fast_authenticate_customer!
    before_action :check_empty_cart
    before_action :check_accesability, except: :complete

    before_action :set_progress_presenter

    rescue_from Wicked::Wizard::InvalidStepError do |_|
      redirect_to cart_path, alert: t('checkout.failure.invalid_step')
    end

    rescue_from Shopper::CheckoutWizard::EmptyCardError do |_|
      redirect_to cart_path, alert: t('checkout.failure.cart_empty')
    end

    rescue_from Shopper::CheckoutWizard::CantAccessError do |_|
      redirect_to checkout_path(minimal_accessible_step),
                  flash: { error: t('checkout.failure.must_fill_previous') }
    end

    def show
      present step_presenter.new(current_order)
      render_wizard
    end

    def update
      Shopper::CheckoutPage::ProceedCheckout.call(current_order, params, step) do
        on(:invalid) do |*attrs|
          present step_presenter.new(*attrs)
          render_wizard
        end
        on(:ok) { redirect_to_next_step }
      end
    end

    def complete
      Shopper::CheckoutPage::PlaceOrder.call(current_order, params) do
        on(:invalid) { redirect_to cart_path, alert: t('checkout.failure.invalid_step') }
        on(:ok) do |old_order|
          present step_presenter.new(old_order)
          render_wizard
        end
      end
    end

    private

    def set_progress_presenter
      select_up_to_step = minimal_accessible_step
      select_up_to_step = :complete if step == :complete
      present Shopper::CheckoutPage::ProgressPresenter.new(
        steps,
        step,
        select_up_to_step
      ), for: :progress
    end

    def step_presenter
      "Shopper::CheckoutPage::#{step.capitalize}StepPresenter".constantize
    end
  end
end
