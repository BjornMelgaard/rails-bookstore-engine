module Shopper
  module Configuration
    attr_accessor :expires_after,
                  :parent_controller,
                  :parent_mailer


    def configure
      yield self
    end

    def self.extended(base)
      base.set_default_configuration
    end

    def set_default_configuration
      self.expires_after     = 5.hours
      self.parent_controller = '::ApplicationController'
      self.parent_mailer     = '::ApplicationMailer'
    end
  end
end
