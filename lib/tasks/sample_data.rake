namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    
    @servicelevels = ["Managed", "Colocation", "Mixed", "Unknown"]
    @supportlevels = ["Business Hours", "After Hours", "Unknown", "None"]
    @relationships = ["Customer", "Partner", "Supplier", "Unknown"]
    
    99.times do |n|
      
      ref  = Faker::Lorem.word + "#{n+1}"
      
      name  = Faker::Company.name
      service_level = @servicelevels.sample
      support_level = @supportlevels.sample
      relationship = @relationships.sample
      active = [true, false].sample
      
      Organisation.create!(
        reference: ref,
        name: name,
        service_level: service_level,
        support_level: support_level,
        relationship: relationship,
        active: active)
        
    end
  end
end
