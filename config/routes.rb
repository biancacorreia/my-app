Rails.application.routes.draw do
  root "pages#home"
  get "analytics", to: "pages#analytics", as: :analytics
  resources :entries

  get "sign-up", to: "sessions#new_signup", as: :sign_up
  post "sign-up", to: "users#create"
  get "log-in", to: "sessions#new_login", as: :log_in
end
