RideologyApp::Application.routes.draw do
  resources :users, :only => [:create, :new, :show]
  resource :session, :only => [:create, :new, :destroy]
  root :to => "StaticPages#index"
  namespace :api do
    resources :ride_offers, :default => {:format => :json}
    resources :ride_takes, :only => [:create, :destroy]
  end
end
