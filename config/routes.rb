Rails.application.routes.draw do
 get "/" => "homes#top"  
 get "/homes/help" => "homes#help"
end
