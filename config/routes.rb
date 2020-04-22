Rails.application.routes.draw do

  get 'cart_items/index'
  devise_for :end_users
  devise_for :admins

  root 'items#index'
  
  namespace :admins do
    get 'genres/index'
    get 'genres/edit'
  end

  namespace :admins do
    resources :end_users, only: [:index, :show, :edit, :update]
  	resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :show, :edit, :update]
  end

  resources :end_users, only: [:update]
  resources :items, only: [:index, :show]
  resources :cart_items, only: [:index, :create, :update]

  get 'end_users/yours' => 'end_users#yours', as: 'end_user_yours'
  get 'end_users/yours/edit' => 'end_users#edit', as: 'end_user_edit'
  get 'end_users/leave' => 'end_users#leave', as: 'end_user_leave'
  patch 'end_users/:id/hide' => 'end_users#hide', as: 'end_user_hide'
  delete 'cart_items/item/:id' => 'cart_items#destroy_item', as: 'cart_items_destroy_item'
  delete 'cart_items' => 'cart_items#destroy_cart', as: 'cart_items_destroy_cart'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
