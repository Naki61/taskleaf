Rails.application.routes.draw do
  root to: 'tasks#index'
  resources :tasks #全てのアクションに関するルーティングを一括で設定してくれる
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
