class CountryController < ApplicationController

  def display
    @country = params[:country]
    
    t = Tweet.new

    if @country == ""
      # GLOBAL
      global = t.establish_connection.trends_place(1)
      @woeid_trends = global.attrs[:trends]
      warning = Warning.find_by_id(25)
      @statement = "Showing top global trends"
    else
      woeid = Country.find_by_name(@country).woeid
      warning = Warning.find_by_country(@country)
      begin 
        # at WOEID
        woeid_trend = t.establish_connection.trends_place(woeid)
        @woeid_trends = woeid_trend.attrs[:trends]
        @statement = "Showing top trends for #{@country}"
      rescue Twitter::Error::NotFound
        # closest to WOEID

        coords = Geocoder.search(@country)[0].data["geometry"]["location"]
        location = t.establish_connection.trends_closest({lat: coords["lat"], long: coords["lng"]})
        @statement = "For political reasons or otherwise, #{@country} does not have Twitter. Showing regional trends from the closest available location, #{location[0].attrs[:name]}, #{location[0].attrs[:country]}"

        coords_woeid = location[0].attrs[:woeid]
        coords_trend = t.establish_connection.trends_place(coords_woeid)
        @woeid_trends = coords_trend.attrs[:trends]
      end
    @warning_title = warning.title
    @warning_body = warning.body
    @warning_link = warning.link
    end



  end

  def tweet
    woeid = params[:woeid]
    twitter = Tweet.new
    tweet_trends = twitter.establish_connection.trends_place(woeid)
    @tweets = tweet_trends.attrs[:trends]
  end

end