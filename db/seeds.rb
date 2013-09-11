# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

SupportLevel.create(name: "Unknown", hours: "n/a", days: "n/a", exclusions: "n/a", description: "The support agreement is currently unknown. Support may occur time and material fees, which needs written authorisation from a customers representative before being undertaken.")
SupportLevel.create(name: "Business Hours", hours: "8am - 6pm", days: "Mon - Fri", exclusions: "Public holidays", description: "Only supported between 8am and 6pm, Monday to Friday. Public holidays excluded. Any support outside of this time will occur time and material fees, which needs written authorisation from a customers representative before being undertaken.")
SupportLevel.create(name: "After Hours", hours: "24 hours", days: "7 days", exclusions: "None", description: "Supported 24hours, 7days. Public holidays included.")
SupportLevel.create(name: "None", hours: "n/a", days: "n/a", exclusions: "n/a", description: "No support is provided. Any support will occur time and material fees, which needs written authorisation from a customers representative before being undertaken.")

DeviceType.create(name: "Unknown", description: "The device is currently unknown.")
DeviceType.create(name: "None", description: "The device is currently unknown.")
DeviceType.create(name: "Blade chassis", description: "The device is currently unknown.")
DeviceType.create(name: "Blade", description: "The device is currently unknown.")
DeviceType.create(name: "Router", description: "The device is currently unknown.")
DeviceType.create(name: "Hub", description: "The device is currently unknown.")
DeviceType.create(name: "Server", description: "The device is currently unknown.")

DeviceModel.create(name: "Unknown", device_type_id: 1, manufacturer_id: 1, description: "The device is currently unknown.")
DeviceModel.create(name: "None", device_type_id: 1, manufacturer_id: 1, description: "The device is currently unknown.")

Manufacturer.create(name: "Unknown", description: "The environment is currently unknown.")
Manufacturer.create(name: "None", description: "There is no manufacturer applicable.")
Manufacturer.create(name: "Dell", description: "Dell is a company that makes laptop and desktop computers and computer accessories. It is named after Michael Dell, the CEO and creator of the company. Dell makes computers for businesses and home users, and they also make computer monitors and Printers.")
Manufacturer.create(name: "HP", description: "Hewlett Packard (HP) is a computer technology company founded in 1939 by Bill Hewlett and Dave Packard. They are best known for making computers and computer hardware such as inkjet printers, laser printers, all-in-one printers, scanners and digital cameras.")
Manufacturer.create(name: "Apple", description: "Apple.")
Manufacturer.create(name: "Microsoft", description: "Microsoft.")
Manufacturer.create(name: "Lenovo", description: "Lenovo.")
Manufacturer.create(name: "EMC", description: "EMC.")

Environment.create(name: "Unknown", description: "The environment is currently unknown.")
Environment.create(name: "None", description: "There is no environment applicable.")
Environment.create(name: "Production", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
Environment.create(name: "UAT", description: "Lorem")
Environment.create(name: "Development", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
Environment.create(name: "Decommissioned", description: "Lorem")
Environment.create(name: "Pre-production", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
Environment.create(name: "Disaster recovery", description: "Lorem")

Organisation.create(name: "Unknown", full_name: "Unknown", service_reference: "Unknown", support_level_id: 1, relationship: "Unknown", active: true)
Organisation.create(name: "Dave", full_name: "Dave", service_reference: "Unknown", support_level_id: 1, relationship: "Unknown", active: true)

# OnemdlSettings.create(name: "omdl")