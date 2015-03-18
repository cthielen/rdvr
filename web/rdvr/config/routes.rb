Rails.application.routes.draw do
  resources :recordings

  resources :shows

  root 'recordings#index'
end
