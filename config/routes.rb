Rails.application.routes.draw do

  root 'homes#top'
  
  devise_for :users,
    controllers: {
      sessions: 'users/sessions'
    }

  resources :patterns do
    member do
      resources :movies
    end
  end

  resources :logs

end
