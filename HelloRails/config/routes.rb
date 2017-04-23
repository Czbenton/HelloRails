Rails.application.routes.draw do
  get 'schools/index'
root 'schools#index'
  resources :schools do
    resources :students
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
