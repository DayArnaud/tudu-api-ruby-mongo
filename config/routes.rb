Rails.application.routes.draw do
  resources :tasks do 
    resources :comments 
  end
  post '/tasks/:task_id/subtask', to: 'tasks#subtask', as: :subtask
  patch '/tasks/:task_id/subtask/:subtask_id', to: 'tasks#subtask_update' 
  get '/user_tasks/:user_id', to: 'tasks#user_tasks', as: :user_task
  resources :users, only: [:create, :index]
  mount_devise_token_auth_for 'User', at: 'auth'

end
