require 'resque/server'
Rails.application.routes.draw do
  get 'payments/index'
  get 'payments/new'
  get 'transacations/index'
 
  get 'wallets/index'
  get 'bookings/new'
  get 'bookings/index'
  get 'reservations/index'
  get 'reservations/show'
  get 'reservations/new'
  get 'reservations/edit'
  # get 'employees/index'
  # get 'employees/show'
  # get 'employees/new'
  # get 'employees/edit'
  get 'employees/allemployee'
  # get 'rooms/index'
  # get 'rooms/show'
  # get 'rooms/new'
  # get 'rooms/edit'
  # get 'hotels/index'
  # get 'hotels/new'
  # get 'hotels/edit'

  # post '/rooms', to: 'rooms#create'
  devise_for :users
  
  root 'main#home'
  get 'main/display', to: 'main#display'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :hotels do
    resources :rooms do 
    end
    resources :employees
    collection do
      post 'import_csv'
    end
    # resources :employees, only: [:index, :new, :create]
  end
  # resources :bookings, only: [:index, :new, :create, :show, :edit, :update, :destroy]

  resources :bookings 
  
  resources :payments
  
  # resources :payments

  resources :dashboard

  resources :checkout, only: [:create]

  resources :main

  authenticate :user do
    mount Resque::Server.new, at: '/jobs'
  end

  # authenticate :user, -> (u) {u.id == 11} do
  #   mount Resque::Server.new, at: '/jobs'
  # end


  # resources :products

  post 'checkout/create', to: 'checkout#create'
  # resources :checkout




  get 'rooms/allrooms', to: 'rooms#allrooms';
  get 'rooms/roominsidehotel', to: 'rooms#roominsidehotel';


  get 'main/hotelrooms/:hotel_id', to: 'main#hotelrooms', as: 'test'

  get 'rooms/hotelallrooms', to: 'rooms#hotelallrooms'

  # get 'payments/new', to: 'payments#new'
  # get 'payments/create', to: 'payments#create'

  resources :payments
  
end
