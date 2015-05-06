Rails.application.routes.draw do
  resources :locations
  resources :courses
	devise_for :users, :controllers => { registrations: 'registrations' , 
																			 omniauth_callbacks: 'omniauth_callbacks' }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root to: "main#index"
  resources :messages	
  get 'find' => 'find#index'
  get 'find/:course_id' => 'find#show', :as => 'show_course'
  get 'find/:course_id/:location_id' => 'find#chat', :as => 'show_chat'
  get 'chat' => 'chat#index'
  get 'chat/buddy_poll/:chat_id' => 'chat#buddy_poll', :as => 'poll_buddy_list'
  delete 'chat/remove_from_chat/:chat_id' => 'chat#remove_from_chat', :as => 'remove_from_chat'
  get 'home/get_buildings_for_course/:course_id' => 'home#get_buildings_for_course', :as => 'get_buildings_for_course'
  get 'home/get_chatroom/:course_id/:location_id' => 'home#get_chatroom', :as => 'get_chatroom'

  scope "api" do
    resources :courses, :defaults => {:format => 'json'}
    resources :locations, :defaults => {:format => 'json'}
  end

  @API
  get 'courses' => 'home#index'
  get 'locations/:course_id' => 'home#get_buildings_for_course'
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

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
