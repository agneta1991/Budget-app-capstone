Rails.application.routes.draw do
  devise_for :users

  resources :groups, only: %i[index new create destroy] do
    resources :entities, only: %i[index new create destroy]
  end

  root to: 'users#index'
end
