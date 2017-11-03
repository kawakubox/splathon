Rails.application.routes.draw do
  resources :events do
    resources :qualifiers do
      member do
        get :matches
      end
    end

    member do
      get :top
    end
  end

  resources :matches, only: :index do
    member do
      post :win
      post :draw
      post :lose
    end
  end

  resources :teams
  resources :qualifiers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
