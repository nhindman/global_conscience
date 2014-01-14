class Comment < ActiveRecord::Base
  attr_accessible :body, :country_id, :user_id

  belongs_to :country
  belongs_to :user
end
