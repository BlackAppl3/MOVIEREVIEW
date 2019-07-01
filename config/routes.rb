Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
  get 'log_out' => "sessions#destroy"
  get 'information/root' => "information#root"
  get 'information/destroy/:id' => "information#destroy"
  get 'information/root' => "information#root"
  get 'information/movie_info/:id' => "information#movie_info"
  resources :information
  resources :users, only: [:index, :create]
  resources :sessions, only: [:create]
end
