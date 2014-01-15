class CountryController < ApplicationController

  def display
    woeid = params[:country]
    woeid.to_i
    @country_choice = Country.find_by_woeid(woeid)
    country = @country_choice.name
    warning = warning.find_by_country(country)
    @warning_title = warning.title
    @warning_body = warning.body
    @warning_link = warning.link
    
    # @travel_warning = Info.find_by_name(@country_choice.name)

    # @country_choice.name
    
    # twitter = Tweet.new
    # @tweet = twitter.establish_connection.trends_place(woeid)
    
  end
  
end