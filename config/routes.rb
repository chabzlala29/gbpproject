Rails.application.routes.draw do
  devise_for :applicants, controllers: { registrations: 'applicants/registrations'}
  resources :applicants

  root to: 'applicants#edit'
end
