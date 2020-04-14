Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :lessons
  resource :managers, only: [:new, :create]
  get "admin/login" => "managerlogin#new"
  post "admin/login" => "managerlogin#create"
  delete "admin/login" => "managerlogin#destroy"

  mount V1::Base => '/'
end
