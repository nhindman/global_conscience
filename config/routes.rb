GlobalConscience::Application.routes.draw do

  devise_for :users

  get 'home/index' => 'home#index'

  get 'country/display/' => 'country#display'

  get 'country/tweet/' => 'country#tweet'
  
  root :to => "home#index"

end
