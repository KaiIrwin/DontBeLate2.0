Rails.application.routes.draw do
  root to:'home#index'
  
  get '/deal_input', to:'dealinput#new'
  post '/deal_input', to:'regestration#create'

  get '/sign_up', to:'registration#new'
  post '/sign_up', to:'registration#create'

  get '/sign_in', to:'registration#new'
  post '/sign_in', to:'registration#create'

  delete '/logout', to:'registration#create'

  get '/result', to:'result#new'
end
