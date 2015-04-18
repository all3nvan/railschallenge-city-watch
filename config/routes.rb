Rails.application.routes.draw do
    resources :emergencies
    
    #match '/404', to: 'emergencies#new', via: get
end
