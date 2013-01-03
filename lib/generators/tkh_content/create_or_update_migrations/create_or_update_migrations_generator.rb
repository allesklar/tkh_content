require 'rails/generators/migration'
 
module TkhContent
  module Generators
    class CreateOrUpdateMigrationsGenerator < ::Rails::Generators::Base
      include Rails::Generators::Migration
      source_root File.expand_path('../templates', __FILE__)
      desc "create or update page migrations"
      def self.next_migration_number(path)
        unless @prev_migration_nr
          @prev_migration_nr = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
        else
          @prev_migration_nr += 1
        end
        @prev_migration_nr.to_s
      end
 
      def copy_migrations
        puts 'creating or updating page migrations'
        migration_template "create_pages.rb", "db/migrate/create_pages.rb"
        migration_template "add_author_to_pages.rb", "db/migrate/add_author_to_pages.rb"
        migration_template "add_parent_id_to_pages.rb", "db/migrate/add_parent_id_to_pages.rb"
        migration_template "create_tags.rb", "db/migrate/create_tags.rb"
        migration_template "create_taggings.rb", "db/migrate/create_taggings.rb"
        migration_template "create_contacts.rb", "db/migrate/create_contacts.rb"
      end
 
    end
  end
end