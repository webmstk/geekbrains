Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get '/users/new' => 'users#new'
  # post '/users'    => 'users#create'

  root to: 'sessions#new'

  get '/login'  => 'sessions#new'
  get '/signup' => 'users#new'

  resources :sessions, only: [:create, :destroy]

  resources :users, only: [:new, :create]

  resources :tasks, only: [:new, :create, :index] do
    post :step, on: :member
  end


  # post '/tasks/:id/step' => 'tasks#step'

  # POST /tasks/21/incontext
  # POST /tasks/21/step # => params[:id]
  #
  # POST /tasks/stat



  # root to: 'sessions#new'
  #
  # get '/login'  => 'sessions#new'
  # get '/signup' => 'users#new'

  # resources :sessions, only: [:create, :destroy]
  # resources :users, only: [:create]
  # resources :tasks, only: [:index, :create] do
  #   post :incontext, on: :member
  #   post :step, on: :member
  # end

end
