Rails.application.routes.draw do
  root 'home#top'
  get 'home/about' => 'home#about'
  devise_for :users

  devise_scope :user do
  	get 'users/:id' => 'users#show', as: 'user'
  end
  resources :books, only: [:index, :create, :show, :edit, :update, :destroy]
  resources :users, only: [:index, :show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
