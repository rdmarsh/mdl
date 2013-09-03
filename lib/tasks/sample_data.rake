namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    
    @servicelevels = ["Managed", "Colocation", "Mixed", "Unknown"]
    @supportlevels = ["Business Hours", "After Hours", "Unknown", "None"]
    @relationships = ["Customer", "Partner", "Supplier", "Unknown"]
    
    1024.times do |n|
      
      organisation_ref  = Faker::Lorem.word + "#{n+1}"
      name  = Faker::Company.name
      service_ref = @servicelevels.sample
      support_ref = @supportlevels.sample
      relationship = @relationships.sample
      active = [true, false].sample
      
      Organisation.create!(
        organisation_reference: organisation_ref,
        name: name,
        service_reference: service_ref,
        support_level_id: support_ref,
        relationship: relationship,
        active: active)
        
    end
  end
end
