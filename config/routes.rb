Rails.application.routes.draw do
  root to: "message_templates#index"
  resources :messages
  resources :message_templates
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
