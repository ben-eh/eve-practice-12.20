Rails.application.routes.draw do
  resources :ships

  get 'frigates', to: 'ships#frigates', as: :frigates
  # get 'ships/:id', to: 'ships#show', as: :ship.name
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
