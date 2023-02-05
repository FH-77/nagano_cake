Rails.application.routes.draw do
  namespace :admin do
    resources :orders,only:[:show,:update]
    resources :order_details,only:[:update]
    resources :customers,only:[:index,:show,:edit,:update]
    resources :genres,only:[:index,:edit,:create,:update]
    resources :items,only:[:index,:new,:show,:edit,:create,:update]
    root "homes#top"
  end
 
  scope module: :public do
    resources :addresses,only:[:index,:edit,:create,:update,:destroy]
    resources :orders,only:[:new,:index,:show,:create]
    resources :cart_items,only:[:index,:update,:destroy,:create]
    resources :customers,only:[:show,:edit,:update]
    resources :items,only:[:index,:show]
    get "/" => "homes#top"
    get "/about" => "homes#about",as: "about"
    get 'orders/confirm'
    get 'orders/complete'
    get 'customers/confirmation'
    patch 'customers/withdraw'
    delete 'cart_items/destroy_all'
  end
 
 

  devise_for :customers,skip:[:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin,skip:[:registrations,:passwords], controllers: {
  sessions: "admin/sessions"
}

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
