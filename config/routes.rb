Rails.application.routes.draw do
  resources :events do
    member do
      get :top
    end
  end
  resources :teams
  resources :qualifiers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
