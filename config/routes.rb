Rails.application.routes.draw do
  resources :locations
  resources :courses
  resources :chats
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
    get 'locations/course/:course_id' => 'locations#show_for_course', :defaults => {:format => 'json'}
    get 'courses/search/:query' => 'courses#search', :defaults => {:format => 'json'}
    get 'locations/search/:query/:course_id' => 'locations#search', :defaults => {:format => 'json'}
    get 'chats/course/:course_id/location/:location_id' => 'chats#get_by_course_and_location', :defaults => {:format => 'json'}
  end
end
