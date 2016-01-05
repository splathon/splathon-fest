Rails.application.routes.draw do
  resources :fests, only: %i(index create show) do
    resources :themes, only: %i(create)
  end
end
