Rails.application.routes.draw do
  resources :users, only:[:create, :destroy, :index, :show, :update]
  resources :contacts, only:[:create, :destroy, :index, :show, :update]
  resources :contact_shares, only:[:create, :destroy, :index, :show, :update]
  # get 'users' => 'users#index'
  # post 'users/' => 'users#create'
  # patch 'users/:id' => 'users#update'
  # put 'users/:id' => 'users#update'
  # get 'users/:id' => 'users#show'
  # delete 'users/:id' => 'users#destroy'
  # get 'users/new' => 'users#new', :as => 'new_user'
  # get 'users/:id/edit' => 'users#edit'
end
