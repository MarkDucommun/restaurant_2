Rails.application.routes.draw do
  # get 'restaurants/index'

  # get 'restaurants/show'

  # get 'restaurants/new'

  # get 'restaurants/create'

  # get 'restaurants/edit'

  # get 'restaurants/update'

  # get 'restaurants/destroy'

  resources :restaurants
  resources :articles

  root to: 'restaurants#index'
end
