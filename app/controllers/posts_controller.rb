class PostsController < ApplicationController

  def create do
    title = params[:title]
    body = params[:body]
    id = params[]
    Comment.create(title: title, body: body, warning_id: 5, user_id: User.id)
    redirect_to 'country/display'
  end

end
