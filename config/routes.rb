Rails.application.routes.draw do
  concern :match do
    resources :match
  end
  resources :tournament, only: [:show, :index]  do 
    concerns :match
  end

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
end
