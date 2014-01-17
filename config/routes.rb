GlobalConscience::Application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  get 'home/index' => 'home#index'

  get 'country/display/' => 'country#display'

  get 'country/tweet/' => 'country#tweet'

  post 'posts/create' => 'posts#create'

  get 'posts/edit' => 'posts#create'

  get 'posts/delete' => 'posts#delete'
  
  root :to => "home#index"

  devise_scope :user do
    get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end
  
end
