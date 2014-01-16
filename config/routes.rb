GlobalConscience::Application.routes.draw do

  devise_for :users

  get 'home/index' => 'home#index'

  get 'country/display/' => 'country#display'

  get 'country/tweets/' => 'country#tweets'
  
  root :to => "home#index"

end
