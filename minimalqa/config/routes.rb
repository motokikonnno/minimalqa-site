Rails.application.routes.draw do
  resources :questions do
    resource :favorites, only: [:create, :destroy]
      resources :answers, shallow: true do
        resources :reactions, only: [:new, :create]
      end
    end

  resources :users, only: [:index, :new, :create, :show] do
    get :favorites, on: :collection
  end
  
  resources :sessions, only: [:new, :create, :destroy]
  get 'sessions/:id' => 'sessions#destroy'
  root 'users#home'
end
