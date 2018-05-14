Rails.application.routes.draw do
  root 'users#index'
  devise_for :users, :controllers => { :registrations => :registrations }
  get '/users/me'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
end
