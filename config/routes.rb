Rails.application.routes.draw do
  devise_for :users
  root 'tweets#index'
  resources :tweets                     #tweets_controllerに対してのresourcesメソッド
  resources :users, only: [:show] 
end
