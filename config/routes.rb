Rails.application.routes.draw do


  namespace :admin do
    get 'dashboard/show', to: 'dashboard#show', as: 'dashboard'
    get 'dashboard/index', to: 'dashboard#index', as: 'dashboard_index'

    get 'sms/index', to: 'sms#index', as: 'load_sms_form'
    get 'sms/send', to: 'sms#send', as: 'send_sms'

  end

  namespace :admin do
    resources :users
  end

  get 'custom/send_message', to: 'custom#send_message', as: 'send_message'

  get 'users/index'
  get 'home/index'
  get '/login', to: 'home#login', as: 'login'
  get '/register', to: 'home#register', as: 'register'
  get '/profile', to: 'home#profile', as: 'profile'


  #devise_for :users 
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: "users/registrations"

  }

  devise_scope :user do
    # get '/users/sign_out' => 'devise/sessions#destroy'
    authenticated :user do
      root 'home#index', as: :user_root
    end

    unauthenticated do
      root 'users/sessions#new', as: :unauthenticated_root
    end
  end

  scope module: 'admin', path: 'fu', as: 'cool' do
    resources :users
  end

  get 'user/index/:id', to: 'user#index', as: :user

end
