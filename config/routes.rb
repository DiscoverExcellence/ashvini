Rails.application.routes.draw do
  devise_for :users
#devise_for :users, controllers: {
   #       sessions: 'users/sessions'
    #            }

   # devise_scope :user do
    #  patch "/confirm" => "confirmations#confirm"
   # end
  #devise_for :users
 # get "login",to: 'users#index'
#  get  "user" , to: "users#show"
  post "users",to: "users#login"
  get "welcome",to: "users#display"
  get "logout",to: "users#index"
#  root 'tournaments#dashboard'
  root "users#index"
#  concern :match do
 #   resources :matches
 # end

  concern :player do
    resources :players
  end
 
  resources :games do
    resources :tournaments do
      resources :matches do
        resources :players
      end
    end
  end

  resources :tournaments  do 
    resources :matches
  end

  resources :games do
    resources :matches
  end
  resources :players
resources :games do
  resources :matches do
    concerns :player
  end
end

=begin
  concerns :match, except: [:create]
  namespace :admin do
    resources :tournament
  end
  #Module :match do
    resources :player, Module: :match
  #end

  resources :match_points  do
    member do 
    end
    collection do 
    end

    get :download_list, on: :member
    get :download_csv, on: :collection
  end
   get 'login', to: "user#login"
   root 'tournaments#dashboard' 
   get ':controller/:action/:id/:user_id'
   get ':controller(/:action(/:id))', controller: /admin\/[^\/]+/
   get 'photos/:id', to: 'photos#show', constraints: { id: /[A-Z]\d{5}/ }
   resources :magazines do
       resources :ads, as: 'periodical_ads'
   end
   get '/stories/:name', to: redirect('/articles/%{name}')
=end
end
