Rails.application.routes.draw do

  root 'homes#top'
  
  devise_for :users,
    controllers: {
      sessions: 'users/sessions'
    }

  # get 'movies/selected_patterns'
  # get 'movies/index'
  # get 'movies/new'
  # get 'movies/edit'

  # resources :patterns do
  #   member do
  #     get 'movies/next_movies'
  #     resources :movies, except: %i(index new edit)
  #   end
  # end

  resources :patterns

  get 'movies/selected_patterns', as: :selected_patterns
  get 'movies/next_movies', as: :next_movies
  resources :movies


  resources :logs

end
