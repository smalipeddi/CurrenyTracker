Rails.application.routes.draw do 
   
  root to: 'visitors#index'
  devise_for :users
  resources :users
 
    resources :user_countries, :except => [:new, :destroy] 
    resources :user_currencies , :except => [:new, :destroy]
      
    
    get '/update_visited' => "user_countries#update_visited"
    get '/filter_countries' => "user_countries#filter_countries"
    
    get '/filter_currencies' => "user_currencies#filter_currencies" 
    get '/update_collected' => "user_currencies#update_collected"     
 
end
