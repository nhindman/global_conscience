# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Comment.create(body: "I used to be emperor!", country_id: 1, user_id: 1)
Comment.create(body: "I squandered the resources of egypt", country_id: 2, user_id: 1)
Info.create(body: "Its hard to even refer to Syria as a country anymore")
Info.create(body: "Sisi is not a sissy. He's also the anti isis.")
Tweet.create(body: "#isis")
Tweet.create(body: "#dictatorships replace failed #democracies")
User.create(email: "Roman.Emperor@postoffice.old")

all_countries = HTTParty.get("http://where.yahooapis.com/v1/countries?appid=Q6S.eLHV34GwNc79pswEdclgszSHyCyV7u5nb4kCEkfySEnahkUqyCEN1W1o2LsXR40GWpY")
all_countries["places"]["place"].each do |hash|
  Country.create(name: hash["name"], woeid: hash["woeid"])
end
