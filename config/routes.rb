Support::Application.routes.draw do

  get "administrator/index"

  devise_for :contributors, :controllers => { :sessions => "contributors/sessions" }
  namespace :contributors do
    resources :dashboard
    resources :applications do
      member do
        post :administrator
        get :new_administrator
      end
      resources :articles
      resources :videos
      resources :categories
    end
  end

  root :to => 'pages#index'
  resources :pages



   devise_for :admins, :controllers => { :sessions => "admins/sessions" }
   namespace :admins do
    resources :dashboard
    resources :applications
    resources :contributors do
      collection do
        get :auto
      end
    end
   end



  devise_for :users
  resources :articles
  resources :videos
  resources :categories

end
