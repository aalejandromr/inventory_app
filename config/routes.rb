Rails.application.routes.draw do
  resources :inventories
  resources :products
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"

  resources :charges

  devise_scope :user do
    get '/sign-in' => "devise/sessions#new", :as => :login
  end
end
