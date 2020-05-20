Rails.application.routes.draw do
  resources :git_portfolios

  get 'pages/home'

  get 'pages/about'

  get 'pages/contact'
  
  resources :blogs

end
