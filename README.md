## onemdl

* [Travis CI ![Build Status](https://travis-ci.org/rdmarsh/onemdl.png?branch=master)](https://travis-ci.org/rdmarsh/onemdl)

OneMDL is a ruby on rails based application designed to collate information
about IT assets. It is designed to be most useful to System Administrators and
Service Desk personal.

* Ruby version 2.1.1
* Rails version 4.1.0

http://onemdl.com/

## Demo

There is a demo available at http://onemdl.herokuapp.com/

Currently broken, some issues with TDD, rake etc

## ohloh.net

Onemdl is registered on ohloh.net at https://www.ohloh.net/p/onemdl

## Installation

* `git clone https://github.com/rdmarsh/onemdl.git`
** If you've been granted read/write accesss: `git remote set-url origin git@github.com:rdmarsh/onemdl.git`
* `gem install bundler`
* `bundle install`
* `bundle exec rake db:migrate`

* Set your timezone in /config/application.rb, eg:

```ruby
config.time_zone = 'Australia/Sydney'
config.time_zone = 'Europe/London'
config.time_zone = 'Central Time (US & Canada)'
```

* User avatars are from Gravatar.

### Installing Ruby and Rails

### System dependencies

### Configuration

### Database creation

* `bundle exec rake db:migrate`

### Database initialization

* `bundle exec rake db:seed`

### How to run the test suite

### How to populate with test data

* `bundle exec rake db:populate`

### Services (job queues, cache servers, search engines, etc.)

### Deployment instructions

How to deploy to production.

### update

* `bundle update`

## Logic graph

![logic graph](https://raw.githubusercontent.com/rdmarsh/onemdl/master/onemdl.png "Logic Graph")

## Gource

Create a video of development with Gource:

	gource \
		-s 0.01 \
		-1920x1080 \
		--auto-skip-seconds 0.01 \
		--multi-sampling \
		--stop-at-end \
		--highlight-users \
		--hide mouse,progress \
		--file-idle-time 13 \
		--max-files 0 \
		--background-colour 000000 \
		--title "One MDL" \
		--font-size 26 \
		--logo "app/assets/images/onering.png" \
		--output-ppm-stream - \
		--output-framerate 30 \
	| avconv -y -r 30 -f image2pipe -vcodec ppm -i - -b 32768k movie.mp4
	
----

# Bugs and todo

* license show is inconsistent, needs name and slug
* make sure everything has a slug and ids are gone
* network use index page not working
* migrate manufacture into organisation
* migrate datacenter into organisation

# Licence

OneMDL is a ruby on rails based application designed to collate information
about IT assets. It is designed to be most useful to System Administrators
and Service Desk personal.

Copyright (C) 2013-2014 David Marsh

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
