Rails.application.routes.draw do
  # devise_for :users
  namespace :api do
    namespace :v1 do
      namespace :user1 do
        resources :users
        resources :users, only: %i[create update] do
          collection do
            get 'email_update'
          end
        end
        # get '/email_update', to: 'users#email_update'
        get 'confirm', to: 'users#confirm'
        post 'password/forgot', to: 'password#forgot'
        get 'password/reset', to: 'password#reset'
        put 'password/update', to: 'password#update'

        get '/edit', to: 'users#edit'
        get '/signup', to: 'users#new'
        post '/signup', to: 'users#create'

        # sessions controller
        get '/login', to: 'sessions#new'
        post '/login', to: 'sessions#create'
        delete '/logout', to: 'sessions#destroy'

        get '/my_favourites', to: 'favourites#my_favourites'

        resources :posts
        get '/posts/new', to: 'posts#new'
        get '/posts/edit', to: 'posts#edit'
        get '/posts', to: 'posts#index'
        get '/feed', to: 'posts#feed'
        get '/top', to: 'posts#top'
        get '/search', to: 'posts#search'

        resources :users do
          member do
            get :following, :followers
          end
        end


        resource :relationships, only: %i[create destroy]

        resources :posts do
          resources :comments
        end

        resources :comments do
          resources :comments
        end

        resources :posts do
          resources :votes, only: %i[destroy]
          post 'votes/upvote', to: 'votes#upvote'
          post 'votes/downvote', to: 'votes#downvote'
        end

        resources :comments do
          resources :votes, only: %i[destroy]
          post 'votes/upvote', to: 'votes#upvote'
          post 'votes/downvote', to: 'votes#downvote'
        end

        resources :tags, only: %i[index create destroy show]

        resources :posts do
          resources :favourites, only: %i[create index destroy]
        end

        resources :notifications, only: [:index]
      end
    end
  end
end
