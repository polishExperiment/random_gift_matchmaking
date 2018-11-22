Rails.application.routes.draw do
  root 'home#welcome'

  post 'home', action: :index, controller: 'home'
  get 'home', action: :index, controller: 'home', as: :index
  get ':controller/:action/:id'
  get 'logout', action: :logout, controller: 'home'
end
