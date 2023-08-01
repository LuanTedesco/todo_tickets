Rails.application.routes.draw do
  resources :tickets
  resources :columns
  resources :comments
  resources :tags
  resources :attachments
  resources :sub_tasks
  resources :departaments
  resources :categories
  resources :priorities
  resources :companies
  devise_for :users
  root 'tickets#index'
end
