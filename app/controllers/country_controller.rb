class CountryController < ApplicationController

  def display
    id = params[:country]
    @country_choice = Country.find_by_id(id)
  end

  

end