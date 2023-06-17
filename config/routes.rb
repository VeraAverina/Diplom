Rails.application.routes.draw do
  #get 'testexecstep/new'
  #get 'testexecstep/create'
  #get 'testexecstep/update'
  #get 'testexecstep/edit'
  #get 'testexecstep/destroy'
  #get 'testexecstep/index'
  #get 'testexecstep/show'
  #get 'testexec/new'
  #get 'testexec/create'
  #get 'testexec/update'
  #get 'testexec/edit'
  #get 'testexec/destroy'
  #get 'testexec/index'
  #get 'testexec/show'
  #get 'itemtest/new'
  #get 'itemtest/create'
  #get 'itemtest/update'
  #get 'itemtest/edit'
  #get 'itemtest/destroy'
  #get 'itemtest/index'
  #get 'itemtest/show'
  #get 'responseright/view'
  #devise_for :user, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {registrations: 'users/registrations'}

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "main#index"
  resources :webtests do
    resources :roles do
      resources :webtasks
      resources :refers
    end
  end
  resources :testexecs
  resources :testexecsteps do
    put 'nexttime', to: 'testexecsteps#nexttime'
  end
  
  resources :refers
  resources :resultfiles
  resources :main
  get 'profile'=> 'profile#index'

  #resources :resultfiles, only: [:index, :new, :create, :destroy]
  #root "resultfiles#index"
end
