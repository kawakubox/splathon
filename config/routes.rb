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

  resources :matches, only: %i[index edit update]do
    member do
      post :win
      post :draw
      post :lose
    end
  end

  resources :qualifiers do
    member do
      post :redraw
    end
  end

  resources :teams
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
