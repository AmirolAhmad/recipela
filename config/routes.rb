Rails.application.routes.draw do
  root to: 'greetings#hello'

  devise_for :users
  devise_scope :user do
    delete 'sign_out', :to => 'devise/sessions#destroy'
    get "login", to: "devise/sessions#new"
    get "register", to: "devise/registrations#new"
  end
end
