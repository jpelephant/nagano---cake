Rails.application.routes.draw do
  devise_for :customers, controllers: {
   sessions:      'customers/sessions',
   passwords:     'customers/passwords',
   registrations: 'customers/registrations'
  }
  devise_for :admin
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope module: :customers do
    root to: 'homes#top'
    get 'homes', to: 'homes#about'
    resources :items, only: [:index, :show]
    patch 'customers/withdrawal', to: 'customers#withdrawal'
    get 'customers/unsubscribe', to: 'customers#unsubscribe'
    resources :customers, only: [:show, :edit, :update]
    patch 'customers/:id', to: 'customers#destroy'
    delete 'cart_items/destroy_all', to: 'cart_items#destroy_all'
    resources :cart_items, only: [:index, :update, :destroy, :create]
    get 'orders/thanks', to: 'orders#thanks'
    post 'orders/confirm', to: 'orders#confirm'
    post 'orders/verification', to: 'orders#verification'
    resources :orders, only: [:new, :index, :show]
    resources :shipping_addresses,  except: [:show, :new]
  end

  namespace :admin do
    get 'homes', to: 'homes#top'
    resources :items, except: [:destroy]
    resources :genres, except: [:new, :destro, :show]
    resources :customers, except: [:new, :create, :destroy]
    get 'order_show', to: 'order_show#show'
    patch 'orders', to: 'orders#update'
    patch 'order_details', to: 'order_details#update'
  end
end
