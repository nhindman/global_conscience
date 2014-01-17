class CountryController < ApplicationController

  def display
    @country = params[:country]

    if @country == ""
      # GLOBAL
      global = t.establish_connection.trends_place(1)
      @woeid_trends = global.attrs[:trends]
      warning = Warning.find_by_id(25)
      @statement = "Showing top global trends"
      @country = "Global"
    else
      woeid = Country.find_by_name(@country).woeid
      warning = Warning.find_by_country(@country)
      begin 
        # at WOEID, takes woeid as params
        @woeid_trends = Tweet.woeid_trends(woeid)
        # woeid_trend = Tweet.woeid_trends(woeid)
        # @woeid_trends = woeid_trend.attrs[:trends]
        @statement = "Showing top trends for #{@country}"
      rescue Twitter::Error::NotFound
        @woeid_trends = Tweet.coords_trends(@country)
        # closest to WOEID, takes country as params

        # coords = Geocoder.search(@country)[0].data["geometry"]["location"]
        # location = t.establish_connection.trends_closest({lat: coords["lat"], long: coords["lng"]})
        @statement = "For political reasons or otherwise, #{@country} does not have Twitter. Showing regional trends from the closest available location, #{location[0].attrs[:name]}, #{location[0].attrs[:country]}"

        # coords_woeid = location[0].attrs[:woeid]
        # coords_trend = Tweet.woeid_trends(coords_woeid)
        # @woeid_trends = coords_trend.attrs[:trends]
      rescue Twitter::Error::TooManyRequests
        @woeid_trends = "oops"
        @statement = "Too many requests. Please try again later."
      end
    @warning_title = warning.title
    @warning_body = warning.body
    @warning_link = warning.link
    @warning_date = warning.date
    @warning_id = warning.id
    end

    @posts = Comment.all

  end

  def tweet
    woeid = params[:woeid]
    @country = Country.find_by_woeid(woeid)

    begin
      @woeid_trends = Tweet.woeid_trends(woeid)
      @statement = "Showing top trends for #{@country}"
    rescue Twitter::Error::NotFound
      @woeid_trends = Tweet.coords_trends(@country)
      @statement = "For political reasons or otherwise, #{@country} does not have Twitter. Showing regional trends from the closest available location, #{location[0].attrs[:name]}, #{location[0].attrs[:country]}"
    rescue Twitter::Error::TooManyRequests
      @woeid_trends = "oops"
      @statement = "Too many requests. Please try again later."
    end
  end
end