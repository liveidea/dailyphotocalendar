Dailyphoto::Application.routes.draw do
  scope '(:locale)' do

    resources :categories
    get "photos/liked", to: "photos#favorite", :as => :liked_photos
    get "photos/random", to: "photos#random", :as => :random_photos
    resources :photos do
      member do
        post :like
      end
    end

    root :to => "photos#index"

    devise_for :users, :controllers => {:registrations => "registrations"}
    resources :users
  end
end
