Rails.application.routes.draw do
  root to:'home#index'
  
  get '/deal_input', to:'dealinput#new'
  post '/deal_input', to:'dealinput#create'

  get '/sign_up', to:'registration#new'
  post '/sign_up', to:'registration#create'

  get '/sign_in', to:'session#new'
  post '/sign_in', to:'session#create'

  delete '/logout', to:'session#create'

  get '/result', to:'result#new'
end
