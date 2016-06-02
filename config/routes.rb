Rails.application.routes.draw do
  resources :extinguishers do
    patch :renew, on: :member
  end
  resources :sectors


  root to: 'extinguishers#index'
end
