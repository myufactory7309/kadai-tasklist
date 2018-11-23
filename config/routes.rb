Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #普通にいったん書いてみる
  #get 'tasks/:id', to: 'tasks#show'
  #post 'tasks/', to: 'tasks#create'
  #put 'tasks/:id', to: 'taksks#update'
  #delete 'tasks/:id', to: 'tasks#destroy'
  
  # index: show の補助ページ
  #get 'tasks', to: 'tasks#show'
  
  # new: 新規作成用のフォームページ
  #get 'tasks/new', to: 'tasks#new'
  
   # edit: 更新用のフォームページ
   #get 'tasks/:id/edit' to: 'tasks#edit'
   
   root to: 'tasks#index'
   resources :tasks
  
end
