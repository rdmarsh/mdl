namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Faker::Config.locale = "en-au"
    require 'populator'
    
    Organisation.populate(10) do |organisation|
      organisation.name             = (Faker::Company.name + Faker::Lorem.word).parameterize
      organisation.slug             = organisation.name.parameterize
      organisation.full_name        = Faker::Company.name
      organisation.relationship_id  = 1..9
      organisation.active           = [true, false]
      organisation.phone            = Faker::PhoneNumber.phone_number
      organisation.fax              = Faker::PhoneNumber.phone_number
      organisation.email            = Faker::Internet.email
      
      System.populate(0..50) do |system|
        system.name                 = Faker::Internet.domain_word
        system.slug                 = system.name.parameterize
        system.description          = Faker::Lorem.sentences
        system.device_model_id      = 1..5
        system.environment_id       = 1..9
        system.service_level_id     = 1..5
        system.support_level_id     = 1..5
        system.organisation_id      = organisation.id
        system.asset_tag            = 100000..999999
        system.serial_number        = 100000..999999
        system.operating_system_id  = 1..60
      end
      
      Address.populate(0..2) do |address|
        address.name              = Faker::Company.name
        address.slug              = address.name.parameterize
        address.organisation_id   = organisation.id
        address.building_number   = Faker::Address.building_number
        address.city              = Faker::Address.city
        address.city_prefix       = Faker::Address.city_prefix
        address.city_suffix       = Faker::Address.city_suffix
        address.country           = Faker::Address.country
        address.latitude          = Faker::Address.latitude
        address.longitude         = Faker::Address.longitude
        address.secondary_address = Faker::Address.secondary_address
        address.state             = Faker::Address.state
        address.state_abbr        = Faker::Address.state_abbr
        address.street_address    = Faker::Address.street_address
        address.street_name       = Faker::Address.street_name
        address.street_suffix     = Faker::Address.street_suffix
        # address.time_zone         = Faker::Address.time_zone
        address.postcode          = Faker::Address.postcode
        address.description       = Faker::Lorem.sentences
      end
      
      Person.populate(0..2) do |person|
        person.name              = Faker::Name.name
        person.organisation_id   = organisation.id
      end
    end
  end
end