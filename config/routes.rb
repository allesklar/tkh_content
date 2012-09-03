Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    resources :pages do
      member do
        post :publish
        post :unpublish
        post :toggle_for_blog
      end
    end
    resources :comments do
      collection do
        get :pending
        get :accepted
        get :blocked
      end
      member do
        post :accept
        post :block
      end
    end
    match 'blog' => 'blog#index'
  end
end