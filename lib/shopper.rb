require 'jquery-rails'
require 'aasm'
require 'wicked'
require 'rectify'
require 'haml'
require 'cancancan'
require 'responders'
require 'simple_form'
require 'credit_card_validations'

require 'shopper/engine'
require 'shopper/configuration'
require 'shopper/current_order'
require 'shopper/checkout_wizard'

module Shopper
  extend Configuration
end
