Spree::Core::Engine.routes.draw do

  namespace :api, :defaults => { :format => 'json' } do
    resources :notifications do
      collection do
        post 'on'
        post 'off'
        get 'unread_count'
        get 'status'
      end
      member do
        post 'read'
        post 'delete'
      end
    end
  end  
end
