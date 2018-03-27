Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#welcome'

  get '/research', to: 'static_pages#research'
  get '/teaching', to: 'static_pages#teaching'

  get '/workshops', to: 'static_pages#workshops'

  get '/services', to: 'static_pages#services'

  get '/nonacademicstuff', to: 'static_pages#nonacademicstuff'

  get "cv", to: 'static_pages#cv'
end
