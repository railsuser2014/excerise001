Rails.application.routes.draw do
  
  resources :users, only:[:new, :create,:update, :destroy, :index]
  
  resources :projects, shallow: true do
    get 'search', on: :collection
    resources :posts
    resources :pledges
  end
  
  resources :posts, only: [:edit, :update, :destroy]
  
  resources :posts do  #for allowing user to comment for posts
    resources :comments
  end
  #session login and logout routes
  controller :sessions do
    get  'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  root  :to => "application#index"
end
