Rails.application.routes.draw do
  devise_for :customers,skip:[:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin,skip:[:registrations,:passwords], controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
    resources :orders,only:[:show,:update]
    resources :order_details,only:[:update]
    resources :customers,only:[:index,:show,:edit,:update]
    resources :genres,only:[:index,:edit,:create,:update]
    resources :items,only:[:index,:new,:show,:edit,:create,:update]
    root "homes#top"
  end

  scope module: :public do
    get "/customers" => "customers#show"
    get "/customers/information/edit" => "customers#edit"
    patch "/customers/information" => "customers#update"
    root "homes#top"
    get "/about" => "homes#about",as: "about"
    post 'orders/confirm' => "orders#confirm"
    get 'orders/complete'
    get 'customers/confirmation'
    patch 'customers/withdraw' => "customers#withdraw"
    delete 'cart_items/destroy_all'
    resources :addresses,only:[:index,:edit,:create,:update,:destroy]
    resources :orders,only:[:new,:index,:show,:create]
    resources :cart_items,only:[:index,:update,:destroy,:create]
    resources :items,only:[:index,:show]
  end

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
