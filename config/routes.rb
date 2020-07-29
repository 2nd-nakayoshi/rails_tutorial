Rails.application.routes.draw do
  # get 'users/index'
  # get 'users/new'
  # get 'users/create'
  # get 'users/show'
  # get 'users/edit'
  # get 'users/update'
  # get 'users/destroy'
  
  # get 'blogs/index'
  # get 'blogs/new'
  # get 'blogs/create'
  # get 'blogs/show'
  # get 'blogs/edit'
  # get 'blogs/update'
  # get 'blogs/destroy'

  resources :blogs
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
