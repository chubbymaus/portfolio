Rails.application.routes.draw do
  resources :myworks, except: [:show]

  get 'mywork/:id', to: 'myworks#show', as: 'mywork_show'

  get 'about', to: 'pages#about'

  get 'contact', to: 'pages#contact'

  resources :blogs

  root to: 'pages#home'

end
