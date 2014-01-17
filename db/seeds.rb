# =================
# CREATES COUNTRIES
# =================

all_countries = HTTParty.get("http://where.yahooapis.com/v1/countries?appid=Q6S.eLHV34GwNc79pswEdclgszSHyCyV7u5nb4kCEkfySEnahkUqyCEN1W1o2LsXR40GWpY")
all_countries["places"]["place"].each do |hash|
  Country.create(name: hash["name"], woeid: hash["woeid"])
end

# ==============
# TRAVEL WARNING
# ==============


travel_warning = HTTParty.get('http://travel.state.gov/_res/rss/TWs.xml')
travel_warning['rss']['channel']['item'].each do |hash|
  country = hash["title"].split[0..-3].join(" ")
  tldr = hash["description"].split("<p>")[0..2].join(" ").gsub("</p>", " ").gsub("<br>", " ").gsub("&nbsp;", ".").gsub("&#8217;", "")
  Warning.create(title: hash["title"], body: tldr, link: hash["link"], country: country, date: hash["pubDate"])
end


# ============
# COUNTRY INFO
# ============

# all_countries["places"]["place"].each do |hash|
#   name = hash["name"].gsub(" ", "%20")
#   info = HTTParty.get("http://www.state.gov/api/v1?command=get_country_fact_sheets&fields=content_html&terms&terms=#{name}")
#   Info.create(body: info["country_fact_sheets"], country: hash["name"])
# end

