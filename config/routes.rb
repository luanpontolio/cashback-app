Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/admin', to: 'admin/offers#index'
  namespace :admin do
    resources :offers do
      get ':id/state/:state', to: 'offers#state', :on => :collection
    end
  end
end
