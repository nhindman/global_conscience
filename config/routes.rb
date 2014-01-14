GlobalConscience::Application.routes.draw do

  resources :home

  devise_for :users

  root :to => "home#index"

end
