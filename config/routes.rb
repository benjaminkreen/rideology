RideologyApp::Application.routes.draw do
  resources :users, :only => [:create, :new, :show]
  resource :session, :only => [:create, :new, :destroy]
  root :to => "StaticPages#index"
end
