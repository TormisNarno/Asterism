Rails.application.routes.draw do

  get '/', to: "pages#top"
  
  get '/register', to: "pages#register"
  post '/register', to: "pages#register_user"
  
  get 'login', to: "pages#login"
  post 'login', to: "pages#login_check"
  
  get 'logout', to: "pages#logout"
  
  get 'board/create', to: "pages#thread_create"
  post 'board/create', to: "pages#thread_create_process"

  get 'board/:id', to: "pages#thread"
  post 'board/:id', to: "pages#add_comment"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
