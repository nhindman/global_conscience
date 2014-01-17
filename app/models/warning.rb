class Warning < ActiveRecord::Base
  attr_accessible :body, :country, :link, :title, :date

  has_many :users, through: :comment
  has_many :comments 
end
