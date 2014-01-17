class PostsController < ApplicationController

  def create do
    title = params[:title]
    body = params[:body]
    warning_id = params[:warning_id]
    Comment.create(title: title, body: body, warning_id: warning_id, user_id: User.id)
    redirect_to 'country/display'
  end

end
