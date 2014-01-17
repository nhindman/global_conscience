class Comment < ActiveRecord::Base
  attr_accessible :title, :body, :country, :username

  belongs_to :country
  belongs_to :warning
  belongs_to :user 
end