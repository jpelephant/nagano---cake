Rails.application.routes.draw do
  devise_for :customers, controllers: {
   sessions:      'customers/sessions',
   passwords:     'customers/passwords',
   registrations: 'customers/registrations'
  }
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope module: :customers do
    root to: 'homes#top'
    get 'homes', to: 'homes#about'
    resources :items, only: [:index, :show]
    resources :customers, only: [:show, :edit, :update]
    get 'customers/withdrawal', to: 'customers#withdrawal'
    patch 'customers/:id', to: 'customers#destroy'
    resources :cart_items, only: [:index, :update, :destroy, :create]
    delete 'cart_items/destroy_all', to: 'cart_items#destroy_all'
    resources :orders, only: [:new, :index, :show]
    get 'orders/verification', to: 'orders#verification'
    get 'orders/thanks', to: 'orders#thanks'
    patch 'orders/confirm', to: 'orders#confirm'
    resources :shipping_address,  except: [:show, :new]
  end

  namespace :admins do
    get 'homes', to: 'homes#top'
    resources :items, except: [:destroy]
    resources :genres, except: [:new, :destro, :show]
    resources :customers, except: [:new, :create, :destroy]
    get 'order_show', to: 'order_show#show'
    patch 'orders', to: 'orders#update'
    patch 'order_details', to: 'order_details#update'
  end
end
