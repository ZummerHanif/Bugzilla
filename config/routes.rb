Rails.application.routes.draw do

  root 'projects#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',

  }


  resources :projects do
    resources :bugs do
      member do
        post 'assign'
      end
    end
    member do
      post 'add_user'
      delete 'remove_user'
    end
  end




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
