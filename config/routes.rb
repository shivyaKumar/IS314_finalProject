Rails.application.routes.draw do
  namespace :admin do
    devise_for :admins, controllers: {
      sessions: 'admin/sessions'
    }

    resources :products do
      member do
        delete :remove_image
      end
    end

    resources :orders
    resources :users
  end

  resources :products, only: [:index, :show, :create, :update, :destroy]

  resources :wishlists, only: [:index, :create] do
    delete 'remove/:product_id', to: 'wishlists#destroy', as: 'remove', on: :collection
  end
  post 'wishlists/add/:product_id', to: 'wishlists#create', as: 'add_to_wishlist'

  root "admin/products#index"
end
