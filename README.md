## onemdl


[![Build Status](https://travis-ci.org/rdmarsh/onemdl.png?branch=master)](https://travis-ci.org/rdmarsh/onemdl)

OneMDL is a ruby on rails based application designed to collate information about IT assets. It is designed to be most useful to System Administrators and Service Desk personal.

* Ruby version 2.0.0
* Rails version 4.0.0

http://onemdl.com/

## Demo

There is a demo available at http://onemdl.herokuapp.com/

Currently broken, some issues with TDD, rake etc

## ohloh.net

Onemdl is registered on ohloh.net at https://www.ohloh.net/p/onemdl

## Installation

* `git clone https://github.com/rdmarsh/onemdl.git`
* `bundle install'
* `bundle exec rake db:migrate`

Set your timezone in /config/application.rb

    config.time_zone = 'Central Time (US & Canada)'

or

...    config.time_zone = 'Central Time (US & Canada)'

User avatars are from Gravatar.

### Installing Ruby and Rails

### System dependencies

### Configuration

### Database creation

### Database initialization


### How to run the test suite

### Services (job queues, cache servers, search engines, etc.)

### Deployment instructions

How to deploy to production.

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

Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.
