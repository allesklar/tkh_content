module TkhContent
  module Generators
    class CreateOrUpdateFilesGenerator < ::Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)
      desc "copying blog layout"
      def copy_files
        puts 'creating blog layout'
        I18n.available_locales.each do |l|
          copy_file "blog.html.erb", "app/views/layouts/blog.html.erb"
        end
      end
    end
  end
end