Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :pdfs
  resources :videos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#welcome'

  get '/research', to: 'static_pages#research'
  get '/teaching', to: 'static_pages#teaching'

  get '/workshops', to: 'static_pages#workshops'

  get '/services', to: 'static_pages#services'

  get '/testarea', to: 'static_pages#testarea'

  get '/nonacademicstuff', to: 'static_pages#nonacademicstuff'

  get "/getpdf/:url", to: 'pdfs#getpdf', as: 'getpdf'

  get "/getvideo/:url", to: 'pdfs#getvideo', as: 'getvideo'

  get "/searchpdfs", to: 'pdfs#searchpdfs', as: 'searchpdfs'

  get "/index2", to: 'pdfs#index2', as: 'index2'

  #get "/:url", to: 'posts#show'

end
