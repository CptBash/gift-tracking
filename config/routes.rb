Rails.application.routes.draw do
  devise_for :users

  # define logout route, use get for now
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  # define routes for friends
  resources :friends do
    # define routes for gifts nested under friends
    resources :gifts, except: [:index]
  end

  # define routes for deleting gifts
  delete 'gifts/:id', to: 'gifts#destroy', as: 'delete_gift'

  # root route
  root to: "friends#index"
end
