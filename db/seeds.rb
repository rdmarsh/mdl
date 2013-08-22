# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Supportlevel.create(supportlevel: "Business Hours", supporthours: "8am - 6pm", supportdays: "Mon - Fri", supportexclusions: "Public holidays", supportdescription: "Only supported between 8am and 6pm, Monday to Friday. Public holidays excluded. Any support outside of this time will occur time and material fees, which needs written authorisation from a customers representative before being undertaken.")
Supportlevel.create(supportlevel: "After Hours", supporthours: "24 hours", supportdays: "7 days", supportexclusions: "None", supportdescription: "Supported 24hours, 7days. Public holidays included.")
Supportlevel.create(supportlevel: "Unknown", supporthours: "n/a", supportdays: "n/a", supportexclusions: "n/a", supportdescription: "The support agreement is currently unknown. Any support may occur time and material fees, which needs written authorisation from a customers representative before being undertaken.")
Supportlevel.create(supportlevel: "None", supporthours: "n/a", supportdays: "n/a", supportexclusions: "n/a", supportdescription: "No support is provided. Any support will occur time and material fees, which needs written authorisation from a customers representative before being undertaken.")

Environment.create(environment: "Production", description: "Lorem")

