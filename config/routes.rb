Rails.application.routes.draw do
  get 'new', to: 'games#new', as: :new
  post 'score', to: 'games#score', as: :score
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/display', to: 'pages#display', as: :display
  # get '/receive', to: 'pages#receive', as: :receive
end
