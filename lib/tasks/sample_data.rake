namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Faker::Config.locale = "en-au"
    require 'populator'
    
    Organisation.populate(10) do |organisation|
      organisation.name             = Faker::Company.name + Faker::Lorem.word
      organisation.full_name        = Faker::Company.name
      organisation.relationship_id  = 1..9
      organisation.active           = [true, false]
      organisation.phone            = Faker::PhoneNumber.phone_number
      organisation.fax              = Faker::PhoneNumber.phone_number
      organisation.email            = Faker::Internet.email
      organisation.city             = Faker::Address.city
      organisation.postcode         = Faker::Address.postcode
      organisation.country          = Faker::Address.country
      organisation.state            = Faker::Address.state
      
      System.populate(0..50) do |system|
        system.name                 = Faker::Internet.domain_word
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
    end
    
    Organisation.populate(10) do |organisation|
      organisation.name             = Faker::Company.name + Faker::Lorem.word
      organisation.full_name        = Faker::Company.name
      organisation.relationship_id  = 1..9
      organisation.active           = [true, false]
      organisation.phone            = Faker::PhoneNumber.phone_number
      organisation.fax              = Faker::PhoneNumber.phone_number
      organisation.email            = Faker::Internet.email
      organisation.city             = Faker::Address.city
      organisation.postcode         = Faker::Address.postcode
      organisation.country          = Faker::Address.country
      organisation.state            = Faker::Address.state
      
      System.populate(0..50) do |system|
        system.name                 = Faker::Internet.domain_word
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
    end

  end
end
