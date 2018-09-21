Rails.application.routes.draw do


  namespace :admin do
    get 'payment/stripe', to: 'payment#stripe', as: 'stripe'
    get 'payment/paypal', to: 'payment#paypal', as: 'paypal'
    get 'payment/braintree', to: 'payment#braintree', as: 'braintree'
  end

  namespace :admin do
    resources :users
    get 'dashboard/show', to: 'dashboard#show', as: 'dashboard'
    get 'dashboard/index', to: 'dashboard#index', as: 'dashboard_index'
    get 'sms/index', to: 'sms#index', as: 'load_sms_form'
    get 'sms/send', to: 'sms#send'
  end


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

  get '/twilio/send_message', to: 'twilio#send_message', as: 'twilio_sms'

  get 'user/index/:id', to: 'user#index', as: :user

end
