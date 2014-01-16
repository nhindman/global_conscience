class CountryController < ApplicationController

  def display
    country = params[:country]
    warning = Warning.find_by_country(country)
    @warning_title = warning.title
    @warning_body = warning.body
    @warning_link = warning.link

    location = Country.find_by_name(country)
    @woeid = location.woeid
    
    twitter = Tweet.new
    tweet_trends = twitter.establish_connection.trends_place(@woeid)
    @tweets = tweet_trends.attrs[:trends]
  end
  
end