Rails.application.routes.draw do

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
  resources :items, only: [:index]


  get 'end_users/yours' => 'end_users#yours', as: 'end_user_yours'
  get 'end_users/yours/edit' => 'end_users#edit', as: 'end_user_edit'
  get 'end_users/leave' => 'end_users#leave', as: 'end_user_leave'
  patch 'end_users/:id/hide' => 'end_users#hide', as: 'end_user_hide'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
