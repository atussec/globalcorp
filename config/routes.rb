Rails.application.routes.draw do
  resources :jobs do
    member do
      get 'start'
    end
  end
  resources :job_boards do
    collection do
      get 'random'
    end
  end
  resources :players do
    member do
      get 'finish'
    end
  end
  root 'welcome#index'
  get 'welcome/index'
  get 'anonymous', to: 'welcome#anonymous'
  get '/.well-known/acme-challenge/:id' => 'welcome#letsencrypt'
  devise_for :user
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
