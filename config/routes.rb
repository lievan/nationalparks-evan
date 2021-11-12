Rails.application.routes.draw do
  get '/search' => 'search#index', :as => 'search'
  get '/park' => 'search#park', :as => 'park'
  get '/image' => 'search#image', :as => 'image'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
