Rails.application.routes.draw do
    resources :emergencies, only: [:new, :edit, :destroy]
end
