Rails.application.routes.draw do
  get 'home/about' => 'home#about', as: 'about'
  root "home#top"
  devise_for :users

  resources :books, only: [:new, :create, :index, :show, :edit, :update] do
  	resources :book_comments, only: [:create, :destroy]
  	resource :favorites, only: [:create, :destroy]
  end
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
  resources :users, only: [:show, :index, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
