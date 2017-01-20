Rails.application.routes.draw do
  resources :players
  root 'welcome#index'

  get 'welcome/index'

  get 'anonymous', to: 'welcome#anonymous'

  devise_for :user
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
