# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Comment.create(body: "I used to be emperor!", country_id: 1, user_id: 1)
Comment.create(body: "I squandered the resources of egypt", country_id: 2, user_id: 1)
Country.create(info_id: 2, name: "egypt", tweet_id: 2, user_id: 1, woeid: 23424802)
Country.create(info_id: 1, name: "syria", tweet_id: 1, user_id: 1, woeid: 23424956)
Info.create(body: "Its hard to even refer to Syria as a country anymore")
Info.create(body: "Sisi is not a sissy. He's also the anti isis.")
Tweet.create(body: "#isis")
Tweet.create(body: "#dictatorships replace failed #democracies")
User.create(email: "Roman.Emperor@postoffice.old")