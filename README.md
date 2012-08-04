# TKH Content

This Rails engine puts the C in CMS. It provides the pages and the blog section. 

Primarily developed for Ten Thousand Hours but we are happy to share if anybody finds it useful.

It's still embryonic but many improvements to come. The blog is not in yet. 



## Pre-requisites


The following things are needed:

* Ruby 1.9.2 or later


## Installation

Add this line to your application's Gemfile:

    gem 'tkh_content', '~> 0.0'

Then execute:

    $ bundle

Import migration

		$ rake tkh_content:install

Run the migration

		$ rake db:migrate
		
Add these 3 lines to the bottom of your routes file, just before the final end statement

		scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
		  resources :pages, only: :show, path: ''
		end

And then of course restart your server!

		$ rails s


## Usage


The section is located at:

    /pages

... and it should work out of the box


## Contributing

Pull requests for new features and bug fixes are welcome.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Create your failing tests based on the Test Unit framework.
4. Create your code which makes the tests pass.
5. Commit your changes (`git commit -am 'Added some feature'`)
6. Push to the branch (`git push origin my-new-feature`)
7. Create new Pull Request
