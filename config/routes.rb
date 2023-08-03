Rails.application.routes.draw do
  devise_for :users, skip: [:registrations]
  root 'tickets#index'
  resources :users, only: %i[new create show index edit update destroy]
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
end
