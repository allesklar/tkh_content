namespace :tkh_content do
  desc "Create migrations, locale, and other files"
  task :install do
    system 'rails g tkh_content:create_migration'
    system 'rails g tkh_content:create_or_update_locales -f'
    system 'rails g tkh_content:create_or_update_files -f'
  end
  
  task :update do
    system 'rails g tkh_content:create_migration -s'
    system 'rails g tkh_content:create_or_update_locales -f'
    system 'rails g tkh_content:create_or_update_files -s'
  end
end