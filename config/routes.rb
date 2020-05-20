Rails.application.routes.draw do
  
  resources :git_portfolios, except: [:show]
  get 'git_portfolios/:id', to: 'git_portfolios#show', as: 'git_portfolio_show'
  
  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs

  root to: 'pages#home'

end
