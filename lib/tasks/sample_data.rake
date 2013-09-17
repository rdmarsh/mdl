namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Faker::Config.locale = "en-au"
    
    # todo: change to range
    @relationships = ["1", "2", "3", "4", "5", "6", "7"]
    
    125.times do |n|
      
      name  = Faker::Lorem.word + "#{n+1}"
      full_name  = Faker::Company.name
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
