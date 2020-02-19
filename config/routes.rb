Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  get "about", to: "pages#about", as: :about
  
  get "dashboard", to: "users#show", as: :dashboard
  resources :users, except: :show do
    resources :applications, only: [:index, :show, :edit]
  end

  resources :regions, only: [:index, :show] do
    collection do 
      get :vic, to: "regions#vic"
      get :nsw, to: "regions#nsw"
      get :qld, to: "regions#qld"
      get :sa, to: "regions#sa"
      get :nt, to: "regions#nt"
      get :wa, to: "regions#wa"
      get :tas, to: "regions#tas"
      get :act, to: "regions#act"
    end
    resources :venues, only: :index
  end
  
  resources :resources, only: [:index, :show]

  resources :venues, only: [:index, :show] do 
    resources :jobs, only: [:show, :new, :create]
  end
  get "search", to: "venues#search", as: :search

end
