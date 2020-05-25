Rails.application.routes.draw do
  
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :git_portfolios, except: [:show]
  get 'angular-items', to: 'git_portfolios#angular'
  get 'git_portfolios/:id', to: 'git_portfolios#show', as: 'git_portfolio_show'
  
  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs do 
    member do 
      get :toggle_status
    end
  end

  root to: 'pages#home'

end
