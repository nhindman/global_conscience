class CountryController < ApplicationController

  def display
    woeid = params[:country]
    woeid.to_i
    @country_choice = Country.find_by_woeid(woeid)

    binding.pry

    # @country_choice.name

    # get_country_fact_sheets(, id:Set, date:Date, terms:Set, bureau:Set)
    # twitter = Tweet.new
    # @tweet = twitter.establish_connection.trends_place(woeid)
    
  end
  
end