class Tweet < ActiveRecord::Base
  attr_accessible :body

  def establish_connection
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "ftf1qMPsfZ9TJW7jaQ"
      config.consumer_secret     = "pns1t39A78YBgoSZhvA5blvQ6BUho6GfOQO2bsU"
      config.access_token        = "298938773-KpJL8yejHGFPtbyTZORgWe0oLuNp5vSJgih5p3ST"
      config.access_token_secret = "cTR7G9R4DyqGWwjCegYEAH9hp2dwiJEyPZ4RMK0YTbzY5"
    end
    return client
  end
end
