Rails.application.routes.draw do
 devise_for :users, path: '', path_names: { sign_up: 'signup', sign_in: 'login', sign_out: 'logout'}, :controllers => { omniauth_callbacks: "callbacks"}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_scope :user do
    authenticated do
    
    root to: 'photos#index'
     
    resources :users, only: [:show] do
        resources :photos
      end
    end

    unauthenticated do
      root to: 'devise/sessions#new', as: 'unauthenticated_root'
    end
   end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
