class PostsController < ApplicationController

  def create do
    title = params[:title]
    body = params[:body]
    Post.create(title: title, body: body, name: User.name)
    redirect_to 'country/display'
  end

end
