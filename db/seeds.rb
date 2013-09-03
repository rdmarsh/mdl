# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

SupportLevel.create(support_reference: "Business Hours", hours: "8am - 6pm", days: "Mon - Fri", exclusions: "Public holidays", description: "Only supported between 8am and 6pm, Monday to Friday. Public holidays excluded. Any support outside of this time will occur time and material fees, which needs written authorisation from a customers representative before being undertaken.")
SupportLevel.create(support_reference: "After Hours", hours: "24 hours", days: "7 days", exclusions: "None", description: "Supported 24hours, 7days. Public holidays included.")
SupportLevel.create(support_reference: "None", hours: "n/a", days: "n/a", exclusions: "n/a", description: "No support is provided. Any support will occur time and material fees, which needs written authorisation from a customers representative before being undertaken.")
SupportLevel.create(support_reference: "Unknown", hours: "n/a", days: "n/a", exclusions: "n/a", description: "The support agreement is currently unknown. Support may occur time and material fees, which needs written authorisation from a customers representative before being undertaken.")

Environment.create(environment: "Production", description: "Lorem")
Environment.create(environment: "UAT", description: "Lorem")
Environment.create(environment: "Development", description: "Lorem")
Environment.create(environment: "Decommissioned", description: "Lorem")
Environment.create(environment: "Pre-production", description: "Lorem")
Environment.create(environment: "Disaster recovery", description: "Lorem")
Environment.create(environment: "Unknown", description: "The environment is currently unknown.")

Organisation.create(organisation_reference: "Unknown", name: "Unknown", service_reference: "Unknown", support_reference: "Unknown", relationship: "Unknown", active: true)
