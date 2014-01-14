class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_countries

  def set_countries
    @country = Country.all
  end


end
