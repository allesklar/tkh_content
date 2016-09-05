Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do

    resources :pages do
      member do
        post :publish
        post :unpublish
        post :toggle_for_blog
      end
      collection do
        get  :published
        get  :drafts
        post :sort
      end
    end
    resources :comments do
      collection do
        get :pending
        get :accepted
        get :blocked
        get :for_feed
      end
      member do
        post :accept
        post :block
      end
    end
    resources :tags
    resources :sidebar_snippets

    get 'blog' => 'blog#index', as: :blog
    get 'blog_by_tag/:id', :to => 'blog#by_tag', :as => 'blog_by_tag'

  end
end
