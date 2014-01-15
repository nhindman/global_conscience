class Country < ActiveRecord::Base
  attr_accessible :user_id, :woeid, :name

  belongs_to :warning
  belongs_to :info
  belongs_to :user
end