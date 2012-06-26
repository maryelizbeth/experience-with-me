Experience::Application.routes.draw do
  resources :invitations 
  resources :users

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", 
                                       :sessions => "users/sessions" }
  
  devise_scope :user do
    get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru'
  end

  match '/sign_out' => "user/sessions#destroy", :as => "sign_out"


  root :to => 'calendars#show'

end
