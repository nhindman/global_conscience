class PostsController < ApplicationController

  def create
    title = params[:title]
    body = params[:body]
    country = params[:country].gsub(" ", "%20")
    warning_id = params[:warning_id]
    Comment.create(title: title, body: body, warning_id: warning_id, username: User.name)
    redirect_to "country/display?country=#{country}"
  end

  def edit
    id = params[:id]
    @edit_comment = Comment.find(id)
  end

  def update
    id = params[:id]
    country = params[:country].gsub(" ", "%20")
    edit_comment = Comment.find(id)
    edit_post.title = params[:title]
    edit_post.body = params[:body]
    edit_post.save!
    redirect_to "country/display?country=#{country}"
  end

  def delete
    comment_id = params[:id]
    country = params[:country].gsub(" ", "%20")
    Comment.delete(comment_id)
    redirect_to "country/display?country=#{country}"
  end

end
