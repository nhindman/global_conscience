class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_countries

  def set_countries
    @country = Country.order("name asc")
    # @country = Country.all
  end



end
