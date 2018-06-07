Rails.application.routes.draw do
  root 'users#index'
  devise_for :users, :controllers => { :registrations => :registrations }
  get '/users/me'
  resources :users do
    resources :interviews, :except => :show do
      collection do
        post 'send_request'
      end
    end
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
end
