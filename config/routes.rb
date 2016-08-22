Rails.application.routes.draw do
  resources :uploaded_files, except: :show
  root 'uploaded_files#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
