Experience::Application.routes.draw do
  resources :invitations 

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  devise_scope :user do
    get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru'
  end


  root :to => 'calendars#show'
end
