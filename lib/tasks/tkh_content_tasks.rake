namespace :tkh_content do
  desc "Create migrations and locale files"
  task :install do
    system 'rails g tkh_content:create_migration'
    system 'rails g tkh_content:create_or_update_locales'
  end
end