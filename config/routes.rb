Rails.application.routes.draw do

  root 'homes#top'
  
  devise_for :users,
    controllers: {
      sessions: 'users/sessions'
    }

end
