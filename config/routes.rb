Rails.application.routes.draw do
  devise_for :users, skip: [:registrations], controllers: { sessions: 'sessions' }
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
  resources :notifications do
    member do
      patch :mark_as_read
      patch :mark_as_unread
    end
  end
  resources :companies do
    member do
      get 'edit_modal'
    end
  end

  delete "files/:id/destroy", to: "files#destroy", as: "destroy_file"
end
