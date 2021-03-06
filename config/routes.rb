Rails.application.routes.draw do
 resources :topics, only: [:index, :show]

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  resources :myworks, except: [:show] do
    put :sort, on: :collection
  end

  get 'angular-items', to: 'myworks#angular'

  get 'mywork/:id', to: 'myworks#show', as: 'mywork_show'

 


  resources :contacts, only: [:new, :create]


  resources :blogs do
    member do
      get :toggle_status
    end  
  end    

  mount ActionCable.server => '/cable'
  
  root to: 'pages#home'

end
