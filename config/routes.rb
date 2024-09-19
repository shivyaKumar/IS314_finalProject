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

  root "admin/products#index"
end
