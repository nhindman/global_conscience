class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_countries

  def set_countries
    @danger_countries = Warning.order("country asc")
    @countries = Country.order("name asc")
  end



end
