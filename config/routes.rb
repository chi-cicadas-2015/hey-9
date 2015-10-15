Rails.application.routes.draw do

  get "/" => 'home#index'
  post "/send_text_message" =>"text_messages#send_text_message"

  get "/users/check_messages" => "users#check_messages"

  resources :sessions, only: [:new, :create, :destroy]

  # concern :commentable do
  #   resources :comments
  # end

  resources :users, except: :delete do
    resources :dogs, only: [:index, :create, :delete]
  end

  resources :messages, only: [:new, :create, :show, :index] do
    resources :comments, module: :messages
    # resources :commentable, only: [:create]
  end

  resources :direct_conversations, only: [:index, :show, :new, :create] do
    resources :private_messages, only: [:create]
  end

  resources :dogs, except: [:create, :edit, :delete] do
    resources :dog_connections, only: [:new, :create, :delete]
  end

  resources :events do
    resources :comments, module: :events
    # resources :commentable, only: [:create]
  end

  resources :maps


  # concern :commentable do
  #   resources :comments, shallow: true, except: [:show, :index]
  # end

  # concern :messageable do
  #   resources :messages
  # end

  # resources :users do
  #   resources :dogs, :neighborhoods
  #   resources :messages, concerns: :commentable
  #   resources :direct_conversations, concerns: :messageable

  #   resources :dogs, shallow: true do
  #     resources :events, concerns: :commentable
  #     resources :dog_connections, :event_invitations
  #   end

  # end

  # resources :message_board, concerns: :messageable



  # get 'users/new' => 'users#new'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"


  # root 'home#index'


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  get '/users' => 'user#index'
  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
 # resources :users
  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
