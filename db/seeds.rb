# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

SupportLevel.create(name: "Unknown", hours: "n/a", days: "n/a", exclusions: "n/a", description: "The support agreement is currently unknown. Support may occur time and material fees, which needs written authorisation from a customers representative before being undertaken.")
SupportLevel.create(name: "None", hours: "n/a", days: "n/a", exclusions: "n/a", description: "No support is provided. Any support will occur time and material fees, which needs written authorisation from a customers representative before being undertaken.")
SupportLevel.create(name: "Business Hours", hours: "8am - 6pm", days: "Mon - Fri", exclusions: "Public holidays", description: "Only supported between 8am and 6pm, Monday to Friday. Public holidays excluded. Any support outside of this time will occur time and material fees, which needs written authorisation from a customers representative before being undertaken.")
SupportLevel.create(name: "After Hours", hours: "24 hours", days: "7 days", exclusions: "None", description: "Supported 24hours, 7days. Public holidays included.")

ServiceLevel.create(name: "Unknown", description: "The service level is currently unknown.")
ServiceLevel.create(name: "None", description: "There is no service level applicable.")
ServiceLevel.create(name: "Managed", description: "Managed.")
ServiceLevel.create(name: "Colocation", description: "Colocation.")

DeviceType.create(name: "Unknown", description: "The device type is currently unknown.")
DeviceType.create(name: "None", description: "There is no device type applicable.")
DeviceType.create(name: "Blade chassis", description: "The device is currently unknown.")
DeviceType.create(name: "Blade", description: "The device is currently unknown.")
DeviceType.create(name: "Router", description: "The device is currently unknown.")
DeviceType.create(name: "Hub", description: "The device is currently unknown.")
DeviceType.create(name: "Server", description: "The device is currently unknown.")

Relationship.create(name: "Unknown", description: "The relationship is currently unknown.")
Relationship.create(name: "None", description: "There is no relationship applicable.")
Relationship.create(name: "Customer", description: "There is no relationship applicable.")
Relationship.create(name: "Partner", description: "There is no relationship applicable.")
Relationship.create(name: "Supplier", description: "There is no relationship applicable.")
Relationship.create(name: "Manufacturer", description: "There is no relationship applicable.")
Relationship.create(name: "Vendor", description: "There is no relationship applicable.")

Manufacturer.create(name: "Unknown", website: "n/a", description: "The environment is currently unknown.")
Manufacturer.create(name: "None", website: "n/a", description: "There is no manufacturer applicable.")
Manufacturer.create(name: "Dell", website: "http://dell.com/", description: "Dell is a company that makes laptop and desktop computers and computer accessories. It is named after Michael Dell, the CEO and creator of the company. Dell makes computers for businesses and home users, and they also make computer monitors and Printers.")
Manufacturer.create(name: "HP", website: "http://hp.com/", description: "Hewlett Packard (HP) is a computer technology company founded in 1939 by Bill Hewlett and Dave Packard. They are best known for making computers and computer hardware such as inkjet printers, laser printers, all-in-one printers, scanners and digital cameras.")
Manufacturer.create(name: "Apple", website: "http://apple.com/", description: "Apple is a multinational company that makes computer hardware, computer software, and portable devices like mobile telephones and music players. Apple calls its computers Macintoshes or Macs, and it calls its laptops MacBooks. Their popular line of mobile music players is called iPod, their smartphone line is called iPhone and their Tablet line is called iPad.")
Manufacturer.create(name: "Microsoft", website: "http://microsoft.com/", description: "Microsoft Corporation is a multinational which makes computer software and video games all over the world. Bill Gates and Paul Allen started the company in 1975. Microsoft makes Windows, Microsoft Office (including Microsoft Word), Internet Explorer, MSN, and the Xbox 360. Microsoft is the world's biggest software maker.")
Manufacturer.create(name: "Lenovo", website: "n/a", description: "Lenovo is a Chinese computer company that makes computers, laptops, tablets, and other devices.")
Manufacturer.create(name: "EMC", description: "EMC Corporation (stylized as EMC²) is an American multinational corporation that offers data storage, information security, virtualization, and cloud computing products and services which enable businesses to store, manage, protect, and analyze massive volumes of data. EMC's target markets include large FORTUNE 500 companies as well as small business across various vertical markets. It is headquartered in Hopkinton, Massachusetts.")
Manufacturer.create(name: "IBM", website: "http://ibm.com/", description: "International Business Machines Corporation (IBM) is a company from the United States that makes and sells software, computer hardware, infrastructure services, and consulting services. IBM is one of the biggest Information Technology companies in the world. IBM has had the most patents of any technology company for many years, and has made many important inventions and discoveries that have improved computers.")
Manufacturer.create(name: "VMWare", website: "http://vmware.com/", description: "VMWare")

Environment.create(name: "Unknown", description: "The environment is currently unknown.")
Environment.create(name: "None", description: "There is no environment applicable.")
Environment.create(name: "Production", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
Environment.create(name: "UAT", description: "Lorem")
Environment.create(name: "Development", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
Environment.create(name: "Decommissioned", description: "Lorem")
Environment.create(name: "Pre-production", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
Environment.create(name: "Disaster recovery", description: "Lorem")

DeviceModel.create(name: "Unknown", device_type_id: 1, manufacturer_id: 1, description: "The device is currently unknown.")
DeviceModel.create(name: "None", device_type_id: 2, manufacturer_id: 2, description: "There is no device model applicable.")

Organisation.create(name: "Unknown", full_name: "Unknown", service_level_id: 1, support_level_id: 1, relationship_id: 1, active: true)
Organisation.create(name: "None", full_name: "None", service_level_id: 2, support_level_id: 2, relationship_id: 2, active: true)
Organisation.create(name: "Dave", full_name: "Dave", service_level_id: 1, support_level_id: 1, relationship_id: 1, active: true)

# OnemdlSettings.create(name: "omdl")