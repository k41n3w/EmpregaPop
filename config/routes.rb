Rails.application.routes.draw do
  root 'home#index'
  devise_for :users

  resources :portfolios, except: :new do
    resources :tags, only: %i[create destroy], param: :tag_id, controller: :portfolio_tags
    resources :blocks, only: %i[index create destroy]
  end

  resources :tags, only: :index
end
