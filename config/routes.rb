Rails.application.routes.draw do
  resources :products

  root 'products#index'
  post '/import', to: 'products#import', as: 'import_products'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
