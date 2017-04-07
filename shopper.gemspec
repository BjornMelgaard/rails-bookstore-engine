$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'shopper/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'shopper'
  s.version     = Shopper::VERSION
  s.authors     = ['BjornMelgaard']
  s.email       = ['melgaardbjorn@gmail.com']
  s.homepage    = 'https://github.com/BjornMelgaard/rails-bookstor-engine'
  s.summary     = 'hmm'
  s.description = 'hmm'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['spec/**/*']

  s.add_dependency 'rails', '~> 5.0.2'
  s.add_dependency 'aasm'
  s.add_dependency 'haml'
  s.add_dependency 'wicked'
  s.add_dependency 'haml-rails'
  s.add_dependency 'responders'
  s.add_dependency 'rectify'
  s.add_dependency 'cancancan'
  s.add_dependency 'simple_form'
  s.add_dependency 'uglifier', '>= 1.3.0'
  s.add_dependency 'coffee-rails', '~> 4.2'
  s.add_dependency 'jquery-rails'
  s.add_dependency 'credit_card_validations'

  s.add_development_dependency 'pg'

  s.add_development_dependency 'awesome_pry'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'rails-controller-testing'
  s.add_development_dependency 'poltergeist'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'chromedriver-helper'
  s.add_development_dependency 'capybara-screenshot'
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'fuubar'
  s.add_development_dependency 'show_me_the_cookies'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'ffaker'
end
