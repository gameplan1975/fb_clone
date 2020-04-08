Rails.application.routes.draw do
 get "/" => "homes#top"  
 get "/homes/help" => "homes#help"
 resources :users
 resources :blogs do
    collection do
      post :confirm
    end
  end
end
