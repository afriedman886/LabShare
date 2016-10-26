Rails.application.routes.draw do

  resources :proposals do
    resources :experiments
  end

  root to: "application#index"

end
