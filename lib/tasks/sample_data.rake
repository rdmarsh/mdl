namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    
    @service = ["Managed", "Colocation", "Mixed", "Unknown"]
    @support = ["Business Hours", "After Hours", "Unknown"]
    
    99.times do |n|
      
      ref  = Faker::Lorem.word + #{n+1}
      
      name  = Faker::Company.name
      service = @service.sample
      support = @support.sample
      
      Organisation.create!(
        reference: ref,
        name: name,
        service: service,
        support: support)
    end
  end
end
