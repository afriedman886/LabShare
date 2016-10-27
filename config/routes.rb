Rails.application.routes.draw do
  root to: "proposals#homeindex"

  resources :users, except: [:edit, :destroy, :update, :index, :show]
  resources :sessions, only: [:new, :create, :destroy]

  resources :proposals do
    resources :experiments
  end

  resources :comments

end
