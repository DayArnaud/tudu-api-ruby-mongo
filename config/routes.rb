Rails.application.routes.draw do
  resources :comments
  resources :tasks
  resources :users, only: [:create]
  mount_devise_token_auth_for 'User', at: 'auth'

end
