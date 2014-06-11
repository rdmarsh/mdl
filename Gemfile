# OneMDL is a ruby on rails based application designed to collate information
# about IT assets. It is designed to be most useful to System Administrators
# and Service Desk personal.
# 
# Copyright (C) 2013 David Marsh
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

source 'https://rubygems.org'
ruby '2.1.1'

gem 'rails', '~> 4.1.0'

# better watching of mac filesystem
gem 'rb-fsevent'

# HTML Abstraction Markup Language
gem 'haml'
gem 'haml-rails'

# bootstrap-sass
gem 'sass-rails', '~> 3.2'
gem 'bootstrap-sass', '~> 3.1.1'


gem 'faker', '>= 1.1.2'
gem 'populator'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '>= 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '>= 1.2'
#gem 'taps', '>= 0.3.24'
gem 'simple_form'
gem 'show_for', '>= 0.2.4'
# railscast 230
gem 'inherited_resources'
gem 'has_scope'
# gem "rails-settings-cached", "0.3.1"
# the countries gem must appear above country_select gem
gem 'countries'
gem 'country_select'
gem 'public_activity'
gem 'kaminari'
# gem 'bootstrap-kaminari-views'
gem 'activevalidators', '>= 2.0.2'
gem 'bcrypt-ruby', '>= 3.0.0'
# http://railscasts.com/episodes/213-calendars-revised?view=asciicast
gem 'jquery-ui-rails'

# https://github.com/lubieniebieski/bootstrap-datetimepicker-rails
# gem "bootstrap-datetimepicker-rails", "~> 0.0.11"


# Apparently, It was failing because of the friendlyId gem. If you use friendlyId, you may need to specify the rails4-branch.
# edit: Make sure to get the actual branch from norman/friendly_id. According to the readme, it needs to be at least branch: 5.0-stable to work with rails4.
# gem 'friendly_id', github: 'FriendlyId/friendly_id', branch: 'rails4'
gem 'friendly_id', '>= 5.0.0.rc2' # Note: You MUST use 5.0.0 or greater for Rails 4.0+

# # add markdown support to description fields
# gem 'redcarpet'

# paper trail for auditing
gem 'paper_trail', '>= 3.0.0.beta1'

# gem "cancan"

# Perform geographic queries using objects
gem 'geocoder'

gem 'rake'

group :development, :test do
  gem 'minitest', '~> 5.3.3'
  gem 'nokogiri'
  gem 'guard-rspec', '>= 2.5.0'
  gem 'ruby_gntp'
  gem 'launchy'
  gem 'sqlite3', '>= 1.3.7'
  gem 'rspec-rails', '2.13.1'
  gem 'spork-rails', github: 'sporkrb/spork-rails'
  gem 'guard-spork', '1.5.0'
  gem 'childprocess', '0.3.9'
end

group :test do
  gem 'selenium-webdriver', '~> 2.35.1'
  gem 'capybara', '2.1.0'
  gem 'factory_girl_rails', '4.2.1'
end

group :doc do
  gem 'sdoc', require: false
end

group :production do
  #doing this to just get this going gem 'pg', '>= 0.15.1'
  gem 'sqlite3', '>= 1.3.7'
  gem 'rails_12factor', '0.0.2' #for heroku
  gem 'unicorn'
end

