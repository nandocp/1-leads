Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :leads, only: [:index, :create]
  resources :posts do
  	resources :comentarios
  end
  resources :tags
  get '/leads_report', to: 'leads#report'

  get '/obrigado', to: 'static_pages#landing_page_obrigado'
  get '/landing_page_empresa', to: 'static_pages#landing_page_b2b'
  get 'landing_page_pessoa', to: 'static_pages#landing_page_b2c'

  root 'posts#index'
end