Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, controllers: { sessions: 'users/sessions'}

  get "/users", to: "users#index"
  resources :chatrooms do
    resource :chatroom_users
    resources :messages
  end

  root to: "chatrooms#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
