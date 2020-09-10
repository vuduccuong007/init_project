source "https://rubygems.org"
git_source(:github){|repo| "https://github.com/#{repo}.git"}

ruby "2.7.0"

gem "bcrypt", "3.1.13"
gem "bootsnap", ">= 1.1.0", require: false
gem "bootstrap-kaminari-views"
gem "bootstrap-sass", "~> 3.4.1"
gem "coffee-rails", "~> 4.2"
gem "config"
gem "faker", "2.1.2"
gem "figaro"
gem "jbuilder", "~> 2.5"
gem "kaminari"
gem "mysql2"
gem "puma", "~> 3.11"
gem "rails", "~> 6.0.3.2"
gem "rails-i18n"
gem "sass-rails", "~> 5.0"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"
gem "webpacker", "~> 4.0"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "chromedriver-helper"
  gem "selenium-webdriver"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :development, :test do
  gem "rails_best_practices"
  gem "rubocop", "~> 0.74.0", require: false
  gem "rubocop-checkstyle_formatter", require: false
  gem "rubocop-rails", "~> 2.3.2", require: false
end
