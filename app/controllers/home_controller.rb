class HomeController < ApplicationController

  def index
    # tweet = Tweet.new
    # tweet.establish_connection.trends_place(1)
    @info = Info.all
    @country = Country.all
  end

end
