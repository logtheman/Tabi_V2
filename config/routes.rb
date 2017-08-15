Rails.application.routes.draw do
  # devise_for :users
	# resources :users
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

  get 'home', to: 'tabi#index'
  root :to => 'tabi#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
