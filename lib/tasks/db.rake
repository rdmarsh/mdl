namespace :db do
  
  task :all => [:environment, :drop, :create, :migrate, :seed, :populate] do
  end

end