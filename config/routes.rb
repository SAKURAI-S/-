Rails.application.routes.draw do
 devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 root :to => "books#top"
 resources :books, only: [:create, :edit, :index, :show, :destroy, :update]
 #get '@new#book' => '@show#book'
 resources :users
 get 'home/about' => 'home#about', as: "about"
end