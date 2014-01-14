class Country < ActiveRecord::Base
  attr_accessible :info_id, :name, :tweet_id, :user_id, :woeid

  belongs_to :user
  belongs_to :tweet
  belongs_to :info
end
