class PostsController < ApplicationController

  def create
    title = params[:title]
    body = params[:body]
    country = params[:country]
    link = country.gsub(" ", "%20")
    # Comment.create(title: title, body: body, country: country, username: current_user.name)
    Comment.create(title: title, body: body, username: current_user.name)
    redirect_to "/country/display?country=#{link}"
  end

  def edit
    comment_id = params[:comment_id]
    @edit_comment = Comment.find(comment_id)
  end

  def update
    comment_id = params[:comment_id]
    edit_comment = Comment.find(comment_id)
    edit_comment.title = params[:title]
    edit_comment.body = params[:body]
    edit_comment.save!
    redirect_to "/home/index"
    # link = edit_comment.country.gsub(" ", "%20")
    # redirect_to "/country/display?country=#{link}"
  end

  def delete
    comment_id = params[:comment_id]
    link = comment.find(comment_id).country.gsub(" ", "%20")
    delete = comment.find(comment_id)
    Comment.delete(delete)
    redirect_to "/country/display?country=#{link}"
  end

end
