

SisEnsb::Application.routes.draw do
  get "registrations/new"

  get "registrations/create"

  get "registrations/update"

  devise_for :federal_users
  devise_for :users


  get "report/index"
  get "report/show"
  get "report/new"
  get "report/delete"



  resources :formularios

  root :to => 'formularios#index'


  end



