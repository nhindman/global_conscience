class Tweet < ActiveRecord::Base
  attr_accessible :body

  def self.establish_connection
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "ftf1qMPsfZ9TJW7jaQ"
      config.consumer_secret     = "pns1t39A78YBgoSZhvA5blvQ6BUho6GfOQO2bsU"
      config.access_token        = "298938773-KpJL8yejHGFPtbyTZORgWe0oLuNp5vSJgih5p3ST"
      config.access_token_secret = "cTR7G9R4DyqGWwjCegYEAH9hp2dwiJEyPZ4RMK0YTbzY5"
    end
    return client
  end

  def self.woeid_trends(woeid)
    woeid_trend = Tweet.establish_connection.trends_place(woeid)
    woeid_trends = woeid_trend.attrs[:trends]
    return woeid_trends
  end

  def self.coords_trends(country)
    coords = Geocoder.search(country)[0].data["geometry"]["location"]
    location = Tweet.establish_connection.trends_closest({lat: coords["lat"], long: coords["lng"]})
    coords_woeid = location[0].attrs[:woeid]
    woeid_trends = Tweet.woeid_trends(coords_woeid)
    return woeid_trends
  end


  
end
