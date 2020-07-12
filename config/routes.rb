Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/admin', to: 'admin/offers#index'
  namespace :admin do
    resources :offers do
      get '/:id/enabled', to: 'offers#enabled', on: :collection
      get '/:id/disabled', to: 'offers#disabled', on: :collection
    end
  end
end
