Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    resources :pages, except: :show
    resources :pages, only: :show, path: ''
  end
end