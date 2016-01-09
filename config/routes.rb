Rails.application.routes.draw do
  resources :fests, only: %i(index create show) do
    resources :themes, only: %i(create)
    resource :fest_kickoff, path: 'kickoff', only: %i(create)
    resource :playing, path: 'play', only: %i(show) do
      resource :player_signup, path: 'signup', only: %i(show create)
    end
  end
end
