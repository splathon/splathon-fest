Rails.application.routes.draw do
  resources :fests, only: %i(index create)
end
