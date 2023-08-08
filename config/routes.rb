Rails.application.routes.draw do

  namespace :customer do
    get 'shops/show'
  end
  namespace :admin do
    get 'favorite_shops/index'
  end
  namespace :admin do
    get 'what_you_wants/index'
  end
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "customer/registrations",
  sessions: 'customer/sessions'
  }

  devise_for :shops,skip: [:passwords], controllers: {
  registrations: "shop/registrations",
  sessions: 'shop/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  scope module: :customer do
    root to: 'homes#top'
    get 'about' => 'homes#about', as: 'about'

    get 'customer_inquiry_confirmation' => 'customer_inquiries#inquiry_confirmation'
    resources :customer_inquiries, only: [:new, :index, :create, :show, :update]

    resources :customer_inquiry_threads, only: [:create]

    resources :customer_shops, only: [:show]

    get 'items_per_shop/:id' => 'items#items_per_shop', as: 'items_per_shop'
    resources :items, only: [:index, :show] do
      get 'item_reviews' => 'reviews#item_reviews'
      resources :reviews, only: [:new, :index, :edit, :create, :update, :destroy]
    end

    resources :reviews, only: [:index]

    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items, only: [:index, :create, :show, :update ,:destroy]

    post 'orders/comfirm' => 'orders#comfirm'
    get 'orders/complete' => 'orders#complete'
    resources :orders, only: [:new, :index, :create, :show]

    resources :addresses, only: [:new, :index, :edit, :create, :update, :destroy]

    get 'customers/my_page' => 'customers#show'
    get 'customers/information/edit' => 'customers#edit'
    patch 'customers/information' => 'customers#update'
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw'

    resources :what_you_wants, only: [:index, :create, :destroy]

    patch 'favorite_shops_receive/:id' => 'favorite_shops#receive', as: 'favorite_shop_receive'
    patch 'favorite_shops_unlock/:id' => 'favorite_shops#unlock', as: 'favorite_shop_unlock'
    resources :favorite_shops, only: [:index, :create, :destroy]

  end

  scope module: :shop do
    get 'shop' => 'homes#top'
    get 'shop/about' => 'homes#about', as: 'shop/about'
  end

  namespace :shop do
    resources :customer_inquiries, only: [:index]

    resources :customer_inquiry_threads, only: [:create]

    get 'shop_inquiry_confirmation' => 'shop_inquiries#inquiry_confirmation'
    resources :shop_inquiries, only: [:new, :index, :create, :update]

    resources :shop_inquiry_threads, only: [:create]

    get 'inquiries_selection' => 'shops#inquiry'
    get 'my_page' => 'shops#show'
    get 'my_page/information/edit' => 'shops#edit'
    patch 'my_page/information' => 'shops#update'
    get 'shop_page/new' => 'shops#shop_page_new'
    get 'shop_page' => 'shops#shop_page'
    get 'shop_page/information/edit' => 'shops#shop_page_edit'
    patch 'shop_page/information' => 'shops#shop_page_update'
    get 'unsubscribe' => 'shops#unsubscribe'
    patch 'withdraw' => 'shops#withdraw'

    resources :items, only: [:new, :index, :edit, :create, :show, :update] do
      resources :reviews, only: [:index]
    end

    resources :orders, only: [:index, :show, :update]

    resources :order_details, only: [:update]

    resources :favorite_shops, only: [:index]

  end


  scope module: :admin do
    get 'admin' => 'homes#top'
  end

  namespace :admin do

    resources :shop_inquiries, only: [:index]

    resources :shop_inquiry_threads, only: [:create]

    resources :customers, only: [:index, :edit, :show, :update]

    resources :shops, only: [:index, :edit, :show, :update] do
      get 'shop_page' => 'shops#shop_page'
      get 'shop_page/information/edit' => 'shops#shop_page_edit'
      patch 'shop_page/information' => 'shops#shop_page_update'
    end

    get 'items_per_shop/:id' => 'items#items_per_shop', as: 'items_per_shop'
    resources :items, only: [:index, :edit, :show, :update] do
      resources :reviews, only: [:index, :edit, :update, :destroy]
    end

    get 'genre_selection' => 'genres#genre_selection'
    resources :item_genres, only: [:index, :edit, :create, :update]

    resources :shop_genres, only: [:index, :edit, :create, :update]

    resources :orders, only: [:index, :show]

    resources :what_you_wants, only: [:index, :destroy]

    resources :favorite_shops, only: [:index, :update, :destroy]

  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
