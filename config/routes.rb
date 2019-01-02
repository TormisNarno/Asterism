Rails.application.routes.draw do
  get "/register",to:"pages#register"
  get "/login",to:"pages#login"
  get "/home",to:"pages#home"
  post"/register",to:"pages#register_user"
  post"/login",to:"pages#login_check"
  get "/logout",to:"pages#logout"
  
  get 'board/create', to: "pages#thread_create"
  post 'board/create', to: "pages#thread_create_process"

  get 'board/:id', to: "pages#thread"
  post 'board/:id', to: "pages#add_comment"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
