class HomeController < ApplicationController

  def index
    @warning = Warning.find_by_id(25).body
  end

end
