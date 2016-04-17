Rails.application.routes.draw do
  get 'travel_plans/new'

  devise_for :users
  resources :new_request
  resources :comments
  resources :requests do
    member do
      post 'deposit'
      post 'item_bought'
      post 'item_delivered'
      post 'cancel_request'
      post 'cancel_offer'
    end
    resources :offers
  end
  resources :travel_plans
  root 'home#index'
  get '/trip' => 'trips#new'
end
