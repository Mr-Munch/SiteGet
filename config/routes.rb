Rails.application.routes.draw do
  #get 'relationships/create'
  #get 'relationships/destroy'

  	devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  	root 'home#top'


  	resources :users, only: [:edit, :update, :index, :show] do
      resource :relationships, only: [:create, :destroy]
        get :follows, on: :member
        get :followers, on: :member
    end

  	resources :sites, only: [:index, :show] do
		resources :post_images, only: [:create, :show, :destroy, :update] do
			resource :favorites, only: [:create, :destroy]
			resource :post_comments, only: [:create, :destroy]
		end
  	end

end
