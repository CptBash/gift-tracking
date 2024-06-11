Rails.application.routes.draw do
  devise_for :users

  # define logout route, use get for now
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  # define routes for gifts
  resources :gifts
  match 'gifts/:id', to: 'gifts#destroy', via: :delete

  # define routes for friends
  resources :friends

  # root route
  root to: "friends#index"
end
