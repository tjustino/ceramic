# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL, see https://guides.rubyonrails.org/routing.html

  ######################################################################## admin
  get "admin", to: "admin#index"

  scope :admin do
    resources :banners
    resources :carts,     only:   %i[index new create edit destroy]
    resources :meta_tags, except: :show
    resources :products,  only:   %i[index new create edit destroy]
    resources :statics,   only:   %i[index edit]
    resources :tags,      except: :show
    resources :users,     only:   %i[index create]
  end

  ####################################################################### public
  resources :carts, only: %i[show update]
  root "home#index"
  resources :products, only: %i[show update]
  post "products/:id/to_cart(.:format)", to: "products#to_cart", as: "to_cart"
  get  "search",                         to: "search#index"

  controller :session do
    get    "login"  => :new
    post   "login"  => :create
    delete "logout" => :destroy
  end

  resources :statics, only: %i[show update]
  resources :users,   only: %i[new edit update destroy]
end
