Rails.application.routes.draw do

  resources :tasks, only: [:index, :create] do
    patch :incontext, on: :member
    patch :step,      on: :member
  end

  get '/users/new' => 'users#new'
  post '/users'    => 'users#create'

end
