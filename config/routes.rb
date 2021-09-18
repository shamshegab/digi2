Rails.application.routes.draw do
  resources :cases
  resources :referring_doctors
  resources :patients
  resources :items
  get 'users/index'
  post 'users/create'
  root 'cases#index'
  resources :user_roles
  resources :items
  resources :reports
  devise_for :users
  get 'user/:id', to: "users#toggle_activation", as: "toggle_activation"
  get 'items/activated_items', to: 'items#activated_items'
  post 'case/:id/end', to:'cases#end_case', as: "end_case"
  post 'case/:id/report', to:'cases#report_case', as: "reported_case"
  post 'case/:id/contact', to:'cases#contact_case', as: "contacted_case"
  put 'case/:id/items', to: 'cases#update_items', as: "update_case_items"
  put 'case/:id', to: 'cases#update', as: "update_case"


  get 'generate_reports', to: 'reports#generate_reports', as: "g_reports"
  get 'reports/result', to: 'reports#result', as: "reports_result"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
