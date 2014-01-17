class PostsController < ApplicationController

  def create
    title = params[:title]
    body = params[:body]
    country = params[:country].gsub(" ", "%20")
    warning_id = params[:warning_id]
    Comment.create(title: title, body: body, warning_id: warning_id, username: current_user.name)
    redirect_to "country/display?country=#{country}"
  end

  def edit
    comment_id = params[:id]
    @edit_comment = Comment.find(comment_id)
  end

  def update
    comment_id = params[:id]
    country = params[:country].gsub(" ", "%20")
    edit_comment = Comment.find(comment_id)
    edit_comment.title = params[:title]
    edit_comment.body = params[:body]
    edit_comment.save!
    redirect_to "country/display?country=#{country}"
  end

  def delete
    comment_id = params[:id]
    country = params[:country].gsub(" ", "%20")
    Comment.delete(comment_id)
    redirect_to "country/display?country=#{country}"
  end

end
