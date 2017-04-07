Rails.application.routes.draw do
  root to: 'application#root'
  mount Shopper::Engine => '/shopper'
end
