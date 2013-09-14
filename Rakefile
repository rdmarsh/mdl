# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Onemdl::Application.load_tasks

# as per http://stackoverflow.com/questions/14061162/rake-doesnt-know-how-to-build-tasks-default-or-minitest
# trying to get tests to pass
task :default => :test