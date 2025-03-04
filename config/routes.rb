Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks"}
  resources :users, :only => [:create]
  get "/dashboard" => "users#index"
  resources :jobs, only: [:new,:create,:show] do
  	resources :applicants, only: [:new,:create,:index]
  end
  get "/approve/jobs/:job_id/applicants/:applicant_id" => "approval#index", as: :approval
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "public#homepage"
end
