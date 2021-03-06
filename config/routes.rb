

Rails.application.routes.draw do



  get '/generated',to:'users#generated'

  get 'password_resets/new'

  get 'password_resets/edit'

  get 'users/compile'
  post 'users/compile'
  post 'users/upload'
  get '/download_file',to:'users#download_file'


  root 'static_pages#home'

  get '/help' ,to: 'static_pages#help'
  get '/about',to: 'static_pages#about'
  get '/contact',to: 'static_pages#contact'
  get '/signup',to: 'users#new'
  get  '/activation',to: 'sessions#new'
  post '/login',to: 'sessions#create'
  delete '/logout',to: 'sessions#destroy'

  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,  only: [:new, :create, :edit, :update]




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
