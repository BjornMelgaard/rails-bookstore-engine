Shopper::Engine.routes.draw do
  resource :cart, only: %i(show update), controller: 'cart'
  post 'cart/:type/:id', to: 'cart#add_product', as: :cart_add_product

  resources :order_item, only: :destroy

  get 'checkout/complete', to: 'checkout#complete', id: 'complete'
  resources :checkout, only: %i(show update)

  resources :orders, only: %i(index show)
end
