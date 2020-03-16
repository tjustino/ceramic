# frozen_string_literal: true

Rails.application.routes.draw do
  resources :statics
  # For details on the DSL, see https://guides.rubyonrails.org/routing.html

  ######################################################################## admin
  get "admin", to: "admin#index"

  scope :admin do
    resources :banners
    resources :carts,     only: %i[index new create edit update destroy]
    resources :meta_tags, except: [:show]
    resources :products,  only: %i[index new create edit update destroy]
    resources :tags,      except: [:show]
    resources :users,     only:   [:index]
  end

  ####################################################################### public
  resources :carts, only: [:show]
  resources :users, only: %i[new create edit update destroy]
  root "home#index"
  # get  "whoami",                         to: "home#whoami"
  # get  "gallery",                        to: "home#gallery"
  resources :products,                   only: [:show]
  post "products/:id/to_cart(.:format)", to: "products#to_cart", as: "to_cart"
  get  "search",                         to: "search#index"

  controller :session do
    get    "login"  => :new
    post   "login"  => :create
    delete "logout" => :destroy
  end
end
