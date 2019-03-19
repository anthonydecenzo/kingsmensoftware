Rails.application.routes.draw do
  get 'product/index'
  get 'product/show'
  get 'product/new'
  get 'product/edit'
  get 'dashboard/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :post

  get 'welcome/index'

  root 'welcome#index'
end
