Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope module: :customers do
    root to: 'homes#top'
    get 'homes', to: 'homes#about'
    resources :items, only: [:index, :show]
    resources :customers, only: [:show, :edit, :update]
    get 'customers', to: 'customers#withdrawal'
    patch 'customers/:id', to: 'customers#destroy'
    resources :cart_items, only: [:index, :update, :destroy, :create]
    delete 'cart_items', to: 'cart_items#destroy_all'
    resources :orders, only: [:new, :index, :show]
    get 'orders', to: 'orders#verification'
    get 'orders', to: 'orders#thanks'
    patch 'orders', to: 'orders#confirm'
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
