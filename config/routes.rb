# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL, see https://guides.rubyonrails.org/routing.html
  get "admin", to: "admin#index"
  scope :admin do
    resources :carts,     only:   %i[index new create edit update destroy]
    resources :products,  only:   %i[index new create edit update destroy]
    resources :tags,      except: [:show]
    resources :meta_tags, except: [:show]
  end

  resources :products, only: [:show]
  resources :carts, only: [:show]
  get  "search", to: "search#index"
  post "products/:id/to_cart(.:format)", to: "products#to_cart", as: "to_cart"
  get  "whoami", to: "home#whoami"
  get  "gallery", to: "home#gallery"
  root "home#index"
end
