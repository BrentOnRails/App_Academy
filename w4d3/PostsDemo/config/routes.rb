PostsDemo::Application.routes.draw do
  root to: "posts#index"
  resources :posts do
    resources :comments, :only => [:index, :new, :create]
  end
  resources :comments, :except => [:index, :new, :create]
end
