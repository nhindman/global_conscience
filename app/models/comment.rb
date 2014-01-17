class Comment < ActiveRecord::Base
  attr_accessible :title, :body, :warnings_id, :username

  belongs_to :country
  belongs_to :warning
  belongs_to :user 
end