Rails.application.routes.draw do
  resources :fests, only: %i(index create show) do
    resource :fest_kickoff, path: 'kickoff', only: %i(create)
    resources :themes, only: %i(create) do
      resource :theme_publication, path: 'publication', only: %i(create)
      resource :theme_fixing, path: 'fixing', only: %i(create)
    end
    resource :playing, path: 'play', only: %i(show) do
      resource :player_signup, path: 'signup', only: %i(show create)
    end
  end

  mount ActionCable.server => '/cable'
end
