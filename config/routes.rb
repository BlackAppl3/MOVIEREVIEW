Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
  get 'information/ban_user/:id', to: "information#ban_user"
  get 'information/warn_user/:id', to: "information#warn_user"
  get 'log_out' => "sessions#destroy"
  get 'information/root' => "information#root"
  get 'information/destroy/:id' => "information#destroy"
  get 'information/root' => "information#root"
  get 'information/movie_info/:id' => "information#movie_info"
  get 'information/show_requests' => "information#show_requests"
  get 'information/unban_user/:email' => "information#unban_user", as: "query"
  get 'information/warning/:id' => "information#warning"
  get 'information/history/:email' => "information#history"
  post 'information/addmovie' => "information#addmovie"
  get 'information/delete_movie' => "information#delete_movie"
  post 'information/edit_movie/:id' => "information#edit_movie"
  resources :information
  resources :contacts
  resources :users, only: [:index, :create]
  resources :sessions, only: [:create]
end
