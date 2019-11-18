class UsersController < ApplicationController
  def mypages
    
  end

  def my_post
    @posts = Post.where(user_id: current_user.id)
    @my_posts = Post.page(params[:user_id]).per(9).order(created_at: :desc)
  end

  def my_favorit
    @likes = current_user.liked_posts
  end
end
