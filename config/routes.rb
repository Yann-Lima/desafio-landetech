Rails.application.routes.draw do
  resources :recruiters, only: [:create, :index, :show, :update, :destroy]
  resources :jobs, only: [:create, :index, :show, :update, :destroy]
  resources :submissions, only: [:create, :index, :show, :update, :destroy]
  resources :recruiters

  post 'login', to: 'sessions#create'

  # Rotas para listagem de vagas ativas e busca de vagas
  get 'jobs/active', to: 'jobs#active'
  get 'jobs/search', to: 'jobs#search'
  get 'jobs/:id', to: 'jobs#show'
  post 'submissions', to: 'submissions#create'
end
