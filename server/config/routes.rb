Rails.application.routes.draw do
  # devise_for :users
  namespace :api do
    namespace :v1 do
      namespace :user1 do
        resources :users
        get '/edit', to: 'users#edit'
        get '/signup', to: 'users#new'
        post '/signup', to: 'users#create'

        # sessions controller
        get '/login', to: 'sessions#new'
        post '/login', to: 'sessions#create'
        delete '/logout', to: 'sessions#destroy'

        # account activation controller
        resource :account_activations, only: %i[edit]

        resources :posts
        get '/posts/new', to: 'posts#new'
        get '/posts/edit', to: 'posts#edit'

        resource :password_resets, only: %i[new create edit update]

        resources :users do
          member do
            get :following, :followers
          end
        end

        resource :relationships, only: [:create, :destroy]

        resources :posts do
          resources :comments
        end
      
        resources :comments do
          resources :comments
        end

        resources :posts do
          resources :votes #, only: [:upvote, :downvote]
        end

        resources :comments do
          resources :votes #, only: [:upvote, :downvote]
        end
      end
    end
  end
end
