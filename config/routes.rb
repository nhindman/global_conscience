GlobalConscience::Application.routes.draw do

  devise_for :users

  get 'home/index' => 'home#index'

  get 'country/display/' => 'country#display'

  root :to => "home#index"

end
