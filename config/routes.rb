Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    resources :pages, except: :show
    # this is a bit funky
    # in order to show pages without the controller name
    # this line should be at the end of the routes file
    # nothing to do when in context of tkh_cms
    # working on this.
    resources :pages, only: :show, path: ''
  end
end