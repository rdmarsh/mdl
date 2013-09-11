namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Faker::Config.locale = "en-au"
    
    @servicelevels = ["Managed", "Colocation", "Mixed", "Unknown"]
    # @supportlevels = ["Business Hours", "After Hours", "Unknown", "None"]
    @supportlevels = ["1", "2", "3", "4"]
    @relationships = ["Customer", "Partner", "Supplier", "Unknown", "Manufacturer", "Vendor"]
    
    5.times do |n|
      
      name  = Faker::Lorem.word + "#{n+1}"
      full_name  = Faker::Company.name
      service_ref = @servicelevels.sample
      support_ref = @supportlevels.sample
      relationship = @relationships.sample
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
        service_reference: service_ref,
        support_level_id: support_ref,
        relationship: relationship,
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
