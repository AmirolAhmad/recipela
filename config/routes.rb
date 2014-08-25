Rails.application.routes.draw do
  get 'recipes/index'

  root to: 'greetings#hello'
  get 'about', to: "greetings#about"
  get 'terms', to: "greetings#terms"
  get 'privacy', to: "greetings#privacy"
  get 'cookies', to: "greetings#cookie"
  get 'advertising', to: "greetings#advertising"
  get 'developers', to: "greetings#developers"
  get 'help', to: "greetings#help"
  get 'contact', to: "greetings#contact"

  devise_for :users
  devise_scope :user do
    delete 'sign_out', :to => 'devise/sessions#destroy'
    get "login", to: "devise/sessions#new"
    get "register", to: "devise/registrations#new"
  end

  resources :recipes, only: [:index, :show]
end
