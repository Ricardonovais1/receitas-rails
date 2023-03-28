Rails.application.routes.draw do
  root                to: 'home#index'
  resources :recipes, only: [:show, :new, :create, :edit, :update] do 
    patch :publish, on: :member
    patch :unpublish, on: :member
  end
  resources :recipe_types, only: [:new, :create]
end
