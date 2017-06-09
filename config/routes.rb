Rails.application.routes.draw do
  resources :myworks
  

  get 'about', to: 'pages#about'

  get 'contact', to: 'pages#contact'

  resources :blogs

  root to: 'pages#home'

end
