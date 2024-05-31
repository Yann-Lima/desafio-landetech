Rails.application.routes.draw do
  # Rota de autenticação
  post 'login', to: 'authentication#login'

  namespace :recruiters do
    resources :jobs
  end

  namespace :public do
    resources :jobs, only: [:index, :show] do
      resources :submissions, only: [:create]
    end
  end

  # Rota raiz que retorna um JSON simples
  root to: proc { [200, { 'Content-Type' => 'application/json' }, [{ message: 'Bem-vindo à API da minha aplicação!' }.to_json]] }
end
