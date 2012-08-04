Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    resources :pages, except: :show
  end
end


# this is a bit funky
# These 3 lines must be copied by hand to the bottom of the routes file and un-commented

# scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
#   resources :pages, only: :show, path: ''
# end