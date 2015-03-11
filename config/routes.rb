Rails.application.routes.draw do
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :applicants, controllers: { registrations: 'applicants/registrations'}

  get 'edit_profile' => 'applicants#edit'
  patch 'update_profile' => 'applicants#update'
  get 'draft' => 'applicants#draft_page'

  root to: 'welcome#index'
end
