Rails.application.routes.draw do
  root 'home#index'

  get 'home', action: :index, controller: 'home'
end
