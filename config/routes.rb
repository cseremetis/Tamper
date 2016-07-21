Rails.application.routes.draw do
  
  resources :games, :players 
  
  root 'games#index'
  
  post '/games/:id' => 'games#simulator'
end
