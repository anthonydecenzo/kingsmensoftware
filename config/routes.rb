Rails.application.routes.draw do
  get 'seller/index'
  get 'order/show'
  get 'order/destroy'
  get 'order/index'
  get 'users/show'
  get 'product/index'
  get 'product/show'
  get 'product/new'
  get 'product/edit'
  get 'dashboard/index'

  post 'product/new'
  post 'product/create'

  devise_for :users
  resources :users, :only => [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :post
  resources :product

  get 'welcome/index'

  root 'welcome#index'
end
