Rails.application.routes.draw do
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :applicants, controllers: { registrations: 'applicants/registrations'}

  get 'edit_profile' => 'applicants#edit'
  patch 'update_profile' => 'applicants#update'

  root to: 'applicants#edit'

  resources :educations, only: [:edit, :update, :create, :destroy]
  resources :families, only: [:edit, :update, :create, :destroy]
  resources :languages, only: [:edit, :update, :create, :destroy]
end
