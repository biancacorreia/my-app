Rails.application.routes.draw do
  root "pages#home"
  get "analytics", to: "pages#analytics", as: :analytics
  resources :entries
end
