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
ServiceLevel.create(name: "None",    description: "There is no service level applicable.")
ServiceLevel.create(name: "Managed", description: "Managed services is the practice of outsourcing day-to-day management work as a calculated way for improved operations inclusive of production support and lifecycle build/maintenance activities. The business owner of the company who has direct oversight of the organization or system being managed is referred to as the client, or customer. The person or organization that manages and provides the service is regarded as the service provider.")
ServiceLevel.create(name: "Colocation", description: "Colocation is the act of placing multiple (sometimes related) entities within a single location. If these are managed devices, they fall under the 'Managed' Service Level.")

DeviceType.create(name: "Unknown", description: "The device type is currently unknown.")
DeviceType.create(name: "None",    description: "There is no device type applicable.")
DeviceType.create(name: "Blade chassis", description: "A blade chassis (or enclosure) can hold multiple blade servers. The blade chassis provides services such as power, cooling, networking, various interconnects and management for blade servers.")
DeviceType.create(name: "Router", description: "A router is a device that forwards data packets between computer networks, creating an overlay internetwork. A router is connected to two or more data lines from different networks. When a data packet comes in one of the lines, the router reads the address information in the packet to determine its ultimate destination.")
DeviceType.create(name: "Hub", description: "A network hub is a device for connecting multiple network devices together and making them act as a single network segment. It has multiple input/output (I/O) ports, in which a signal introduced at the input of any port appears at the output of every port except the original incoming. A hub works at the physical layer (layer 1) of the OSI model.")
DeviceType.create(name: "Switch", description: "A network switch is a computer networking device that links network segments or network devices. The term commonly refers to a multi-port network bridge that processes and routes data at the data link layer (layer 2) of the OSI model. Switches that additionally process data at the network layer (layer 3) and above are often called layer-3 switches or multilayer switches.")
DeviceType.create(name: "Server - blade", description: "A blade server is a stripped down server computer with a modular design optimized to minimize the use of physical space and energy. Whereas a standard rack-mount server can function with (at least) a power cord and network cable, blade servers have many components removed to save space, minimize power consumption and other considerations, while still having all the functional components to be considered a computer.")
DeviceType.create(name: "Server - rack-mounted", description: "Rack-mounted servers are designed to store many devices mounted in a server rack. Unlike ordinary computers, servers usually can be configured, powered up and down or rebooted remotely, using out-of-band management.")
DeviceType.create(name: "Server - virtual", description: "A virtual server (VM) is a software implementation of a physical server. virtualisation allows multiple instances of virtual servers to reside on one (or more) physical server. This leads to more efficient use of computing resources, both in terms of energy consumption and cost effectiveness.")

Relationship.create(name: "Unknown", description: "The relationship is currently unknown.")
Relationship.create(name: "None",    description: "There is no relationship applicable.")
Relationship.create(name: "Customer", description: "There is no relationship applicable.")
Relationship.create(name: "Partner", description: "There is no relationship applicable.")
Relationship.create(name: "Supplier", description: "There is no relationship applicable.")
Relationship.create(name: "Manufacturer", description: "There is no relationship applicable.")
Relationship.create(name: "Vendor", description: "There is no relationship applicable.")
Relationship.create(name: "Service provider", description: "There is no relationship applicable.")

Manufacturer.create(name: "Unknown", website: "n/a", description: "The environment is currently unknown.")
Manufacturer.create(name: "None",    website: "n/a", description: "There is no manufacturer applicable.")
Manufacturer.create(name: "Dell", website: "http://dell.com/", description: "Dell is a company that makes laptop and desktop computers and computer accessories. It is named after Michael Dell, the CEO and creator of the company. Dell makes computers for businesses and home users, and they also make computer monitors and Printers.")
Manufacturer.create(name: "HP", website: "http://hp.com/", description: "Hewlett Packard (HP) is a computer technology company founded in 1939 by Bill Hewlett and Dave Packard. They are best known for making computers and computer hardware such as inkjet printers, laser printers, all-in-one printers, scanners and digital cameras.")
Manufacturer.create(name: "Apple", website: "http://apple.com/", description: "Apple is a multinational company that makes computer hardware, computer software, and portable devices like mobile telephones and music players. Apple calls its computers Macintoshes or Macs, and it calls its laptops MacBooks. Their popular line of mobile music players is called iPod, their smartphone line is called iPhone and their Tablet line is called iPad.")
Manufacturer.create(name: "Microsoft", website: "http://microsoft.com/", description: "Microsoft Corporation is a multinational which makes computer software and video games all over the world. Bill Gates and Paul Allen started the company in 1975. Microsoft makes Windows, Microsoft Office (including Microsoft Word), Internet Explorer, MSN, and the Xbox 360. Microsoft is the world's biggest software maker.")
Manufacturer.create(name: "Lenovo", website: "n/a", description: "Lenovo is a Chinese computer company that makes computers, laptops, tablets, and other devices.")
Manufacturer.create(name: "EMC", description: "EMC Corporation (stylized as EMC²) is an American multinational corporation that offers data storage, information security, virtualization, and cloud computing products and services which enable businesses to store, manage, protect, and analyze massive volumes of data. EMC's target markets include large FORTUNE 500 companies as well as small business across various vertical markets. It is headquartered in Hopkinton, Massachusetts.")
Manufacturer.create(name: "IBM", website: "http://ibm.com/", description: "International Business Machines Corporation (IBM) is a company from the United States that makes and sells software, computer hardware, infrastructure services, and consulting services. IBM is one of the biggest Information Technology companies in the world. IBM has had the most patents of any technology company for many years, and has made many important inventions and discoveries that have improved computers.")
Manufacturer.create(name: "VMWare", website: "http://vmware.com/", description: "VMWare")

Environment.create(name: "Unknown", description: "The environment is currently unknown.")
Environment.create(name: "None",    description: "There is no environment applicable.")
Environment.create(name: "Production", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
Environment.create(name: "UAT", description: "Lorem")
Environment.create(name: "Development", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
Environment.create(name: "Decommissioned", description: "Lorem")
Environment.create(name: "Pre-production", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
Environment.create(name: "Disaster recovery", description: "Lorem")

DeviceModel.create(name: "Unknown", device_type_id: 1, manufacturer_id: 1, description: "The device model is currently unknown.")
DeviceModel.create(name: "None",    device_type_id: 2, manufacturer_id: 2, description: "There is no device model applicable.")

Organisation.create(name: "Unknown", full_name: "Unknown", relationship_id: 1, active: true)
Organisation.create(name: "None",    full_name: "None",    relationship_id: 2, active: true)

Device.create(name: "Unknown", ipaddress: "0.0.0.0", device_model_id: 1, environment_id: 1, support_level_id: 1, service_level_id: 1, organisation_id: 1, description: "The device is currently unknown.")
Device.create(name: "None",    ipaddress: "0.0.0.0", device_model_id: 2, environment_id: 2, support_level_id: 2, service_level_id: 2, organisation_id: 2, description: "There is no device applicable.")


# OnemdlSettings.create(name: "omdl")