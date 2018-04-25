source 'https://rubygems.org'
ruby '2.4.0'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.1'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'bootstrap-sass'
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.2'
gem 'autoprefixer-rails'
gem 'jquery-turbolinks'
gem "simple_form"
gem 'dotenv', '~> 2.2'
gem "cocoon"
gem 'devise'
gem 'toastr-rails'
gem 'cancancan'
gem 'devise-bootstrap-views'
gem 'devise_invitable'
gem 'enumerize', '~> 1.1.0'

group :development, :test do
  gem 'byebug', platform: :mri
end

group :development do
	gem 'sinatra', '2.0.0.beta2'
	gem 'mailcatcher'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem "better_errors"
  gem "binding_of_caller"
  gem 'sqlite3'
end

group :production do
  gem 'rails_12factor'
  gem 'pg'
end  
