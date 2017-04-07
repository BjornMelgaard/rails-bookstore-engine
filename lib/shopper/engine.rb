require_relative 'model_methods'

module Shopper
  class Engine < ::Rails::Engine
    isolate_namespace Shopper

    config.generators do |g|
      g.template_engine :haml

      g.test_framework      :rspec,        fixture: false
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
      g.assets false
      g.helper false
    end
  end
end

ActiveSupport.on_load :active_record do
  ActiveRecord::Base.include Shopper::ModelMethods
end

