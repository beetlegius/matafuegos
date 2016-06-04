Rails.application.routes.draw do

  resources :extinguishers do
    patch :renew, on: :member
  end
  resources :sectors

  namespace :api, defaults: { format: :json } do
    resources :extinguishers do
      patch :renew, on: :member
    end
    resources :sectors
  end

  get :angular, to: 'angular#index'

  root to: 'extinguishers#index'
end
