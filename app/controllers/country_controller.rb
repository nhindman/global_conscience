class CountryController < ApplicationController

  def display
    @country = params[:country]

    if @country == ""
      global = t.establish_connection.trends_place(1)
      @woeid_trends = global.attrs[:trends]
      warning = Warning.find_by_id(25)
      @statement = "Showing top global trends"
      @country = "Global"
    else
      woeid = Country.find_by_name(@country).woeid
      warning = Warning.find_by_country(@country)
      begin 
        @woeid_trends = Tweet.woeid_trends(woeid)
        @statement = "Showing top trends for #{@country}"
      rescue Twitter::Error::NotFound
        trend_statement = Tweet.coords_trends(@country)
        @woeid_trends = trend_statement[0]
        @statement = trend_statement[1]
      rescue Twitter::Error::TooManyRequests
        @woeid_trends = "oops"
        @statement = "Too many requests. Please try again later."
      end
    @warning_title = warning.title
    @warning_body = warning.body
    @warning_date = warning.date
    @warning_id = warning.id
    end

    @comments = Comment.all

  end

  def tweet
    woeid = params[:woeid]
    country_obj = Country.find_by_woeid(woeid)
    @place = country_obj.name

    begin
      @woeid_trends = Tweet.woeid_trends(woeid)
      @statement = "Showing top trends for #{@country}"
    rescue Twitter::Error::NotFound
      trend_statement = Tweet.coords_trends(@place)
      @woeid_trends = trend_statement[0]
      @statement = trend_statement[1]
    rescue Twitter::Error::TooManyRequests
      @woeid_trends = "oops"
      @statement = "Too many requests. Please try again later."
    end
  end
end