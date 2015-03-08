Rails.application.routes.draw do
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :applicants, controllers: { registrations: 'applicants/registrations'}
  resources :applicants

  root to: 'welcome#index'
end
