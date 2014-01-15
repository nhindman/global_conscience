class CountryController < ApplicationController

  def display
    woeid = params[:country]
    woeid.to_i
    @country_choice = Country.find_by_woeid(woeid)
    @state_dept = HTTParty.get("http://www.state.gov/api/v1?command=get_country_fact_sheets&fields=content_html&terms&terms=#{@country_choice.name}")
    @travel_warning = HTTParty.get('http://travel.state.gov/_res/rss/TWs.xml')

    # @country_choice.name

    # get_country_fact_sheets(, id:Set, date:Date, terms:Set, bureau:Set)
    # twitter = Tweet.new
    # @tweet = twitter.establish_connection.trends_place(woeid)
    
  end
  
end