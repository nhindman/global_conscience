class HomeController < ApplicationController

  def index
    @tweet = Tweet.all
    @info = Info.all
    @country = Country.all
  end

end
