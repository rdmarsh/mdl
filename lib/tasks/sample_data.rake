namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Faker::Config.locale = "en-au"
    
    # todo: change to range
    @service_levels = ["1", "2", "3", "4"]
    @support_levels = ["1", "2", "3", "4"]
    @relationships = ["1", "2", "3", "4", "5", "6", "7"]
    
    125.times do |n|
      
      name  = Faker::Lorem.word + "#{n+1}"
      full_name  = Faker::Company.name
      service_level_id = @service_levels.sample
      support_level_id = @support_levels.sample
      relationship_id = @relationships.sample
      active = [true, false].sample
      phone = Faker::PhoneNumber.phone_number
      fax = Faker::PhoneNumber.phone_number
      email = Faker::Internet.email
      city = Faker::Address.city
      postcode = Faker::Address.postcode
      country = Faker::Address.country
      state = Faker::Address.state
      
      
      Organisation.create!(
        name: name,
        full_name: full_name,
        service_level_id: service_level_id,
        support_level_id: support_level_id,
        relationship_id: relationship_id,
        active: active,
        phone: phone,
        fax: fax,
        email: email,
        # address_1: address_1,
        # address_2: address_2,
        city: city,
        postcode: postcode,
        country: country,
        state: state
        
        )
        
    end
  end
end
