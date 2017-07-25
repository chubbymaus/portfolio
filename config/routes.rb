Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  resources :myworks, except: [:show]

  get 'angular-items', to: 'myworks#angular'

  get 'mywork/:id', to: 'myworks#show', as: 'mywork_show'

  get 'about', to: 'pages#about'

  get 'contact', to: 'pages#contact'

  resources :blogs do
    member do
      get :toggle_status
    end  
  end    

  root to: 'pages#home'

end
