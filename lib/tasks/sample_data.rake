namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Faker::Config.locale = "en-au"
    
    # generate some fake companies
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
      
    # genaret some fake systems
    # again todo: change to range
    @device_models = ["1", "2"]
    
    1024.times do |n|
        
      name = Faker::Internet.domain_word
      description = Faker::Lorem.sentences
      device_model_id = @device_models.sample
      t.integer  "environment_id"
      t.integer  "service_level_id"
      t.integer  "support_level_id"
      t.integer  "organisation_id"
      t.string   "asset_tag"
      t.integer  "network_interface_id"
      t.string   "serial_number"
      t.integer  "operating_system_id"
      t.string   "slug"
        
    end
  end
end
