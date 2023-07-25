Rails.application.routes.draw do
  resources :tasks do 
    resources :comments 
  end
  post '/tasks/:task_id/subtask', to: 'tasks#subtask', as: :subtask
  get '/user_tasks/:user_id', to: 'tasks#user_tasks', as: :user_tasks
  post '/sign_in', to: 'users#login', as: :login
  resources :users, only: [:create, :index]

end
