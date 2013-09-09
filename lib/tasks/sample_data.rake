namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    
    @servicelevels = ["Managed", "Colocation", "Mixed", "Unknown"]
    # @supportlevels = ["Business Hours", "After Hours", "Unknown", "None"]
    @supportlevels = ["1", "2", "3", "4"]
    @relationships = ["Customer", "Partner", "Supplier", "Unknown"]
    
    5.times do |n|
      
      name  = Faker::Lorem.word + "#{n+1}"
      full_name  = Faker::Company.name
      service_ref = @servicelevels.sample
      support_ref = @supportlevels.sample
      relationship = @relationships.sample
      active = [true, false].sample
      
      Organisation.create!(
        name: name,
        full_name: full_name,
        service_reference: service_ref,
        support_level_id: support_ref,
        relationship: relationship,
        active: active)
        
    end
  end
end
