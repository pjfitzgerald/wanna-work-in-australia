Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  get "about", to: "pages#about", as: :about
  
  get "dashboard", to: "users#show", as: :dashboard
  resources :users, except: :show do
    resources :applications, only: [:index, :show]
  end

  resources :regions do
    collection do 
      get :vic, to: "regions#vic"
      get :nsw
      get :qld
      get :sa
      get :nt
      get :wa
      get :tas
      get :act
    end
  end
  
  resources :resources, only: [:index, :show]

  resources :venues, only: [:index, :show] do 
    resources :jobs, only: [:index, :show, :new, :create]
  end
  get "search", to: "venues#search", as: :venue_search

end
