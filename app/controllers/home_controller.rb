class HomeController < ApplicationController

  def index
    # tweet = Tweet.new
    # tweet.establish_connection.trends_place(1)
    @info = Info.all
    # @country = Country.order("name asc")
  end

end
